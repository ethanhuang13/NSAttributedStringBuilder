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

@resultBuilder
public enum NSAttributedStringBuilder {
    public static func buildOptional(_ component: NSAttributedString?) -> Component {
        
        if let content = component {
            return AText(content.string, attributes: content.attributesAll)
        }
        else{
            return AText("")
        }
    }
    
    public static func buildBlock(_ components: Component...) -> NSAttributedString {
        let mas = NSMutableAttributedString(string: "")
        for component in components {
            mas.append(component.attributedString)
        }
        return mas
    }
    
    public static func buildEither(first component: NSAttributedString) -> Component {
        return AText(component.string, attributes: component.attributesAll)
    }
    
    public static func buildEither(second component: NSAttributedString) -> Component {
        return AText(component.string, attributes: component.attributesAll)
    }
    
    public static func buildArray(_ components: [NSAttributedString]) -> Component {
        let mas = NSMutableAttributedString(string: "")
        for component in components {
            mas.append(component)
        }
        return AText(mas.string, attributes: mas.attributes(at: 0, effectiveRange: nil))
    }
    
}

public extension NSAttributedString {
    convenience init(@NSAttributedStringBuilder _ builder: () -> NSAttributedString) {
        self.init(attributedString: builder())
    }
    
    var attributesAll:[NSAttributedString.Key : Any] {
        self.attributes(at: 0, effectiveRange: nil)
    }
    
}
