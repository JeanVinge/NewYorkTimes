
import NewsDomainKit
import UI

extension NewsDomainKit.News {
    func toNews(at index: Int) -> UI.News {
        .init(
            index: index,
            section: section,
            image: image,
            title: title,
            subtitle: abstract,
            copyright: copyright,
            size: metadata?.toSize ?? .zero
        )
    }
}
