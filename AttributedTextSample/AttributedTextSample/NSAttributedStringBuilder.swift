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
    static func buildBlock(_ components: Component...) -> NSAttributedString {
        let mas = NSMutableAttributedString(string: "")
        for component in components {
            mas.append(component.attributedString)
        }
        return mas
    }
}

extension NSAttributedString {
    public convenience init(@NSAttributedStringBuilder _ builder: () -> NSAttributedString) {
        self.init(attributedString: builder())
    }
}
