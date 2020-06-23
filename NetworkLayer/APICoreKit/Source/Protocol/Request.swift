
public protocol Request {
    @discardableResult
    func request(_ targetType: TargetType,
                 completion: @escaping CoreAPI.RequestCompletion) throws -> RequestTask
}
