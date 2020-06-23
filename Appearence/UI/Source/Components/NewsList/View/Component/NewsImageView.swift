
import UIKit
import Kingfisher

final class NewsImageView: UIView, ConfigurableView {

    // MARK: Var

    private lazy var imageView: UIImageView = UIImageView()
        .with
        .contentMode(.scaleAspectFill)
        .backgroundColor(.lightGray)
        .clipsToBounds(true)
        .build()

    private lazy var copyrightLabel: UILabel = UILabel()
        .with
        .textColor(.lightGray)
        .font(.systemFont(ofSize: 10, weight: .light))
        .textAlignment(.right)
        .build()

    private var heightConstraint: NSLayoutConstraint?

    // MARK: Init

    init() {
        super.init(frame: .zero)
        initLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initSubviews() {
        addSubviews(imageView,
                    copyrightLabel)
    }
    
    func initConstraints() {
        imageView.layout {
            $0.top.equal(to: topAnchor)
            $0.leading.equal(to: leadingAnchor)
            $0.trailing.equal(to: trailingAnchor)
        }

        heightConstraint = imageView.heightAnchor.constraint(equalToConstant: 0)
        heightConstraint?.isActive = true
        heightConstraint?.priority = .fittingSizeLevel

        copyrightLabel.layout {
            $0.top.equal(to: imageView.bottomAnchor, offsetBy: 4)
            $0.trailing.equal(to: imageView.trailingAnchor)
            $0.bottom.equalToSuperView()
        }
    }
}

extension NewsImageView: ContentConvertible {

    typealias Content = News
    
    func setup(with data: News) {
        heightConstraint?.constant = data.size.height
        imageView.kf.setImage(with: data.image)
        copyrightLabel.isHidden = data.image == nil
        copyrightLabel.text = data.copyright
    }

    func clear() {
        imageView.kf.cancelDownloadTask()
        copyrightLabel.text = nil
    }
}
