#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public protocol Component {
    var string: String { get }
    var attributes: Attributes { get }
    var attributedString: NSAttributedString { get }
}

extension Component {
    public func build(_ string: String, attributes: Attributes) -> some Component {
        return AttrText(string, attributes: attributes)
    }

    public var attributedString: NSAttributedString {
        NSAttributedString(string: string, attributes: attributes)
    }

    public func attributes(_ newAttributes: Attributes) -> some Component {
        var attributes = self.attributes
        for attribute in newAttributes {
            attributes[attribute.key] = attribute.value
        }
        return build(string, attributes: attributes)
    }

    public func font(_ font: Font) -> some Component {
        attributes([.font: font])
    }

    public func color(_ color: Color) -> some Component {
        attributes([.foregroundColor: color])
    }
}
