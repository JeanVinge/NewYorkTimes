
import XCTest

class RequestManagerTests: XCTestCase {

    func test_ifRequestSucceded() {

        var requestManager = MockRequestManager(mockResponse: .init(data: Data(), response: URLResponse(), error: nil))

        let expec = expectation(description: "expec request success")
        
        requestManager.request(MockTargetType.mock()).observe { response in
            expec.fulfill()
        }
        wait(for: [expec], timeout: 0.5)
    }
}
