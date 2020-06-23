import UIKit
import SafariServices

struct NewsDetailCoordinator: Coordinator {

    // MARK: Var

    let viewController: UIViewController
    let url: URL

    // MARK: Init

    func start() {

        let configuration = SFSafariViewController
            .Configuration()
            .with
            .entersReaderIfAvailable(true)
            .build()

        let viewController = SFSafariViewController(url: url,
                                                    configuration: configuration)
            .with
            .modalPresentationStyle(.formSheet)
            .dismissButtonStyle(.close)
            .build()

        viewController
            .present(viewController,
                     animated: true)
    }
}
