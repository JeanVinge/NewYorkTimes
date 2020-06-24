
@testable import NewsListKit

import XCTest

class NewsListViewControllerTests: XCTestCase {

    func test_viewControllerBackground() {

        let provider = MockNewYorkTimesProvider(type: .emailed)
        let viewModel = NewsListViewModel(provider: provider)
        let viewController = NewsListViewController(viewModel)

        XCTAssertEqual(viewController.view.backgroundColor, UIColor.systemColor.background)
    }

    func test_viewControllerRouterNotNil() {

        let provider = MockNewYorkTimesProvider(type: .emailed)
        let viewModel = NewsListViewModel(provider: provider)
        let viewController = NewsListViewController(viewModel)
        viewController.loadView()
        XCTAssertNotNil(viewController.newsListView.route)
    }

    func test_didSelectItem() {

        let route = MockNewsListControllerRoute()
        let provider = MockNewYorkTimesProvider(type: .emailed)
        let viewModel = NewsListViewModel(provider: provider,
                                          route: route)
        let viewController = NewsListViewController(viewModel)

        let expec = expectation(description: "Expec did select item at")

        viewModel.requestList().observe { _ in
            viewController.didSelect(at: 1)
            XCTAssertTrue(route.didSelectWasCalled)
            expec.fulfill()
        }

        wait(for: [expec], timeout: 0.5)
    }
}
