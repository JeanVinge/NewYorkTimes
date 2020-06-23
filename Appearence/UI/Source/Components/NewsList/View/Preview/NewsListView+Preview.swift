
#if DEBUG
import PreviewScreenKit
import SwiftUI

@available(iOS 13.0, *)
struct NewsListViewWithImagePreview: PreviewProvider {
    static var previews: some View {
        let listView = NewsListView()
        listView.reload(
            .init(
                list: [
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
                    ),
                    .init(index: 2,
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
                    ),
                    .init(index: 3,
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
                ],
                header: "List with image"
            )
        )
        return ViewContainerRepresentable(view: listView).controller()
    }
}

@available(iOS 13.0, *)
struct NewsListViewNoImagePreview: PreviewProvider {
    static var previews: some View {
        let listView = NewsListView()
        listView.reload(
            .init(
                list: [
                    .init(index: 1,
                          section: "Health",
                          image: nil,
                          title: "Flushing the Toilet May Fling Coronavirus Aerosols All Over",
                          subtitle: "A new study shows how turbulence from a toilet bowl can create a large plume that is potentially infectious to a bathroom’s next visitor.",
                          copyright: "John Greim/LightRocket, via Getty Images",
                          size: .zero
                    ),
                    .init(index: 2,
                          section: "Health",
                          image: nil,
                          title: "Flushing the Toilet May Fling Coronavirus Aerosols All Over",
                          subtitle: "A new study shows how turbulence from a toilet bowl can create a large plume that is potentially infectious to a bathroom’s next visitor.",
                          copyright: "John Greim/LightRocket, via Getty Images",
                          size: .zero
                    ),
                    .init(index: 3,
                          section: "Health",
                          image: nil,
                          title: "Flushing the Toilet May Fling Coronavirus Aerosols All Over",
                          subtitle: "A new study shows how turbulence from a toilet bowl can create a large plume that is potentially infectious to a bathroom’s next visitor.",
                          copyright: "John Greim/LightRocket, via Getty Images",
                          size: .zero
                    ),
                    .init(index: 4,
                          section: "Health",
                          image: nil,
                          title: "Flushing the Toilet May Fling Coronavirus Aerosols All Over",
                          subtitle: "A new study shows how turbulence from a toilet bowl can create a large plume that is potentially infectious to a bathroom’s next visitor.",
                          copyright: "John Greim/LightRocket, via Getty Images",
                          size: .zero
                    ),
                    .init(index: 5,
                          section: "Health",
                          image: nil,
                          title: "Flushing the Toilet May Fling Coronavirus Aerosols All Over",
                          subtitle: "A new study shows how turbulence from a toilet bowl can create a large plume that is potentially infectious to a bathroom’s next visitor.",
                          copyright: "John Greim/LightRocket, via Getty Images",
                          size: .zero
                    )
                ],
                header: "List with no image"
            )
        )
        return ViewContainerRepresentable(view: listView).controller()
    }
}
#endif
