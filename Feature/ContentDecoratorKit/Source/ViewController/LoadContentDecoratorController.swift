
import UIKit
import UI

public class LoadContentDecoratorController: UIViewController {

    // MARK: Var

    private let contentViewController: UIViewController
    private lazy var loadingViewController = LoadingViewController()
    private lazy var emptyStateViewController = EmptyStateViewController()

    // MARK: Init

    public init(_ contentViewController: UIViewController) {
        self.contentViewController = contentViewController
        super.init(nibName: nil, bundle: nil)
        title = contentViewController.title
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        self.view = UIView()
        add(child: contentViewController)
    }

    private func add(child viewController: UIViewController) {
        
        addChild(viewController)

        view.addSubview(viewController.view)

        viewController.view.layout {
            $0.top.equalToSuperView()
            $0.leading.equalToSuperView()
            $0.trailing.equalToSuperView()
            $0.bottom.equalToSuperView()
        }

        viewController.didMove(toParent: self)
    }

    private func remove(child viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }

}

extension LoadContentDecoratorController: LoadingStateResponder {
    public func change(with state: LoadingState) {
        switch state {
        case let .emptyState(viewModel):
            loadingViewController.stopLoading()
            emptyStateViewController.setup(with: viewModel)
            add(child: emptyStateViewController)
            remove(child: loadingViewController)
            remove(child: contentViewController)
        case .finished:
            loadingViewController.stopLoading()
            add(child: contentViewController)
            remove(child: loadingViewController)
            remove(child: emptyStateViewController)
        case .loading:
            add(child: loadingViewController)
            remove(child: emptyStateViewController)
            remove(child: contentViewController)
            loadingViewController.startLoading()
        }
    }
}

extension LoadContentDecoratorController: EmptyStateButtonResponder {
    public func onTapEmptyStateButton() {
        (contentViewController as? EmptyStateButtonResponder)?.onTapEmptyStateButton()
    }
}
