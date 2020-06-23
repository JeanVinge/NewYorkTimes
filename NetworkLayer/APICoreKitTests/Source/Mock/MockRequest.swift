
@testable import APICoreKit

import XCTest

enum MockTargetType {
    case mock(APICoreKit.Method = .get, Task? = nil)
}

extension MockTargetType: TargetType {
    var baseURL: URL { URL(string: "https://example.com")! }
    var path: String { "" }
    var method: APICoreKit.Method {
        switch self {
        case let .mock(method, _):
            return method
        }
    }
    var task: Task {
        switch self {
        case let .mock(_, task):
            return task == nil ? .plain : task!
        }
    }
}

struct MockRequestTask: RequestTask {
    func resume() {}
    func cancel() {}
}

struct MockResponse {
    let data: Data?
    let response: URLResponse?
    let error: Error?
}

struct MockRequest: Request {

    let mockResponse: MockResponse

    func request(_ targetType: TargetType,
                 completion: @escaping CoreAPI.RequestCompletion) throws -> RequestTask {
        completion(mockResponse.data,
                   mockResponse.response,
                   mockResponse.error)
        return MockRequestTask()
    }
}

struct MockRequestManager: RequestManager {

    var session: Request
    var task: RequestTask?

    init(mockResponse: MockResponse) {
        session = MockRequest(mockResponse: mockResponse)
    }
}
