
import UIKit
import UI
import NewsDomainKit
import ColorKit
import LocalizationKit

public protocol NewsListViewControllerRoute {
    func didSelect(in viewController: UIViewController, with news: NewsDomainKit.News)
}

final public class NewsListViewController: UIViewController {

    // MARK: Var

    lazy var newsListView: NewsListView = {
        let v = NewsListView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private var viewModel: NewsListViewModelProtocol
    private var responder: LoadingStateResponder?

    // MARK: Init

    public init(_ viewModel: NewsListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = viewModel.type.text()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        self.view = UIView()
        buildUI()
    }

    private func buildUI() {
        view.backgroundColor = UIColor.systemColor.background
        view.addSubview(newsListView)
        newsListView.route = self

        newsListView.layout {
            $0.top.equal(to: view.safeAreaLayoutGuide.topAnchor)
            $0.leading.equalToSuperView()
            $0.trailing.equalToSuperView()
            $0.bottom.equalToSuperView()
        }

        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.responder = self.find(LoadingStateResponder.self)
            self.requestList()
        }
    }

    // MARK: Request

    private func requestList() {
        responder?.change(with: .loading)
        viewModel.requestList().observe { [weak self] result in
            guard let self = self else { return }
            self.handleRequest(with: result)
        }
    }

    private func pullToRefresh() {
        viewModel.pullToRefresh().observe { [weak self] result in
            guard let self = self else { return }
            self.newsListView.endRefreshing()
            guard let viewModel = try? result.get() else { return }
            self.newsListView.reload(viewModel)
        }
    }

    private func handleRequest(with result: Result<UI.NewsListViewModel, Error>) {
        switch result {
        case let .success(viewModel):
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.responder?.change(with: .finished)
                self.newsListView.reload(viewModel)
            }
        case .failure:
            DispatchQueue.main.async {
                self.responder?.change(with:
                    .emptyState(
                        .init(
                            title: Localization.EmptyState.title.text(),
                            button: Localization.EmptyState.button.text()
                        )
                    )
                )
            }
        }
    }
}

extension NewsListViewController: NewsListViewRoute {
    public func didRefresh() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.pullToRefresh()
        }
    }
    public func didSelect(at index: Int) {
        viewModel.didSelect(at: index, in: self)
    }
}

extension NewsListViewController: EmptyStateButtonResponder {
    public func onTapEmptyStateButton() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.requestList()
        }
    }
}
