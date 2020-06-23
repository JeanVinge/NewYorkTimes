import UIKit
import UI

struct TabBarCoordinator: Coordinator {

    // MARK: Var

    let window: UIWindow?

    // MARK: Init

    func start() {

        let tabBarController = UITabBarController()
        tabBarController.tabBar.isTranslucent = false

        window?.rootViewController = tabBarController

        NewsListCoordinator(tabBarController: tabBarController)
            .start()
    }
}
