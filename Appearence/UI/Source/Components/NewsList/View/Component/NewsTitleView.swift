
import UIKit

final class NewsTitleView: UIView, ConfigurableView {

    // MARK: Var

    private lazy var sourceLabel = UILabel()
        .with
        .font(.systemFont(ofSize: 14, weight: .bold))
        .build()

    private lazy var titleLabel = UILabel()
        .with
        .numberOfLines(0)
        .build()

    // MARK: Init

    init() {
        super.init(frame: .zero)
        initLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initSubviews() {
        addSubviews(sourceLabel,
                    titleLabel)
    }

    func initConstraints() {
        sourceLabel.layout {
            $0.top.equalToSuperView()
            $0.leading.equalToSuperView()
            $0.trailing.equalToSuperView()
        }

        titleLabel.layout {
            $0.top.equal(to: sourceLabel.bottomAnchor, offsetBy: 16)
            $0.leading.equal(to: sourceLabel.leadingAnchor)
            $0.trailing.equal(to: sourceLabel.trailingAnchor)
            $0.bottom.equalToSuperView()
        }
    }
}

extension NewsTitleView: ContentConvertible {

    typealias Content = News

    func setup(with data: News) {
        sourceLabel.text = data.heading
        titleLabel.applyStyle(for: data)
    }

    func clear() {
        sourceLabel.text = nil
        titleLabel.text = nil
    }
}

fileprivate extension UILabel {
    func applyStyle(for news: News) {
        attributedText = .applyStyle(for: news)
    }
}

fileprivate extension NSAttributedString {

    class func applyStyle(for news: News) -> NSMutableAttributedString {
        let firstAttributes = [
            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline),
            NSAttributedString.Key.foregroundColor: UIColor.systemColor.title
        ]

        let secondAttributes = [
            NSAttributedString.Key.foregroundColor:
                UIColor.systemColor.subtitle
        ]

        let firstString = NSMutableAttributedString(string: news.title,
                                                    attributes: firstAttributes)
        let secondString = NSAttributedString(string: " \(news.subtitle)",
            attributes: secondAttributes)

        firstString.append(secondString)

        return firstString
    }
}
