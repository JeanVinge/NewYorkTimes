
public enum APIErrors: Error {
    case invalidURL(url: URLConvertible)
    case unknowError
    case parameterEncodingFailed(reason: ParameterEncodingFailureReason)
    case clientError(clientError: ClientError)
    case serverError(server: ServerError)
    case statusCode(_ response: Response)

    public enum ClientError: Int {
        case badRequest = 400
        case unauthorized = 401
        case forbidden = 403
        case notFound = 404
        case methodNotAllowed = 405
        case notAcceptable = 406
        case requestTimeout = 408
        case conflict = 409
        case gone = 410
    }

    public enum ServerError: Int {
        case internalServerError = 500
        case notImplemented = 501
        case badGateway = 502
        case serviceUnavailable = 503
        case gatewayTimeout = 504
    }

    public enum ParameterEncodingFailureReason {
        case missingURL
        case jsonEncodingFailed(error: Error)
    }
}
