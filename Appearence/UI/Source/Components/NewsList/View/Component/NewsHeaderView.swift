
import UIKit
import Layout
import ColorKit

public final class NewsHeaderView: UIView, ConfigurableView {

    // MARK: Var

    private lazy var titleLabel = UILabel()
        .with
        .font(.systemFont(ofSize: 22, weight: .bold))
        .textAlignment(.center)
        .build()

    private lazy var separatorView = UIView()
        .with
        .backgroundColor(UIColor.systemColor.separator)
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
        addSubviews(titleLabel,
                    separatorView)
    }

    public func initConstraints() {

        titleLabel.layout {
            $0.leading.equalToSuperView(32)
            $0.trailing.equalToSuperView(-32)
            $0.bottom.equalToSuperView(-12)
        }

        separatorView.layout {
            $0.leading.equalToSuperView()
            $0.trailing.equalToSuperView()
            $0.bottom.equalToSuperView()
            $0.height.constraint(equalToConstant: 0.5)
        }

        layout {
            $0.height.constraint(equalToConstant: 60)
        }
    }
}

extension NewsHeaderView: TableCellConvertible {

    public typealias Content = String

    public func configure(_ tableViewCell: UITableViewCell) {
        tableViewCell.selectionStyle = .none
    }

    public func setup(with data: String) {
        titleLabel.text = data
    }

    public func clear() {
        titleLabel.text = nil
    }
}

public typealias NewsHeaderCell = TableViewContainerCell<NewsHeaderView>
