
import UIKit
import UI

public class LoadingViewController: UIViewController {

    // MARK: Var

    private lazy var loadingView = LoadingView()

    // MARK: Init

    public override func loadView() {
        view = loadingView
    }

    public func startLoading() { loadingView.startLoading() }
    public func stopLoading() { loadingView.stopLoading() }
}
