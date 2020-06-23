
struct SessionURLRequestAdapter: URLRequestAdapter {}

extension URLSession: Request {
    public func request(_ targetType: TargetType,
                        completion: @escaping CoreAPI.RequestCompletion) throws -> RequestTask {
        dataTask(with: try SessionURLRequestAdapter().adapt(with: targetType),
                        completionHandler: completion)
    }
}
