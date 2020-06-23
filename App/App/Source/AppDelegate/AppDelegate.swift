import UIKit
import AppFlowKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Var

    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    // MARK: Init

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        MainCoordinator(window: window).start()
        return true
    }
}
