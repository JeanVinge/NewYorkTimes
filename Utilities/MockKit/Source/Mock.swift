

fileprivate class BundleHack: NSObject {}
fileprivate let currentBundle = Bundle(for: type(of: BundleHack()))

public enum MockFile: String {
    case empty
    case news
    case emailed
    case shared
    case viewed
}

public enum Mock<T: Decodable> {
    case from(enum: MockFile)
    case file(name: String, ext: String = "json", bundle: Bundle, decoder: JSONDecoder)
    case string(value: String, decoder: JSONDecoder)
    case hardCode(value: T)


    public static func content<T>(mockType: Mock<T>) throws -> T {
        return try mockType.content()
    }

    public func data() -> Data {
        switch self {
        case let .from(value):
            return Data(from: value.rawValue, in: currentBundle)
        case let .file(name, ext, bundle, _):
            return Data(from: name, ext: ext, bundle: bundle)
        case let .string(value, _):
            return value.data(using: .utf8)!
        default:
            fatalError("MockType case not implemented")
        }
    }
    public func content() throws -> T {
        switch self {
        case .hardCode(let value):
            return value
        case let .file(_, _, _, decoder):
            return try decoder.decode(T.self, from: data())
        case let .string( _, decoder):
            return try decoder.decode(T.self, from: data())
        case .from:
            return try JSONDecoder().decode(T.self, from: Data())
        }
    }
}
