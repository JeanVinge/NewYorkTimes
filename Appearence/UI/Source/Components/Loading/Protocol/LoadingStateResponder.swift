
public enum LoadingState {
    case finished
    case loading
    case emptyState(EmptyStateViewModel)
}

public protocol LoadingStateResponder {
    func change(with state: LoadingState)
}
