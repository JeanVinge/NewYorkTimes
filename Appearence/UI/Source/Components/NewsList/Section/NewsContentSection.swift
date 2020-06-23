
import UIKit

final class NewsContentSection: Section {

    weak var route: NewsListViewRoute?
    var items: [Any] = []

    func registerCell(_ tableView: UITableView, at indexPath: IndexPath) -> ReusableTableViewCell {
        tableView.dequeue(reusable: NewsCell.self, at: indexPath)
    }

    func list(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        route?.didSelect(at: indexPath.row)
    }

    // MARK: DataSourceProvider

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        route?.didSelect(at: indexPath.row)
    }
}
