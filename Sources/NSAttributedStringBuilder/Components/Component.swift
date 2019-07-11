#if canImport(UIKit)
import UIKit
typealias Size = CGSize
#elseif canImport(AppKit)
import AppKit
typealias Size = NSSize
#endif

public protocol Component {
    var string: String { get }
    var attributes: Attributes { get }
    var attributedString: NSAttributedString { get }
}

public enum Ligature: Int {
    case none = 0
    case `default` = 1

    #if canImport(AppKit)
    case all = 2 // Value 2 is unsupported on iOS
    #endif
}

extension Component {
    private func build(_ string: String, attributes: Attributes) -> some Component {
        return AttrText(string, attributes: attributes)
    }

    public var attributedString: NSAttributedString {
        NSAttributedString(string: string, attributes: attributes)
    }

    public func attribute(_ newAttribute: NSAttributedString.Key, value: Any) -> some Component {
        attributes([newAttribute: value])
    }

    public func attributes(_ newAttributes: Attributes) -> some Component {
        var attributes = self.attributes
        for attribute in newAttributes {
            attributes[attribute.key] = attribute.value
        }
        return build(string, attributes: attributes)
    }
}

// MARK: Basic Modifiers

extension Component {
    public func attachment(_ attachment: NSTextAttachment) -> some Component {
        attributes([.attachment: attachment])
    }

    public func backgroundColor(_ color: Color) -> some Component {
        attributes([.backgroundColor: color])
    }

    public func baselineOffset(_ baselineOffset: CGFloat) -> some Component {
        attributes([.baselineOffset: baselineOffset])
    }

    public func font(_ font: Font) -> some Component {
        attributes([.font: font])
    }

    public func color(_ color: Color) -> some Component {
        attributes([.foregroundColor: color])
    }

    public func expansion(_ expansion: CGFloat) -> some Component {
        attributes([.expansion: expansion])
    }

    public func kerning(_ kern: CGFloat) -> some Component {
        attributes([.kern: kern])
    }

    public func ligature(_ ligature: Ligature) -> some Component {
        attributes([.ligature: ligature.rawValue])
    }

    public func obliqueness(_ obliqueness: Float) -> some Component {
        attributes([.obliqueness: obliqueness])
    }

    public func shadow(color: Color? = nil, radius: CGFloat, x: CGFloat, y: CGFloat) -> some Component {
        let shadow = NSShadow()
        shadow.shadowColor = color
        shadow.shadowBlurRadius = radius
        shadow.shadowOffset = .init(width: x, height: y)
        return attributes([.shadow: shadow])
    }

    public func strikethrough(style: NSUnderlineStyle, color: Color? = nil) -> some Component {
        if let color = color {
            return attributes([.strikethroughStyle: style,
                               .strikethroughColor: color])
        } else {
            return attributes([.strikethroughStyle: style])
        }
    }

    public func stroke(width: CGFloat, color: Color? = nil) -> some Component {
        if let color = color {
            return attributes([.strokeWidth: width,
                               .strokeColor: color])
        } else {
            return attributes([.strokeWidth: width])
        }
    }

    public func textEffect(_ textEffect: NSAttributedString.TextEffectStyle) -> some Component {
        return attributes([.textEffect: textEffect])
    }

    public func underlinestyle(style: NSUnderlineStyle, color: Color? = nil) -> some Component {
        if let color = color {
            return attributes([.underlineStyle: style,
                               .underlineColor: color])
        } else {
            return attributes([.underlineStyle: style])
        }
    }

    public func writingDirection(_ writingDirection: NSWritingDirection) -> some Component {
        return attributes([.writingDirection: writingDirection])
    }

    #if canImport(AppKit)
    public func vertical() -> some Component {
        return attributes([.verticalGlyphForm: 1])
    }
    #endif
}

// MARK: - Paragraph Style Modifiers

extension Component {
    public func paragraphStyle(_ paragraphStyle: NSParagraphStyle) -> some Component {
        return attributes([.paragraphStyle: paragraphStyle])
    }

    public func paragraphStyle(_ paragraphStyle: NSMutableParagraphStyle) -> some Component {
        return attributes([.paragraphStyle: paragraphStyle])
    }

    private func getMutableParagraphStyle() -> NSMutableParagraphStyle {
        let mps = NSMutableParagraphStyle()
        if let paragraphStyle = attributes[.paragraphStyle] as? NSParagraphStyle {
            mps.setParagraphStyle(paragraphStyle)
        } else if let mutableParagraphStyle = attributes[.paragraphStyle] as? NSMutableParagraphStyle {
            mps.setParagraphStyle(mutableParagraphStyle)
        }
        return mps
    }

    public func alignment(_ alignment: NSTextAlignment = .natural) -> some Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        return self.paragraphStyle(paragraphStyle)
    }

    public func firstLineHeadIndent(_ indent: CGFloat) -> some Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent = indent
        return self.paragraphStyle(paragraphStyle)
    }

    public func headIndent(_ indent: CGFloat) -> some Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.headIndent = indent
        return self.paragraphStyle(paragraphStyle)
    }

    public func tailIndent(_ indent: CGFloat) -> some Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.tailIndent = indent
        return self.paragraphStyle(paragraphStyle)
    }

    public func lineBreakeMode(_ lineBreakMode: NSLineBreakMode) -> some Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.lineBreakMode = lineBreakMode
        return self.paragraphStyle(paragraphStyle)
    }

    public func lineHeight(multiple: CGFloat = 0, maximum: CGFloat = 0, minimum: CGFloat) -> some Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = multiple
        paragraphStyle.maximumLineHeight = maximum
        paragraphStyle.minimumLineHeight = minimum
        return self.paragraphStyle(paragraphStyle)
    }

    public func lineSpacing(_ spacing: CGFloat) -> some Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        return self.paragraphStyle(paragraphStyle)
    }

    public func paragraphSpacing(_ spacing: CGFloat, before: CGFloat = 0) -> some Component  {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = spacing
        paragraphStyle.paragraphSpacingBefore = before
        return self.paragraphStyle(paragraphStyle)
    }

    public func baseWritingDirection(_ baseWritingDirection: NSWritingDirection) -> some Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.baseWritingDirection = baseWritingDirection
        return self.paragraphStyle(paragraphStyle)
    }

    public func hyphenationFactor(_ hyphenationFactor: Float) -> some Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.hyphenationFactor = hyphenationFactor
        return self.paragraphStyle(paragraphStyle)
    }

    public func allowsDefaultTighteningForTruncation() -> some Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.allowsDefaultTighteningForTruncation = true
        return self.paragraphStyle(paragraphStyle)
    }

    public func tabsStops(_ tabStops: [NSTextTab], defaultInterval: CGFloat = 0) -> some Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.tabStops = tabStops
        paragraphStyle.defaultTabInterval = defaultInterval
        return self.paragraphStyle(paragraphStyle)
    }

    #if canImport(AppKit)
    public func textBlocks(_ textBlocks: [NSTextBlock]) -> some Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.textBlocks = textBlocks
        return self.paragraphStyle(paragraphStyle)
    }

    public func textLists(_ textLists: [NSTextList]) -> some Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.textLists = textLists
        return self.paragraphStyle(paragraphStyle)
    }

    public func tighteningFactorForTruncation(_ tighteningFactorForTruncation: Float) -> some Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.tighteningFactorForTruncation = tighteningFactorForTruncation
        return self.paragraphStyle(paragraphStyle)
    }

    public func headerLevel(_ headerLevel: Int) -> some Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.headerLevel = headerLevel
        return self.paragraphStyle(paragraphStyle)
    }
    #endif
}

// MARK: - No 'modifiers' for these keys. Use .attributes() or .attribute(:value:) instead.

#if canImport(UIKit)
let iOSKeys: [NSAttributedString.Key] = [
    .UIAccessibilitySpeechAttributeSpellOut, // iOS 13+
    .UIAccessibilityTextAttributeContext, // iOS 13+
    .accessibilitySpeechIPANotation, // iOS 11.0+
    .accessibilitySpeechLanguage, // iOS 7.0+
    .accessibilitySpeechPitch, // iOS 7.0+
    .accessibilitySpeechPunctuation, // iOS 7.0+
    .accessibilitySpeechQueueAnnouncement, // iOS 11.0+
    .accessibilityTextCustom, // iOS 11.0+
    .accessibilityTextHeadingLevel, // iOS 11.0+
]
#endif

#if canImport(AppKit)
let macOSKeys: [NSAttributedString.Key] = [
    .accessibilityAlignment, // macOS 10.12+
    .accessibilityAnnotationTextAttribute, // macOS 10.13+
    .accessibilityAttachment, // macOS 10.4+, Deprecated
    .accessibilityAutocorrected, // macOS 10.7+
    .accessibilityBackgroundColor, // macOS 10.4+
    .accessibilityCustomText, // macOS 10.13+
    .accessibilityFont, // macOS 10.4+
    .accessibilityForegroundColor, // macOS 10.4+
    .accessibilityLanguage, // macOS 10.13+
    .accessibilityLink, // macOS 10.4+
    .accessibilityListItemIndex, // macOS 10.11+
    .accessibilityListItemLevel, // macOS 10.11+
    .accessibilityListItemPrefix, // macOS 10.11+
    .accessibilityMarkedMisspelled, // macOS 10.4+
    .accessibilityMisspelled, // macOS 10.4+
    .accessibilityShadow, // macOS 10.4+
    .accessibilityStrikethrough, // macOS 10.4+
    .accessibilityStrikethroughColor, // macOS 10.4+
    .accessibilitySuperscript, // macOS 10.4+
    .accessibilityUnderline, // macOS 10.4+
    .accessibilityUnderlineColor, // macOS 10.4+
    .cursor, // macOS 10.3+
    .glyphInfo, // macOS 10.2+
    .markedClauseSegment, // macOS 10.5+
    .spellingState, // macOS 10.5+
    .superscript, // macOS 10.0+
    .textAlternatives, // macOS 10.8+
    .toolTip, // macOS 10.3+
]
#endif
