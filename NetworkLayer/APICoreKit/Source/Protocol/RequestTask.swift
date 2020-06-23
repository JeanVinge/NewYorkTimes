
public protocol RequestTask {
    func resume()
    func cancel()
}

extension URLSessionDataTask: RequestTask {}
