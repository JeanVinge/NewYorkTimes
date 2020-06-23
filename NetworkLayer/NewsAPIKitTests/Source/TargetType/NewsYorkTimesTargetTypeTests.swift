
@testable import NewsAPIKit
import APICoreKit

import XCTest

class NewYorkTimesTargetTypeTests: XCTestCase {

    func enforceParameters() {
        let target = NewYorkTimesTargetType.list(.emailed)
        XCTAssertEqual(target.baseURL.absoluteString, "https://api.nytimes.com/")
        XCTAssertEqual(target.method, .get)
        XCTAssertEqual(target.path, "svc/mostpopular/v2/emailed/7.json")
        XCTAssertEqual(target.task, Task.plain)
    }
}
