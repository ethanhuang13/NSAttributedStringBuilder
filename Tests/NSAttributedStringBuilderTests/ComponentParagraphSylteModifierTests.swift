@testable import NSAttributedStringBuilder
import XCTest

#if canImport(UIKit)
    import Foundation
    import UIKit
#elseif canImport(AppKit)
    import AppKit
#endif

final class ComponentParagraphSylteModifierTests: XCTestCase {
    func testSetEmptyParagraphStyle() {
        let testData: NSAttributedString = {
            let ps = NSParagraphStyle()
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.paragraphStyle: ps])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let ps = NSParagraphStyle()

        let sut = NSAttributedString {
            AText("Hello world")
                .paragraphStyle(ps)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyMutableParagraphStyle() {
        let testData: NSAttributedString = {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .right

            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.paragraphStyle: paragraphStyle])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let mps = NSMutableParagraphStyle()
        mps.alignment = .right

        let sut = NSAttributedString {
            AText("Hello world")
                .paragraphStyle(mps)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyAlignment() {
        let testData: NSAttributedString = {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .right

            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.paragraphStyle: paragraphStyle])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .alignment(.right)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyFirstHeadIndent() {
        let testData: NSAttributedString = {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.firstLineHeadIndent = 16

            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.paragraphStyle: paragraphStyle])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .firstLineHeadIndent(16)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyHeadIndent() {
        let testData: NSAttributedString = {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.headIndent = 13

            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.paragraphStyle: paragraphStyle])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .headIndent(13)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyTailIndent() {
        let testData: NSAttributedString = {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.tailIndent = 19

            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.paragraphStyle: paragraphStyle])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .tailIndent(19)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyLinebreakMode() {
        let testData: NSAttributedString = {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineBreakMode = .byWordWrapping

            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.paragraphStyle: paragraphStyle])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .lineBreakeMode(.byWordWrapping)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyLineHeight() {
        let testData: NSAttributedString = {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1
            paragraphStyle.maximumLineHeight = 22
            paragraphStyle.minimumLineHeight = 18

            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.paragraphStyle: paragraphStyle])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .lineHeight(multiple: 1, maximum: 22, minimum: 18)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyLineSpacing() {
        let testData: NSAttributedString = {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 7

            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.paragraphStyle: paragraphStyle])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .lineSpacing(7)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyParagraphSpacing() {
        let testData: NSAttributedString = {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.paragraphSpacing = 9.3
            paragraphStyle.paragraphSpacingBefore = 17.2

            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.paragraphStyle: paragraphStyle])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .paragraphSpacing(9.3, before: 17.2)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyBaseWritingDirection() {
        let testData: NSAttributedString = {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.baseWritingDirection = .rightToLeft

            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.paragraphStyle: paragraphStyle])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .baseWritingDirection(.rightToLeft)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyHyphenationFactor() {
        let testData: NSAttributedString = {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.hyphenationFactor = 0.3

            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.paragraphStyle: paragraphStyle])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .hyphenationFactor(0.3)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    @available(iOS 9.0, tvOS 9.0, watchOS 2.0, OSX 10.11, *)
    func testAllowsDefaultTighteningForTruncation() {
        let testData: NSAttributedString = {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.allowsDefaultTighteningForTruncation = true

            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.paragraphStyle: paragraphStyle])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .allowsDefaultTighteningForTruncation()
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyTabStops() {
        let testData: NSAttributedString = {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.tabStops = [NSTextTab(textAlignment: .left, location: 6, options: [:]),
                                       NSTextTab(textAlignment: .right, location: 4, options: [:])]

            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.paragraphStyle: paragraphStyle])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .tabsStops([NSTextTab(textAlignment: .left, location: 6, options: [:]),
                            NSTextTab(textAlignment: .right, location: 4, options: [:])])
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    #if canImport(AppKit) && !targetEnvironment(macCatalyst)

        func testModifyTextBlocks() {
            let textBlock = NSTextBlock()
            textBlock.setWidth(30, type: .absoluteValueType, for: .border)

            let testData: NSAttributedString = {
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.textBlocks = [textBlock]

                let mas = NSMutableAttributedString(string: "Hello world",
                                                    attributes: [.paragraphStyle: paragraphStyle])
                mas.append(NSAttributedString(string: " with Swift"))
                return mas
            }()

            let sut = NSAttributedString {
                AText("Hello world")
                    .textBlocks([textBlock])
                AText(" with Swift")
            }

            XCTAssertEqual(sut, testData)
        }

        @available(OSX 10.13, *)
        func testModifyTextList() {
            let textList = NSTextList(markerFormat: .box, options: 0)

            let testData: NSAttributedString = {
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.textLists = [textList]

                let mas = NSMutableAttributedString(string: "Hello world",
                                                    attributes: [.paragraphStyle: paragraphStyle])
                mas.append(NSAttributedString(string: " with Swift"))
                return mas
            }()

            let sut = NSAttributedString {
                AText("Hello world")
                    .textLists([textList])
                AText(" with Swift")
            }

            XCTAssertEqual(sut, testData)
        }

        func testModifyTighteningFactorForTruncation() {
            let testData: NSAttributedString = {
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.tighteningFactorForTruncation = 0.5

                let mas = NSMutableAttributedString(string: "Hello world",
                                                    attributes: [.paragraphStyle: paragraphStyle])
                mas.append(NSAttributedString(string: " with Swift"))
                return mas
            }()

            let sut = NSAttributedString {
                AText("Hello world")
                    .tighteningFactorForTruncation(0.5)
                AText(" with Swift")
            }

            XCTAssertEqual(sut, testData)
        }

        func testModifyHeaderLevel() {
            let testData: NSAttributedString = {
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.headerLevel = 2

                let mas = NSMutableAttributedString(string: "Hello world",
                                                    attributes: [.paragraphStyle: paragraphStyle])
                mas.append(NSAttributedString(string: " with Swift"))
                return mas
            }()

            let sut = NSAttributedString {
                AText("Hello world")
                    .headerLevel(2)
                AText(" with Swift")
            }

            XCTAssertEqual(sut, testData)
        }
    #endif

    @available(iOS 9.0, tvOS 9.0, watchOS 2.0, OSX 10.11, *)
    func testChaining() {
        let testData: NSAttributedString = {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .right
            paragraphStyle.firstLineHeadIndent = 16
            paragraphStyle.headIndent = 13
            paragraphStyle.tailIndent = 19
            paragraphStyle.lineBreakMode = .byWordWrapping
            paragraphStyle.lineHeightMultiple = 1
            paragraphStyle.maximumLineHeight = 22
            paragraphStyle.minimumLineHeight = 18
            paragraphStyle.lineSpacing = 7
            paragraphStyle.paragraphSpacing = 9.3
            paragraphStyle.paragraphSpacingBefore = 17.2
            paragraphStyle.baseWritingDirection = .rightToLeft
            paragraphStyle.hyphenationFactor = 0.3
            paragraphStyle.allowsDefaultTighteningForTruncation = true

            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.paragraphStyle: paragraphStyle])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .alignment(.right)
                .firstLineHeadIndent(16)
                .headIndent(13)
                .tailIndent(19)
                .lineBreakeMode(.byWordWrapping)
                .lineHeight(multiple: 1, maximum: 22, minimum: 18)
                .lineSpacing(7)
                .paragraphSpacing(9.3, before: 17.2)
                .baseWritingDirection(.rightToLeft)
                .hyphenationFactor(0.3)
                .allowsDefaultTighteningForTruncation()
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    @available(iOS 9.0, tvOS 9.0, watchOS 2.0, OSX 10.11, *)
    func testRandomChainingOrderEqualness() {
        let sut = NSAttributedString {
            AText("Hello world")
                .alignment(.right)
                .firstLineHeadIndent(16)
                .headIndent(13)
                .tailIndent(19)
                .lineBreakeMode(.byWordWrapping)
                .lineHeight(multiple: 1, maximum: 22, minimum: 18)
                .lineSpacing(7)
                .paragraphSpacing(9.3, before: 17.2)
                .baseWritingDirection(.rightToLeft)
                .hyphenationFactor(0.3)
                .allowsDefaultTighteningForTruncation()
            AText(" with Swift")
        }

        let sut2 = NSAttributedString {
            AText("Hello world")
                .firstLineHeadIndent(16)
                .headIndent(13)
                .alignment(.right)
                .allowsDefaultTighteningForTruncation()
                .tailIndent(19)
                .lineSpacing(7)
                .lineBreakeMode(.byWordWrapping)
                .hyphenationFactor(0.3)
                .lineHeight(multiple: 1, maximum: 22, minimum: 18)
                .paragraphSpacing(9.3, before: 17.2)
                .baseWritingDirection(.rightToLeft)
            AText(" with Swift")
        }

        XCTAssertTrue(sut.isEqual(sut2))
    }

    func testSetEmptyParagraphStyleThenChaining() {
        let testData: NSAttributedString = {
            let mps = NSMutableParagraphStyle()
            mps.alignment = .justified
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.paragraphStyle: mps])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let ps = NSParagraphStyle()

        let sut = NSAttributedString {
            AText("Hello world")
                .paragraphStyle(ps)
                .alignment(.justified)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }
}
