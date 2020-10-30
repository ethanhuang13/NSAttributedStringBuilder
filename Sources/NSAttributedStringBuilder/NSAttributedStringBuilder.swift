// NSAttributedString does not support SwiftUI Font and color, we still need to use UI/NS Font/Color
#if canImport(UIKit)
import UIKit
public typealias Font = UIFont
public typealias Color = UIColor
#elseif canImport(AppKit)
import AppKit
public typealias Font = NSFont
public typealias Color = NSColor
#endif

public typealias Attributes = [NSAttributedString.Key: Any]

@_functionBuilder
public struct NSAttributedStringBuilder {
    public static func buildBlock(_ components: Component...) -> NSAttributedString {
        let mas = NSMutableAttributedString(string: "")
        for component in components {
            mas.append(component.attributedString)
        }
        return mas
    }

    public static func buildBlock(_ strings: String...) -> NSAttributedString {
        return strings.joined().attributedString
    }
}

extension NSAttributedString {
    public convenience init(@NSAttributedStringBuilder _ builder: () -> NSAttributedString) {
        self.init(attributedString: builder())
    }
}

extension String: Component {
    public var string: String { self }
    public var attributes: Attributes { [:] }
    public var attributedString: NSAttributedString { NSAttributedString(string: self) }
}
