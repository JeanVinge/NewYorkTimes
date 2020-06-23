
public protocol URLRequestAdapter {
    func adapt(with targetType: TargetType) throws -> URLRequest
}

extension URLRequestAdapter {
    func adapt(with targetType: TargetType) throws -> URLRequest {
        switch targetType.task {
        case .requestParameters(let parameters, let encoding):
            return try encoding.encode(targetType.toURLRequest(), with: parameters)
        case .plain:
            return try URLEncoding().encode(targetType.toURLRequest(), with: [:])
        case .query(parameters: let parameters):
            return try URLEncoding.queryString.encode(targetType.toURLRequest(), with: parameters)
        case .body(parameters: let parameters):
            return try URLEncoding.httpBody.encode(targetType.toURLRequest(), with: parameters)
        }
    }
}

extension TargetType {
    func toURLRequest() throws -> URLRequest {
        try URLRequest(with: self)
    }
}

extension URLRequest {
    init(with targetType: TargetType) throws {
        try self.init(url: targetType.baseURL.appendingPathComponent(targetType.path),
                  method: targetType.method,
                  headers: targetType.headers)
    }
}
