
@testable import NewsListKit

import UIKit
import NewsDomainKit

class MockNewsListControllerRoute: NewsListViewControllerRoute {

    var didSelectWasCalled = false

    func didSelect(in viewController: UIViewController, with news: News) {
        didSelectWasCalled.toggle()
    }
}
