
import UIKit

public extension UIResponder {
    func find<T: Any>(_ type: T.Type) -> T? {
        return next as? T ?? next?.find(T.self)
    }
}
