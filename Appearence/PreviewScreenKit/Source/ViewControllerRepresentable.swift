
#if DEBUG
import SwiftUI

final class ViewContainerController: UIViewController {

    // MARK: Var

    let baseView: UIView

    // MARK: Init

    public init(_ baseView: UIView) {
        self.baseView = baseView
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        view = baseView
    }
}

public struct ViewControllerRepresentable: UIViewControllerRepresentable {

    // MARK: Var

    let viewController: UIViewController

    // MARK: Init

    public init(viewController: UIViewController) {
        self.viewController = viewController
    }

    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}

    @available(iOS 13.0.0, *)
    public func makeUIViewController(context: Context) -> UIViewController {
        viewController
    }
}

@available(iOS 13.0, *)
public struct ViewContainerRepresentable {

    // MARK: Var

    public let view: UIView

    public init(view: UIView) {
        self.view = view
    }

    // MARK: Init

    public func controller() -> ViewControllerRepresentable {
        .init(viewController: ViewContainerController(view))
    }
}
#endif
