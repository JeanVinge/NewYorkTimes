
public enum Method: String {
    case post
    case put
    case get
    case delete
    case patch
    case head
}

extension Method {
    var name: String { rawValue.uppercased() }
}
