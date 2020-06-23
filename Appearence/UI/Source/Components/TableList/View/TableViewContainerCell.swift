
import UIKit

final public class TableViewContainerCell<T: TableViewRepresentation>: ReusableTableViewCell, ConfigurableView {

    // MARK: Var

    lazy var wrappedView = T()

    // MARK: Init

    public override func prepareForReuse() {
        super.prepareForReuse()
        wrappedView.prepareForReuse()
    }

    public override init(style: UITableViewCell.CellStyle,
                         reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        initLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func initSubviews() {
        contentView.addSubview(wrappedView)
        wrappedView.configure(self)
    }

    public func initConstraints() {
        wrappedView.layout {
            $0.top.equalToSuperView()
            $0.leading.equalToSuperView()
            $0.trailing.equalToSuperView()
            $0.bottom.equalToSuperView()
        }
    }

    override func configure(at indexPath: IndexPath, with object: Any? = nil) {
        guard let object = object as? T.Content else { return }
        wrappedView.setup(with: object)
    }
}
