
extension URLSessionConfiguration {

    // MARK: Var

    class var defaultCoreAPI: URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = APICoreConstants.timeoutInterval
        configuration.timeoutIntervalForResource = APICoreConstants.timeoutInterval
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return configuration
    }
}
