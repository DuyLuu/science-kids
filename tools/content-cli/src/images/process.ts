// Source picture -> pack JPEG (contract of SK-033): rotated by EXIF, cropped (crop is a fraction
// of the rotated picture), longest edge at most 1024 px (never enlarged), sRGB, transparent parts
// on white, JPEG quality 82 (mozjpeg), no metadata (EXIF, GPS, ICC). Uses sharp (libvips).
import sharp from "sharp";
import type { Change } from "./cache.ts";
import { PROCESS, type Crop } from "./selection.ts";

export type Processed = { jpeg: Buffer; width: number; height: number; original: { width: number; height: number; format: string }; changes: Change[] };

/** Pixel rectangle of a fractional crop on a width × height picture (at least 1 px, inside the picture). */
export function cropRect(crop: Crop, width: number, height: number): { left: number; top: number; width: number; height: number } {
  const left = Math.min(width - 1, Math.max(0, Math.round(crop.left * width)));
  const top = Math.min(height - 1, Math.max(0, Math.round(crop.top * height)));
  return {
    left,
    top,
    width: Math.max(1, Math.min(width - left, Math.round(crop.width * width))),
    height: Math.max(1, Math.min(height - top, Math.round(crop.height * height))),
  };
}

export async function processImage(input: Buffer, crop?: Crop): Promise<Processed> {
  const meta = await sharp(input).metadata();
  if (!meta.format || !meta.width || !meta.height) throw new Error("không đọc được ảnh (định dạng lạ hoặc file hỏng)");
  // Pass 1: upright 8-bit sRGB pixels, alpha flattened on white. Raw keeps it lossless and
  // makes the crop apply to the picture as people see it (after EXIF rotation).
  const upright = await sharp(input)
    .rotate()
    .flatten({ background: PROCESS.alpha_background })
    .toColourspace(PROCESS.colourspace)
    .raw({ depth: "uchar" })
    .toBuffer({ resolveWithObject: true });
  const { width, height, channels } = upright.info;
  let image = sharp(upright.data, { raw: { width, height, channels } });
  const changes: Change[] = [];
  let [w, h] = [width, height];
  if (crop && !(crop.left === 0 && crop.top === 0 && crop.width === 1 && crop.height === 1)) {
    const rect = cropRect(crop, width, height);
    image = image.extract(rect);
    [w, h] = [rect.width, rect.height];
    changes.push("cropped");
  }
  if (Math.max(w, h) > PROCESS.max_edge) {
    image = image.resize({ width: PROCESS.max_edge, height: PROCESS.max_edge, fit: "inside", withoutEnlargement: true });
    changes.push("resized");
  }
  const out = await image.toColourspace(PROCESS.colourspace).jpeg({ quality: PROCESS.quality, mozjpeg: PROCESS.mozjpeg }).toBuffer({ resolveWithObject: true });
  return { jpeg: out.data, width: out.info.width, height: out.info.height, original: { width, height, format: meta.format }, changes };
}
