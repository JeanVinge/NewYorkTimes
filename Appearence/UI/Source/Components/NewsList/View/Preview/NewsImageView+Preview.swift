
#if DEBUG
import SwiftUI
import PreviewScreenKit

@available(iOS 13.0, *)
struct NewsImageViewPreview: PreviewProvider {
    static var previews: some View {
        let preview = NewsImageView()
        preview.setup(with:
            .init(index: 1,
                  section: "",
                  image: URL(
                    string: "https://static01.nyt.com/images/2020/06/16/opinion/15steinbergWeb/merlin_170402568_075aac78-e234-4bb4-a460-a53fbda9709d-mediumThreeByTwo210.jpg"
                ),
                  title: "",
                  subtitle: "",
                  copyright: "Hiroko Masuike/The New York Times",
                  size: CGSize(
                    width: 0,
                    height: 440
                )
            )
        )
        return ViewContainerRepresentable(view: preview).controller()
    }
}

@available(iOS 13.0, *)
struct NewsImageViewNoImagePreview: PreviewProvider {
    static var previews: some View {
        let preview = NewsImageView()
        preview.setup(with:
            .init(index: 1,
                  section: "",
                  image: nil,
                  title: "",
                  subtitle: "",
                  copyright: "Hiroko Masuike/The New York Times",
                  size: CGSize(
                    width: 0,
                    height: 440
                )
            )
        )
        return ViewContainerRepresentable(view: preview).controller()
    }
}
#endif
