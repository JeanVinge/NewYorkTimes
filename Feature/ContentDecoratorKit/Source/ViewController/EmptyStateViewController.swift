
import UIKit
import UI

public final class EmptyStateViewController: UIViewController {

    // MARK: Var

    private lazy var emptyStateView = EmptyStateView()

    // MARK: Init

    public override func loadView() {
        self.view = emptyStateView
    }
}

extension EmptyStateViewController: ContentConvertible {

    public typealias Content = EmptyStateViewModel

    public func setup(with data: EmptyStateViewModel) {
        emptyStateView.setup(with: data)
    }

    public func clear() {
        emptyStateView.clear()
    }
}
