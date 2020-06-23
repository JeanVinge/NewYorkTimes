
import NewsDomainKit
import APICoreKit
import MockKit
import Future

struct MockRequestTask: RequestTask {
    func resume() {}
    func cancel() {}
}

struct MockRequest: Request {

    var file: MockFile

    func request(_ targetType: TargetType, completion: @escaping CoreAPI.RequestCompletion) throws -> RequestTask {
        completion(Mock<NewsList>.from(enum: file).data(), nil, nil)
        return MockRequestTask()
    }
}

struct MockRequestManager: RequestManager {
    var session: Request
    var task: RequestTask?

    init(_ file: MockFile) {
        session = MockRequest(file: file)
    }
}
