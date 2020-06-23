// This file is based on the implementation from Alamofire's Response
// https://github.com/Alamofire/Alamofire/blob/master/Source/Response.swift
//

public struct Response: CustomDebugStringConvertible, Equatable {

    private var result: Result<Data, Error>
    public var data: Data { (try? result.get()) ?? Data() }
    public var response: HTTPURLResponse

    public var debugDescription: String { description }
    public var description: String { "Status Code: \(response.statusCode), Data Length: \(data.count))" }

    init(data: Data? = nil,
         response: URLResponse? = nil,
         error: Error? = nil) {
        if let error = error {
            self.result = .failure(error)
        } else {
            self.result = .success(data ?? Data())
        }
        self.response = response as? HTTPURLResponse ?? HTTPURLResponse()
    }

    public static func == (lhs: Response, rhs: Response) -> Bool { lhs.response == rhs.response }

    func JSON(_ options: JSONSerialization.ReadingOptions) throws -> Any { try JSONSerialization.jsonObject(with: data, options: options) }

    func map<D: Decodable>(_ type: D.Type) throws -> D { try JSONDecoder().decode(D.self, from: data) }

    func handleStatusCode() throws -> Response {
        switch response.statusCode {
        case 200...299:
            return self
        case 400...499:
            guard let apiErr = APIErrors.ClientError(rawValue: response.statusCode) else { throw APIErrors.unknowError }
            throw APIErrors.clientError(clientError: apiErr)
        case 500...599:
            guard let apiErr = APIErrors.ServerError(rawValue: response.statusCode) else { throw APIErrors.unknowError }
            throw APIErrors.serverError(server: apiErr)
        default:
            throw APIErrors.statusCode(self)
        }
    }
}

