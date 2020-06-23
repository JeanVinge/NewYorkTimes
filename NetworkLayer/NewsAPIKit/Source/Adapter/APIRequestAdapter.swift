
import APICoreKit

public struct APIRequestAdapter: RequestManager {
    public var task: RequestTask? = nil
    public var session: Request = URLSessionAdapter.default
}
