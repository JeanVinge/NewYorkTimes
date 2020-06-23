
import UIKit
import Layout
import ColorKit

public final class NewsView: UIView, ConfigurableView {

    // MARK: Var

    private lazy var newsTitleView = NewsTitleView()
    private lazy var newsImageView = NewsImageView()

    private lazy var spacingView: UIView = UIView()
        .with
        .backgroundColor(UIColor.systemColor.divisor)
        .build()

    private var topConstraint: NSLayoutConstraint?

    // MARK: Init

    public init() {
        super.init(frame: .zero)
        initLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func initSubviews() {
        addSubviews(newsTitleView,
                    newsImageView,
                    spacingView)
    }

    public func initConstraints() {
        newsTitleView.layout {
            $0.top.equalToSuperView(16)
            $0.leading.equalToSuperView(32)
            $0.trailing.equalToSuperView(-32)
        }

        newsImageView.layout {
            $0.top.equal(to: newsTitleView.bottomAnchor, offsetBy: 32)
            $0.leading.equal(to: newsTitleView.leadingAnchor)
            $0.trailing.equal(to: newsTitleView.trailingAnchor)
        }

        spacingView.layout {
            $0.leading.equal(to: newsTitleView.leadingAnchor)
            $0.trailing.equal(to: newsTitleView.trailingAnchor)
            $0.bottom.equalToSuperView()
            $0.height.constraint(equalToConstant: 12)
        }

        topConstraint = spacingView.topAnchor.constraint(equalTo: newsImageView.bottomAnchor)
        topConstraint?.isActive = true
    }
}

extension NewsView: TableCellConvertible {

    // MARK: Var

    public typealias Content = News

    // MARK: Init

    public func setup(with data: News) {
        topConstraint?.constant = data.image == nil ? 10 : 60
        newsTitleView.setup(with: data)
        newsImageView.setup(with: data)
    }

    public func configure(_ tableViewCell: UITableViewCell) {
        tableViewCell.selectionStyle = .none
    }

    public func prepareForReuse() {
        clear()
    }

    public func clear() {
        newsTitleView.clear()
        newsImageView.clear()
    }
}

public typealias NewsCell = TableViewContainerCell<NewsView>
