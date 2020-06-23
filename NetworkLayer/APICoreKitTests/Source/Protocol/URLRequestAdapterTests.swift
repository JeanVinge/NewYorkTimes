
@testable import APICoreKit

import XCTest

struct MockURLRequestAdapter: URLRequestAdapter {

}

class URLRequestAdapterTests: XCTestCase {

    func test_adaptQuery() throws {
        let adapter = MockURLRequestAdapter()
        let target = MockTargetType.mock(.get,
                                         .query(parameters: ["test":"test"]))
        let request = try adapter.adapt(with: target)
        XCTAssertTrue(request.description.contains("test=test"))
    }

    func test_adaptBody() throws {
        let adapter = MockURLRequestAdapter()
        let target = MockTargetType.mock(.get,
                                         .body(parameters: ["test": "test"]))
        let request = try adapter.adapt(with: target)
        XCTAssertTrue(request.httpBody != nil)
    }

    func test_adaptPlain() throws {
        let adapter = MockURLRequestAdapter()
        let request = try adapter.adapt(with: MockTargetType.mock(.get, .plain))

        XCTAssertNotNil(request.urlRequest)
    }
}
