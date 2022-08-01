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

        public var attributedTexts: [AText]
        
        public var attributedString: NSAttributedString {
            let mas = NSMutableAttributedString(string: "")
            for attributedText in attributedTexts {
                mas.append(attributedText.attributedString)
            }
            return mas
        }

        private init(attributedTexts: [AText]) {
            self.attributedTexts = attributedTexts
        }
        
        public init(@AttrTextGroupBuilder attrTextGroupBuilder: () -> [AText]) {
            attributedTexts = attrTextGroupBuilder()
        }

        public func attributes(_ newAttributes: Attributes) -> Component {
            guard attributedTexts.count > 0 else { return self }
            var tempAttributedTexts = [AText]()
            for attribute in newAttributes {
                for attributedText in attributedTexts {
                    let tempString = attributedText.string
                    var tempAttributes = attributedText.attributes
                    tempAttributes[attribute.key] = attribute.value
                    tempAttributedTexts.append(AText(tempString, attributes: tempAttributes))
                }
            }
            return AttrTextGroup(attributedTexts: tempAttributedTexts)
        }
    }
}

@resultBuilder
public enum AttrTextGroupBuilder {
    public static func buildBlock(_ components: Component...) -> [AText] {
        var attributedTexts = [AText]()
        for component in components {
            if let attributedText = component as? AText {
                attributedTexts.append(attributedText)
            } else if let attributedTextGroup = component as? ATextGroup {
                attributedTexts = attributedTexts + attributedTextGroup.attributedTexts
            } else {
                continue
            }
        }
        return attributedTexts
    }
}
