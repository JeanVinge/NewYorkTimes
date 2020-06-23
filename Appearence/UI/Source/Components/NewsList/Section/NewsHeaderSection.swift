
import UIKit

final class NewsHeaderSection: Section {

    weak var route: NewsListViewRoute?
    var items: [Any] = []

    func registerCell(_ tableView: UITableView, at indexPath: IndexPath) -> ReusableTableViewCell {
        tableView.dequeue(reusable: NewsHeaderCell.self, at: indexPath)
    }
}
