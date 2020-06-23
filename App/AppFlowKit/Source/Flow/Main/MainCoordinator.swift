import UIKit

public struct MainCoordinator: Coordinator {

    // MARK: Var

    public let window: UIWindow?

    // MARK: Init

    public init(window: UIWindow?) {
        self.window = window
    }

    public func start() {
        TabBarCoordinator(window: window)
            .start()

        window?
            .makeKeyAndVisible()
    }
}
