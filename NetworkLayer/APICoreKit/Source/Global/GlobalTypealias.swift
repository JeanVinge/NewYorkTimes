
public struct CoreAPI {
    public typealias HTTPHeaders = [String: String]
    public typealias Parameters = [String: Any]
    
    public typealias RequestCompletion = (Data?, URLResponse?, Error?) -> Void
    public typealias ResponseCompletion = (Response) -> Void
}
