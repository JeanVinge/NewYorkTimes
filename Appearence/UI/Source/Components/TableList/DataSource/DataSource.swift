
import UIKit

final class DataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    // MARK: Var

    private var tableView: UITableView
    private var sections: [Section] = [] {
        didSet {
            tableView.dispatchReloadData()
        }
    }

    // MARK: Init

    init(_ tableView: UITableView) {
        self.tableView = tableView
        super.init()
    }

    func reload(_ sections: [Section]) {
        self.sections = sections
    }

    public func reload(section: Section) {
        guard let index = sections.firstIndex(where: { innerSection in
            innerSection === section
        }) else { return }
        
        sections[index] = section
        tableView.performBatchUpdates({ [weak self] in
            guard let self = self else { return }
            self.tableView.reloadSections(IndexSet([index]), with: .automatic)
            }, completion: nil)
    }

    func start() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int { sections.count }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int { sections[section].items.count }
    
    // MARK: UITableViewDelegate

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sections[indexPath.section].registerCell(tableView, at: indexPath)
        cell.configure(at: indexPath, with: sections[indexPath.section].items[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sections[indexPath.section].list(tableView, didSelectRowAt: indexPath)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        sections[indexPath.section].list(tableView, heightForRowAt: indexPath)
    }
}
