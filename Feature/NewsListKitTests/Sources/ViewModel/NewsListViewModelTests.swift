
@testable import NewsListKit

import XCTest

class NewsListViewModelTests: XCTestCase {

    func test_requestList() {
        let viewModel = NewsListViewModel(provider: MockNewYorkTimesProvider(type: .emailed))

        let expecResquestList = expectation(description: "Expec request list with success")

        viewModel.requestList().observe { result in
            switch result {
            case .success:
                expecResquestList.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }

        wait(for: [expecResquestList], timeout: 0.5)
    }

    func test_pullToRefresh() {

        let viewModel = NewsListViewModel(provider: MockNewYorkTimesProvider(type: .emailed))
        
        let expecPullToRefresh = expectation(description: "Expec pull to refresh with success")

        viewModel.pullToRefresh().observe { result in
            switch result {
            case .success:
                expecPullToRefresh.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }

        wait(for: [expecPullToRefresh], timeout: 0.5)
    }

    func test_didSelect() {
        let route = MockNewsListControllerRoute()
        let viewModel = NewsListViewModel(provider: MockNewYorkTimesProvider(type: .emailed),
                                          route: route)

        let expecResquestList = expectation(description: "Expec request list with success")

        viewModel.requestList().observe { result in
            switch result {
            case .success:
                expecResquestList.fulfill()
                viewModel.didSelect(at: 1, in: UIViewController())
                XCTAssertTrue(route.didSelectWasCalled)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }

        wait(for: [expecResquestList], timeout: 0.5)
    }
}
