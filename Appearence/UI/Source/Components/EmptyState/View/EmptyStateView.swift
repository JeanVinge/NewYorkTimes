
import UIKit

public final class EmptyStateView: UIView, ConfigurableView {

    // MARK: Var

    private lazy var titleLabel = UILabel()
        .with
        .font(.systemFont(ofSize: 16, weight: .regular))
        .textAlignment(.center)
        .textColor(UIColor.systemColor.title)
        .build()

    private lazy var button: UIButton = {
        let b = UIButton()
        b.setTitleColor(.systemBlue, for: .normal)
        b.titleLabel?.font = .systemFont(ofSize: 14)
        return b
    }()

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
        addSubviews(titleLabel,
                    button)
        button.addTarget(self, action: #selector(onTap), for: .touchUpInside)
    }

    public func initConstraints() {
        titleLabel.layout {
            $0.centerY.equalToSuperView()
            $0.leading.equalToSuperView(32)
            $0.trailing.equalToSuperView(-32)
        }
        button.layout {
            $0.top.equal(to: titleLabel.bottomAnchor)
            $0.centerX.equal(to: titleLabel.centerXAnchor)
        }
    }

    // MARK: Action

    @objc private func onTap() {
        find(EmptyStateButtonResponder.self)?.onTapEmptyStateButton()
    }
}

extension EmptyStateView: ContentConvertible {

    public typealias Content = EmptyStateViewModel

    public func setup(with data: EmptyStateViewModel) {
        titleLabel.text = data.title
        button.setTitle(data.button, for: .normal)
    }

    public func clear() {
        titleLabel.text = nil
        button.setTitle("", for: .normal)
    }
}
