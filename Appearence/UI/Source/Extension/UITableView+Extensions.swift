
import UIKit

public extension UITableView {

    func dequeue<T: ReusableTableViewCell>(
        reusable: T.Type = T.self,
        at indexPath: IndexPath,
        with object: Any? = nil) -> T {
        register(reusable)
        if let cell = dequeueReusableCell(withIdentifier: reusable.reusableIdentifier,
                                          for: indexPath) as? T {
            cell.configure(at: indexPath, with: object)
            return cell
        }
        fatalError(TableViewErrors.cellNotRegistered(reusable.reusableIdentifier).localizedDescription)
    }

    func register<T: ReusableTableViewCell>(_ reusable: T.Type = T.self) {
        register(T.self,
                 forCellReuseIdentifier: reusable.reusableIdentifier)
    }

    func dispatchReloadData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.reloadData()
        }
    }

    func endRefreshing() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.refreshControl?.endRefreshing()
        }
    }
}
