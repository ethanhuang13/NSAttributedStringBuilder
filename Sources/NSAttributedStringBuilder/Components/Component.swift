#if canImport(UIKit)
    import UIKit
    public typealias Size = CGSize
#elseif canImport(AppKit)
    import AppKit
    public typealias Size = NSSize
#endif

public protocol Component {
    var string: String { get }
    var attributes: Attributes { get }
    var attributedString: NSAttributedString { get }
    func attributes(_ newAttributes: Attributes) -> Component
}

public enum Ligature: Int {
    case none = 0
    case `default` = 1

    #if canImport(AppKit)
        case all = 2 // Value 2 is unsupported on iOS
    #endif
}

public extension Component {
    private func build(_ string: String, attributes: Attributes) -> Component {
        AText(string, attributes: attributes)
    }

    var attributedString: NSAttributedString {
        NSAttributedString(string: string, attributes: attributes)
    }

    func attribute(_ newAttribute: NSAttributedString.Key, value: Any) -> Component {
        attributes([newAttribute: value])
    }

    func attributes(_ newAttributes: Attributes) -> Component {
        var attributes = self.attributes
        for attribute in newAttributes {
            attributes[attribute.key] = attribute.value
        }
        return build(string, attributes: attributes)
    }
}

// MARK: Basic Modifiers

public extension Component {
    func backgroundColor(_ color: Color) -> Component {
        attributes([.backgroundColor: color])
    }

    func baselineOffset(_ baselineOffset: CGFloat) -> Component {
        attributes([.baselineOffset: baselineOffset])
    }

    func font(_ font: Font) -> Component {
        attributes([.font: font])
    }

    func foregroundColor(_ color: Color) -> Component {
        attributes([.foregroundColor: color])
    }

    func expansion(_ expansion: CGFloat) -> Component {
        attributes([.expansion: expansion])
    }

    func kerning(_ kern: CGFloat) -> Component {
        attributes([.kern: kern])
    }

    func ligature(_ ligature: Ligature) -> Component {
        attributes([.ligature: ligature.rawValue])
    }

    func obliqueness(_ obliqueness: Float) -> Component {
        attributes([.obliqueness: obliqueness])
    }

    func shadow(color: Color? = nil, radius: CGFloat, x: CGFloat, y: CGFloat) -> Component {
        let shadow = NSShadow()
        shadow.shadowColor = color
        shadow.shadowBlurRadius = radius
        shadow.shadowOffset = .init(width: x, height: y)
        return attributes([.shadow: shadow])
    }

    func strikethrough(style: NSUnderlineStyle, color: Color? = nil) -> Component {
        if let color = color {
            return attributes([.strikethroughStyle: style.rawValue,
                               .strikethroughColor: color])
        } else {
            return attributes([.strikethroughStyle: style.rawValue])
        }
    }

    func stroke(width: CGFloat, color: Color? = nil) -> Component {
        if let color = color {
            return attributes([.strokeWidth: width,
                               .strokeColor: color])
        } else {
            return attributes([.strokeWidth: width])
        }
    }

    func textEffect(_ textEffect: NSAttributedString.TextEffectStyle) -> Component {
        attributes([.textEffect: textEffect])
    }

    func underline(_ style: NSUnderlineStyle, color: Color? = nil) -> Component {
        if let color = color {
            return attributes([.underlineStyle: style.rawValue,
                               .underlineColor: color])
        } else {
            return attributes([.underlineStyle: style.rawValue])
        }
    }

    func writingDirection(_ writingDirection: NSWritingDirection) -> Component {
        attributes([.writingDirection: writingDirection.rawValue])
    }

    #if canImport(AppKit)
        func vertical() -> Component {
            attributes([.verticalGlyphForm: 1])
        }
    #endif
}

// MARK: - Paragraph Style Modifiers

public extension Component {
    func paragraphStyle(_ paragraphStyle: NSParagraphStyle) -> Component {
        attributes([.paragraphStyle: paragraphStyle])
    }

    func paragraphStyle(_ paragraphStyle: NSMutableParagraphStyle) -> Component {
        attributes([.paragraphStyle: paragraphStyle])
    }

    private func getMutableParagraphStyle() -> NSMutableParagraphStyle {
        if let mps = attributes[.paragraphStyle] as? NSMutableParagraphStyle {
            return mps
        } else if let ps = attributes[.paragraphStyle] as? NSParagraphStyle,
                  let mps = ps.mutableCopy() as? NSMutableParagraphStyle
        {
            return mps
        } else {
            return NSMutableParagraphStyle()
        }
    }

    func alignment(_ alignment: NSTextAlignment) -> Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        return self.paragraphStyle(paragraphStyle)
    }

    func firstLineHeadIndent(_ indent: CGFloat) -> Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent = indent
        return self.paragraphStyle(paragraphStyle)
    }

    func headIndent(_ indent: CGFloat) -> Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.headIndent = indent
        return self.paragraphStyle(paragraphStyle)
    }

    func tailIndent(_ indent: CGFloat) -> Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.tailIndent = indent
        return self.paragraphStyle(paragraphStyle)
    }

    func lineBreakeMode(_ lineBreakMode: NSLineBreakMode) -> Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.lineBreakMode = lineBreakMode
        return self.paragraphStyle(paragraphStyle)
    }

    func lineHeight(multiple: CGFloat = 0, maximum: CGFloat = 0, minimum: CGFloat) -> Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = multiple
        paragraphStyle.maximumLineHeight = maximum
        paragraphStyle.minimumLineHeight = minimum
        return self.paragraphStyle(paragraphStyle)
    }

    func lineSpacing(_ spacing: CGFloat) -> Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        return self.paragraphStyle(paragraphStyle)
    }

    func paragraphSpacing(_ spacing: CGFloat, before: CGFloat = 0) -> Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = spacing
        paragraphStyle.paragraphSpacingBefore = before
        return self.paragraphStyle(paragraphStyle)
    }

    func baseWritingDirection(_ baseWritingDirection: NSWritingDirection) -> Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.baseWritingDirection = baseWritingDirection
        return self.paragraphStyle(paragraphStyle)
    }

    func hyphenationFactor(_ hyphenationFactor: Float) -> Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.hyphenationFactor = hyphenationFactor
        return self.paragraphStyle(paragraphStyle)
    }

    @available(iOS 9.0, tvOS 9.0, watchOS 2.0, OSX 10.11, *)
    func allowsDefaultTighteningForTruncation() -> Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.allowsDefaultTighteningForTruncation = true
        return self.paragraphStyle(paragraphStyle)
    }

    func tabsStops(_ tabStops: [NSTextTab], defaultInterval: CGFloat = 0) -> Component {
        let paragraphStyle = getMutableParagraphStyle()
        paragraphStyle.tabStops = tabStops
        paragraphStyle.defaultTabInterval = defaultInterval
        return self.paragraphStyle(paragraphStyle)
    }

    #if canImport(AppKit) && !targetEnvironment(macCatalyst)
        func textBlocks(_ textBlocks: [NSTextBlock]) -> Component {
            let paragraphStyle = getMutableParagraphStyle()
            paragraphStyle.textBlocks = textBlocks
            return self.paragraphStyle(paragraphStyle)
        }

        func textLists(_ textLists: [NSTextList]) -> Component {
            let paragraphStyle = getMutableParagraphStyle()
            paragraphStyle.textLists = textLists
            return self.paragraphStyle(paragraphStyle)
        }

        func tighteningFactorForTruncation(_ tighteningFactorForTruncation: Float) -> Component {
            let paragraphStyle = getMutableParagraphStyle()
            paragraphStyle.tighteningFactorForTruncation = tighteningFactorForTruncation
            return self.paragraphStyle(paragraphStyle)
        }

        func headerLevel(_ headerLevel: Int) -> Component {
            let paragraphStyle = getMutableParagraphStyle()
            paragraphStyle.headerLevel = headerLevel
            return self.paragraphStyle(paragraphStyle)
        }
    #endif
}

// MARK: - No 'modifiers' for these keys. Use .attributes() or .attribute(:value:) instead.

/*
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

 #if canImport(AppKit) && !targetEnvironment(UIKitForMac)
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
 */
