
@testable import NewsAPIKit

import XCTest

class NewYorkTimesFetcherTests: XCTestCase {

    func test_emailedNews() {

        let expec = expectation(description: "Expec that request gives emailed list")

        var fetcher = NewYorkTimesFetcher(MockRequestManager(.emailed))
        fetcher.newsList().observe { result in
            switch result {
            case let .success(list):
                XCTAssert(list.count > 0)
                expec.fulfill()
            case let .failure(error):
                XCTFail(error.localizedDescription)
            }
        }
        wait(for: [expec], timeout: 0.5)
    }

    func test_sharedNews() {

        let expec = expectation(description: "Expec that request gives shared list")

        var fetcher = NewYorkTimesFetcher(MockRequestManager(.shared))
        fetcher.newsList().observe { result in
            switch result {
            case let .success(list):
                XCTAssert(list.count > 0)
                expec.fulfill()
            case let .failure(error):
                XCTFail(error.localizedDescription)
            }
        }
        wait(for: [expec], timeout: 0.5)
    }

    func test_viewedNews() {

        let expec = expectation(description: "Expec that request gives viewed list")

        var fetcher = NewYorkTimesFetcher(MockRequestManager(.viewed))
        fetcher.newsList().observe { result in
            switch result {
            case let .success(list):
                XCTAssert(list.count > 0)
                expec.fulfill()
            case let .failure(error):
                XCTFail(error.localizedDescription)
            }
        }
        wait(for: [expec], timeout: 0.5)
    }

    func test_emptyNews() {

        let expec = expectation(description: "Expec that request gives empty list")

            var fetcher = NewYorkTimesFetcher(MockRequestManager(.empty))
            fetcher.newsList().observe { result in
                switch result {
                case let .success(list):
                    XCTAssert(list.count == 0)
                    expec.fulfill()
                case let .failure(error):
                    XCTFail(error.localizedDescription)
                }
            }
            wait(for: [expec], timeout: 0.5)
    }
}
