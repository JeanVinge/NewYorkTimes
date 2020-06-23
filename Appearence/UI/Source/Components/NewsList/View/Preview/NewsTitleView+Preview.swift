
#if DEBUG
import SwiftUI
import PreviewScreenKit

@available(iOS 13.0, *)
struct NewsTitleViewPreview: PreviewProvider {
    static var previews: some View {
        let preview = NewsTitleView()
        preview.setup(with:
            .init(index: 1,
                  section: "Opinion",
                  image:
                URL(
                    string: "https://static01.nyt.com/images/2020/06/16/opinion/15steinbergWeb/merlin_170402568_075aac78-e234-4bb4-a460-a53fbda9709d-mediumThreeByTwo210.jpg"
                ),
                  title: "Expecting Students to Play It Safe if Colleges Reopen Is a Fantasy",
                  subtitle: "Safety plans border on delusional and could lead to outbreaks of Covid-19 among students, faculty and staff.",
                  copyright: "Hiroko Masuike/The New York Times",
                  size:
                CGSize(
                    width: 0,
                    height: 440
                )
            )
        )
        return ViewContainerRepresentable(view: preview).controller()
    }
}

@available(iOS 13.0, *)
struct NewsTitleViewNoImagePreview: PreviewProvider {
    static var previews: some View {
        let preview = NewsTitleView()
        preview.setup(with:
            .init(index: 1,
                  section: "Opinion",
                  image: nil,
                  title: "Expecting Students to Play It Safe if Colleges Reopen Is a Fantasy",
                  subtitle: "Safety plans border on delusional and could lead to outbreaks of Covid-19 among students, faculty and staff.",
                  copyright: "Hiroko Masuike/The New York Times",
                  size:
                CGSize(
                    width: 0,
                    height: 440
                )
            )
        )
        return ViewContainerRepresentable(view: preview).controller()
    }
}
#endif
