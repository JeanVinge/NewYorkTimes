import UIKit
import NewsDomainKit
import NewsListKit
import ContentDecoratorKit

struct NewsListCoordinator: Coordinator, NewsListViewControllerRoute {

    // MARK: Var

    let tabBarController: UITabBarController

    // MARK: Init

    func start() {
        let vcs = NewsType
            .allCases
            .map { LoadContentDecoratorController(
                NewsListViewController(NewsListViewModel(type: $0,
                                                         route: self))
                ) }

        tabBarController
            .setViewControllers(vcs,
                                animated: true)
    }

    func didSelect(in viewController: UIViewController,
                   with news: News) {
        NewsDetailCoordinator(viewController: viewController,
                              url: news.url).start()
    }
}
