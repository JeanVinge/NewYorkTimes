
#if DEBUG
import SwiftUI
import PreviewScreenKit

@available(iOS 13.0, *)
struct NewsHeaderViewPreview: PreviewProvider {
    static var previews: some View {
        let preview = NewsHeaderView()
        preview.setup(with: "Test")
        return ViewContainerRepresentable(view: preview).controller()
    }
}
#endif
