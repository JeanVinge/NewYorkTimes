
import UIKit

public class TableListView: UIView, ConfigurableView {

    // MARK: Var

    lazy var tableView = UITableView()
        .with
        .tableFooterView(UIView())
        .separatorStyle(.none)
        .separatorInset(.zero)
        .separatorColor(.clear)
        .contentInset(.zero)
        .translatesAutoresizingMaskIntoConstraints(false)
        .build()

    lazy var dataSource = DataSource(tableView)

    // MARK: Init

    public init() {
        super.init(frame: .zero)
        initLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func initSubviews() {
        addSubview(tableView)
        dataSource.start()
    }

    public func configureRefresh() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
    }

    public func endRefreshing() {
        tableView.endRefreshing()
    }

    @objc func onRefresh() {
    }

    public func initConstraints() {
        tableView.layout {
            $0.top.equalToSuperView()
            $0.leading.equalToSuperView()
            $0.trailing.equalToSuperView()
            $0.bottom.equalToSuperView()
        }
    }
}
