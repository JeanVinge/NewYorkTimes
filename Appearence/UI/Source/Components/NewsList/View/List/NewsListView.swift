
import UIKit

public protocol NewsListViewRoute: class {
    func didSelect(at index: Int)
    func didRefresh()
}

public final class NewsListView: TableListView {

    // MARK: Var

    private lazy var contentSection = NewsContentSection()
    private lazy var headerSection = NewsHeaderSection()

    public weak var route: NewsListViewRoute? {
        didSet {
            contentSection.route = route
            headerSection.route = route
        }
    }

    // MARK: Init

    public override func initSubviews() {
        super.initSubviews()
        tableView.contentInset.bottom = 60
        configureRefresh()
    }

    override func onRefresh() {
        route?.didRefresh()
    }

    public func reload(_ viewModel: NewsListViewModel) {
        contentSection.items = viewModel.list
        headerSection.items = [viewModel.header]
        dataSource.reload(
            [
                headerSection,
                contentSection
            ]
        )
    }
}
