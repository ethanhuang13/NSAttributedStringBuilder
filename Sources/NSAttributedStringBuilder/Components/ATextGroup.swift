#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public typealias ATextGroup = NSAttributedString.AttrTextGroup

public extension NSAttributedString {
    struct AttrTextGroup: Component {
        public let string: String = ""
        public let attributes: Attributes = [:]

        public var attributedTexts: [AttrText]
        public var attributedString: NSAttributedString {
            let mas = NSMutableAttributedString(string: "")
            for attributedText in attributedTexts {
                mas.append(attributedText.attributedString)
            }
            return mas
        }

        public init(@AttrTextGroupBuilder attrTextGroupBuilder: () -> [AttrText]) {
            attributedTexts = attrTextGroupBuilder()
        }

        public func attributes(_ newAttributes: Attributes) -> Component {
            guard attributedTexts.count > 0 else { return self }
            var group = self
            for attribute in newAttributes {
                for index in 0 ..< group.attributedTexts.count {
                    group.attributedTexts[index].attributes[attribute.key] = attribute.value
                }
            }
            return group
        }
    }
}

@resultBuilder
public enum AttrTextGroupBuilder {
    public static func buildBlock(_ components: Component...) -> [AText] {
        components.compactMap { $0 as? AText }
    }
}
