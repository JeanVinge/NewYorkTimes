
import UIKit

protocol Section: AnyObject {
    var items: [Any] { get set }
    func list(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    func list(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)

    func registerCell(_ tableView: UITableView, at indexPath: IndexPath) -> ReusableTableViewCell
}

extension Section {
    func list(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { UITableView.automaticDimension }
    func list(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}
