
import UIKit

fileprivate class BundleHack: NSObject {}
fileprivate let currentBundle = Bundle(for: type(of: BundleHack()))

enum ColorAsset: String {
    case background
    case divisor
    case separator
    case title
    case subtitle

    var name: String { rawValue }
}

extension UIColor {
    class func asset(_ asset: ColorAsset) -> UIColor {
        guard let color = UIColor(named: asset.name,
                                  in: currentBundle,
                                  compatibleWith: nil) else {
            fatalError("Could not find \(asset.name) color")
        }
        return color
    }
}

public protocol Theme {
    var background: UIColor { get }
    var divisor: UIColor { get }
    var separator: UIColor { get }
    var title: UIColor { get }
    var subtitle: UIColor { get }
}

public struct ComponentTheme: Theme {
    public var background: UIColor = .asset(.background)
    public var divisor: UIColor = .asset(.divisor)
    public var separator: UIColor = .asset(.separator)
    public var title: UIColor = .asset(.title)
    public var subtitle: UIColor = .asset(.subtitle)
}

public extension UIColor {
    class var systemColor: ComponentTheme {
        ComponentTheme()
    }
}
