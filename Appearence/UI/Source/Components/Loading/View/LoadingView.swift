
import UIKit
import ColorKit

public final class LoadingView: UIView, ConfigurableView {

    // MARK: Var

    private lazy var activityIndicatorView = UIActivityIndicatorView()
        .with
        .build()

    // MARK: Init

    public init() {
        super.init(frame: .zero)
        initLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func initSubviews() {
        backgroundColor = UIColor.systemColor.background
        addSubview(activityIndicatorView)
    }

    public func initConstraints() {
        activityIndicatorView.layout {
            $0.centerX.equalToSuperView()
            $0.centerY.equalToSuperView()
        }
    }

    public func startLoading() { activityIndicatorView.startAnimating() }

    public func stopLoading() { activityIndicatorView.stopAnimating() }
}
