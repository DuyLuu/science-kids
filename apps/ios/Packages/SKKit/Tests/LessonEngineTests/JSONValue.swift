import Foundation

/// Any JSON value, for reading vector files and comparing results exactly
/// (objects by key set, arrays by order, `null` distinct from a missing key).
enum JSONValue: Hashable, Sendable, Codable, CustomStringConvertible {
    case null
    case bool(Bool)
    case number(Double)
    case string(String)
    case array([JSONValue])
    case object([String: JSONValue])

    init(from decoder: any Decoder) throws {
        let c = try decoder.singleValueContainer()
        if c.decodeNil() {
            self = .null
        } else if let value = try? c.decode(Bool.self) {
            self = .bool(value)
        } else if let value = try? c.decode(Double.self) {
            self = .number(value)
        } else if let value = try? c.decode(String.self) {
            self = .string(value)
        } else if let value = try? c.decode([JSONValue].self) {
            self = .array(value)
        } else {
            self = .object(try c.decode([String: JSONValue].self))
        }
    }

    func encode(to encoder: any Encoder) throws {
        var c = encoder.singleValueContainer()
        switch self {
        case .null: try c.encodeNil()
        case .bool(let value): try c.encode(value)
        case .number(let value): try c.encode(value)
        case .string(let value): try c.encode(value)
        case .array(let value): try c.encode(value)
        case .object(let value): try c.encode(value)
        }
    }

    subscript(key: String) -> JSONValue? {
        if case .object(let object) = self { object[key] } else { nil }
    }

    var object: [String: JSONValue]? {
        if case .object(let object) = self { object } else { nil }
    }

    var array: [JSONValue]? {
        if case .array(let array) = self { array } else { nil }
    }

    var string: String? {
        if case .string(let string) = self { string } else { nil }
    }

    var bool: Bool? {
        if case .bool(let bool) = self { bool } else { nil }
    }

    var int: Int? {
        if case .number(let number) = self, number.rounded() == number { Int(number) } else { nil }
    }

    /// Compact JSON with sorted keys, for messages.
    var description: String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys, .withoutEscapingSlashes]
        guard let data = try? encoder.encode(self), let text = String(data: data, encoding: .utf8) else {
            return "<unencodable>"
        }
        return text
    }

    /// Decodes a `Decodable` from this value (round trip through JSON).
    func decode<T: Decodable>(_ type: T.Type) throws -> T {
        try JSONDecoder().decode(type, from: JSONEncoder().encode(self))
    }

    static func parse(_ data: Data) throws -> JSONValue {
        try JSONDecoder().decode(JSONValue.self, from: data)
    }
}
