// Bộ validate JSON Schema 2020-12 rút gọn, không cần npm install.
// Chỉ hỗ trợ các từ khoá mà vector.schema.json dùng; gặp từ khoá lạ thì ném lỗi
// (để không âm thầm bỏ qua luật). Khi có Ajv (node_modules của packages/content-schema),
// check-vectors.mjs chạy thêm Ajv và hai bên phải cùng kết luận.

const ANNOTATIONS = new Set(['$schema', '$id', 'title', 'description', '$defs', '$comment']);
const KEYWORDS = new Set([
  '$ref', 'type', 'const', 'enum', 'pattern', 'minLength', 'maxLength', 'minimum', 'maximum',
  'required', 'properties', 'additionalProperties', 'propertyNames', 'minProperties',
  'items', 'minItems', 'maxItems', 'uniqueItems', 'allOf', 'anyOf', 'oneOf', 'not', 'if', 'then', 'else',
]);

function deepEqual(a, b) {
  if (a === b) return true;
  if (typeof a !== typeof b || a === null || b === null) return false;
  if (Array.isArray(a)) return Array.isArray(b) && a.length === b.length && a.every((x, i) => deepEqual(x, b[i]));
  if (typeof a === 'object') {
    if (Array.isArray(b)) return false;
    const ka = Object.keys(a).sort();
    const kb = Object.keys(b).sort();
    return deepEqual(ka, kb) && ka.every((k) => deepEqual(a[k], b[k]));
  }
  return false;
}

function typeOf(x) {
  if (x === null) return 'null';
  if (Array.isArray(x)) return 'array';
  if (Number.isInteger(x)) return 'integer';
  return typeof x; // number, string, boolean, object
}

function typeMatches(expected, x) {
  const t = typeOf(x);
  const list = Array.isArray(expected) ? expected : [expected];
  return list.some((e) => e === t || (e === 'number' && t === 'integer'));
}

const esc = (k) => String(k).replace(/~/g, '~0').replace(/\//g, '~1');

export function createValidator(rootSchema) {
  const regexCache = new Map();
  const re = (p) => {
    if (!regexCache.has(p)) regexCache.set(p, new RegExp(p, 'u'));
    return regexCache.get(p);
  };

  function resolve(ref) {
    if (!ref.startsWith('#/')) throw new Error(`chỉ hỗ trợ $ref nội bộ: ${ref}`);
    let node = rootSchema;
    for (const raw of ref.slice(2).split('/')) {
      const key = raw.replace(/~1/g, '/').replace(/~0/g, '~');
      if (node == null || !(key in node)) throw new Error(`$ref không tồn tại: ${ref}`);
      node = node[key];
    }
    return node;
  }

  function check(schema, x, path, errs) {
    if (schema === true) return;
    if (schema === false) { errs.push({ path, message: 'không được có giá trị ở đây' }); return; }
    for (const k of Object.keys(schema)) {
      if (!KEYWORDS.has(k) && !ANNOTATIONS.has(k)) throw new Error(`mini-json-schema không hỗ trợ từ khoá "${k}"`);
    }
    if (schema.$ref) check(resolve(schema.$ref), x, path, errs);
    if ('type' in schema && !typeMatches(schema.type, x)) {
      errs.push({ path, message: `phải có kiểu ${JSON.stringify(schema.type)}, đang là ${typeOf(x)}` });
      return;
    }
    if ('const' in schema && !deepEqual(x, schema.const)) errs.push({ path, message: `phải bằng ${JSON.stringify(schema.const)}` });
    if (schema.enum && !schema.enum.some((e) => deepEqual(e, x))) errs.push({ path, message: `phải là một trong ${JSON.stringify(schema.enum)}` });

    if (typeof x === 'string') {
      const len = [...x].length;
      if (schema.pattern && !re(schema.pattern).test(x)) errs.push({ path, message: `không khớp pattern ${schema.pattern}: ${JSON.stringify(x)}` });
      if (schema.minLength != null && len < schema.minLength) errs.push({ path, message: `ngắn hơn ${schema.minLength} ký tự` });
      if (schema.maxLength != null && len > schema.maxLength) errs.push({ path, message: `dài hơn ${schema.maxLength} ký tự` });
    }
    if (typeof x === 'number') {
      if (schema.minimum != null && x < schema.minimum) errs.push({ path, message: `nhỏ hơn ${schema.minimum}` });
      if (schema.maximum != null && x > schema.maximum) errs.push({ path, message: `lớn hơn ${schema.maximum}` });
    }
    if (typeOf(x) === 'object') {
      const keys = Object.keys(x);
      for (const r of schema.required ?? []) if (!(r in x)) errs.push({ path, message: `thiếu trường bắt buộc "${r}"` });
      if (schema.minProperties != null && keys.length < schema.minProperties) errs.push({ path, message: `cần ít nhất ${schema.minProperties} trường` });
      const props = schema.properties ?? {};
      for (const k of keys) {
        const p = `${path}/${esc(k)}`;
        if (schema.propertyNames) check(schema.propertyNames, k, `${p} (tên trường)`, errs);
        if (k in props) check(props[k], x[k], p, errs);
        else if ('additionalProperties' in schema) {
          if (schema.additionalProperties === false) errs.push({ path: p, message: 'trường không được phép' });
          else check(schema.additionalProperties, x[k], p, errs);
        }
      }
    }
    if (Array.isArray(x)) {
      if (schema.minItems != null && x.length < schema.minItems) errs.push({ path, message: `cần ít nhất ${schema.minItems} phần tử` });
      if (schema.maxItems != null && x.length > schema.maxItems) errs.push({ path, message: `nhiều nhất ${schema.maxItems} phần tử` });
      if (schema.uniqueItems) {
        for (let i = 0; i < x.length; i++) for (let j = i + 1; j < x.length; j++) {
          if (deepEqual(x[i], x[j])) errs.push({ path, message: `phần tử ${i} và ${j} trùng nhau` });
        }
      }
      if (schema.items) x.forEach((el, i) => check(schema.items, el, `${path}/${i}`, errs));
    }
    for (const s of schema.allOf ?? []) check(s, x, path, errs);
    if (schema.anyOf) {
      const ok = schema.anyOf.some((s) => { const e = []; check(s, x, path, e); return e.length === 0; });
      if (!ok) errs.push({ path, message: 'không khớp nhánh nào của anyOf' });
    }
    if (schema.oneOf) {
      const results = schema.oneOf.map((s) => { const e = []; check(s, x, path, e); return e; });
      const passed = results.filter((e) => e.length === 0).length;
      if (passed !== 1) {
        errs.push({ path, message: `phải khớp đúng 1 nhánh của oneOf, đang khớp ${passed}` });
        if (passed === 0) {
          // Gợi ý: nhánh có ít lỗi nhất.
          const best = results.reduce((a, b) => (b.length < a.length ? b : a));
          for (const e of best) errs.push({ path: e.path, message: `(nhánh gần nhất) ${e.message}` });
        }
      }
    }
    if (schema.not) {
      const e = []; check(schema.not, x, path, e);
      if (e.length === 0) errs.push({ path, message: 'không được khớp schema trong not' });
    }
    if (schema.if) {
      const e = []; check(schema.if, x, path, e);
      if (e.length === 0) { if (schema.then) check(schema.then, x, path, errs); }
      else if (schema.else) check(schema.else, x, path, errs);
    }
  }

  return function validate(data) {
    const errs = [];
    check(rootSchema, data, '', errs);
    return errs;
  };
}

export { deepEqual };
