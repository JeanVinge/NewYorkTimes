
#if DEBUG
import SwiftUI
import PreviewScreenKit

@available(iOS 13.0, *)
struct LoadingPreviewStarted: PreviewProvider {
    static var previews: some View {
        let preview = LoadingView()
        preview.startLoading()
        return ViewContainerRepresentable(view: preview).controller()
    }
}

@available(iOS 13.0, *)
struct LoadingPreviewStoped: PreviewProvider {
    static var previews: some View {
        let preview = LoadingView()
        preview.stopLoading()
        return ViewContainerRepresentable(view: preview).controller()
    }
}
#endif
