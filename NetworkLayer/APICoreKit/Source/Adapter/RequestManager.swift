
import Future

public protocol RequestManager {

    var session: Request { get set }
    var task: RequestTask? { get set }

    mutating func request(_ targetType: TargetType) -> Future<Response>
}

public extension RequestManager {

    mutating func request(_ targetType: TargetType) -> Future<Response> {
        let promise = Promise<Response>()
        makeRequest(targetType) { response in
            do {
                promise.resolve(with: try response.handleStatusCode())
            } catch let error {
                promise.reject(with: error)
            }
        }
        return promise
    }

    private mutating func makeRequest(_ targetType: TargetType,
                                      completion: @escaping CoreAPI.ResponseCompletion) {
        do {
            self.task = try session.request(targetType, completion: { (data, response, error) in
                completion(
                    .init(
                        data: data,
                        response: response,
                        error: error
                    )
                )
            })
            task?.resume()
        } catch let error {
            completion(.init(error: error))
        }
    }
}
