
#if DEBUG
import SwiftUI
import PreviewScreenKit

@available(iOS 13.0, *)
struct EmptyStatePreview: PreviewProvider {
    static var previews: some View {
        let emptyState = EmptyStateView()
        emptyState.setup(with:
            .init(title: "Test",
                  button: "Test")
        )
        return ViewContainerRepresentable(view: emptyState).controller()
    }
}
#endif
