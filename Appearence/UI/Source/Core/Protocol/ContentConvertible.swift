
import UIKit

public protocol ContentConvertible {
    associatedtype Content = Void

    init()

    func setup(with data: Content)
    func clear()
}

extension ContentConvertible where Content == Void {
    public func setup(with data: Content) {}
}

public protocol CellConvertible: ContentConvertible {
    func prepareForReuse()
}

public extension CellConvertible {
    func prepareForReuse() {}
}

public protocol TableCellConvertible: CellConvertible {
    func configure(_ tableViewCell: UITableViewCell)
}

public extension TableCellConvertible {
    func configure(_ tableViewCell: UITableViewCell) {}
}
