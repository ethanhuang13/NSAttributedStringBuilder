import XCTest
@testable import NSAttributedStringBuilder

final class ComponentBasicModifierTests: XCTestCase {
    func testModifyWithSingleAttribute() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.foregroundColor: Color.yellow])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
                .attribute(.foregroundColor, value: Color.yellow)
            AttrText(" with Swift")
        }

        XCTAssertTrue(sut.isEqual(testData))
    }

    func testModifyBackgroundColor() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.backgroundColor: Color.red])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
                .backgroundColor(.red)
            AttrText(" with Swift")
        }

        XCTAssertTrue(sut.isEqual(testData))
    }

    func testModifyBaselineOffset() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.baselineOffset: 10])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
                .baselineOffset(10)
            AttrText(" with Swift")
        }

        XCTAssertTrue(sut.isEqual(testData))
    }

    func testModifyFontAndColor() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "")
            mas.append(NSAttributedString(string: "Hello world",
                                          attributes: [
                                            .font: Font.systemFont(ofSize: 20),
                                            .foregroundColor: Color.yellow]))
            mas.append(NSAttributedString(string: "\n"))
            mas.append(NSAttributedString(string: "Second line",
                                          attributes: [.font: Font.systemFont(ofSize: 24)]))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
                .font(.systemFont(ofSize: 20))
                .color(.yellow)
            AttrText.linebreak
            AttrText("Second line")
                .font(.systemFont(ofSize: 24))
        }

        XCTAssertTrue(sut.isEqual(testData))
    }

    func testModifyExpansion() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.expansion: 1])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
                .expansion(1)
            AttrText(" with Swift")
        }

        XCTAssertTrue(sut.isEqual(testData))
    }

    func testModifyKerning() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.kern: 3])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
                .kerning(3)
            AttrText(" with Swift")
        }

        XCTAssertTrue(sut.isEqual(testData))
    }

    func testModifyLigature() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.ligature: 0])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
                .ligature(.none)
            AttrText(" with Swift")
        }

        XCTAssertTrue(sut.isEqual(testData))
    }

    func testModifyObliqueness() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.obliqueness: 0.5])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
                .obliqueness(0.5)
            AttrText(" with Swift")
        }

        XCTAssertTrue(sut.isEqual(testData))
    }

    func testModifyShadow() {
        let testData: NSAttributedString = {
            let shadow = NSShadow()
            shadow.shadowColor = Color.black
            shadow.shadowBlurRadius = 10
            shadow.shadowOffset = .init(width: 4, height: 4)

            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.shadow: shadow])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
                .shadow(color: .black, radius: 10, x: 4, y: 4)
            AttrText(" with Swift")
        }

        XCTAssertTrue(sut.isEqual(testData))
    }

    func testModifyStrikethrough() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.strikethroughStyle: NSUnderlineStyle.double.rawValue])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
                .strikethrough(style: .double)
            AttrText(" with Swift")
        }

        XCTAssertTrue(sut.isEqual(testData))
    }

    func testModifyStrikethroughWithColor() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.strikethroughStyle: NSUnderlineStyle.patternDash.rawValue,
                                                             .strikethroughColor: Color.black])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
                .strikethrough(style: .patternDash, color: .black)
            AttrText(" with Swift")
        }

        XCTAssertTrue(sut.isEqual(testData))
    }

    func testModifyStroke() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.strokeWidth: -2])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
                .stroke(width: -2)
            AttrText(" with Swift")
        }

        XCTAssertTrue(sut.isEqual(testData))
    }

    func testModifyStrokeWithColor() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.strokeWidth: -2,
                                                             .strokeColor: Color.green])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
                .stroke(width: -2, color: .green)
            AttrText(" with Swift")
        }

        XCTAssertTrue(sut.isEqual(testData))
    }

    func testModifyTextEffect() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.textEffect: NSAttributedString.TextEffectStyle.letterpressStyle])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
                .textEffect(.letterpressStyle)
            AttrText(" with Swift")
        }

        XCTAssertTrue(sut.isEqual(testData))
    }

    func testModifyUnderline() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.underlineStyle: NSUnderlineStyle.patternDashDotDot.rawValue])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
                .underline(.patternDashDotDot)
            AttrText(" with Swift")
        }

        XCTAssertTrue(sut.isEqual(testData))
    }

    func testModifyUnderlineWithColor() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.underlineStyle: NSUnderlineStyle.patternDashDotDot.rawValue,
                                                             .underlineColor: Color.cyan])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
                .underline(.patternDashDotDot, color: .cyan)
            AttrText(" with Swift")
        }

        XCTAssertTrue(sut.isEqual(testData))
    }

    func testModifyWritingDirection() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.writingDirection: NSWritingDirection.rightToLeft.rawValue])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
                .writingDirection(.rightToLeft)
            AttrText(" with Swift")
        }

        XCTAssertTrue(sut.isEqual(testData))
    }

    #if canImport(AppKit)
    func testModifyVertical() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.verticalGlyphForm: 1])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
                .vertical()
            AttrText(" with Swift")
        }

        XCTAssertTrue(sut.isEqual(testData))
    }
    #endif

    func testChaining() {
        let testData: NSAttributedString = {
            let shadow = NSShadow()
            shadow.shadowColor = Color.black
            shadow.shadowBlurRadius = 10
            shadow.shadowOffset = .init(width: 4, height: 4)

            let mas = NSMutableAttributedString(
                string: "Hello world",
                attributes: [.backgroundColor: Color.red,
                             .baselineOffset: 10,
                             .font: Font.systemFont(ofSize: 20),
                             .foregroundColor: Color.yellow,
                             .expansion: 1,
                             .kern: 3,
                             .ligature: 0,
                             .obliqueness: 0.5,
                             .shadow: shadow,
                             .strikethroughStyle: NSUnderlineStyle.patternDash.rawValue,
                             .strikethroughColor: Color.black,
                             .strokeWidth: -2,
                             .strokeColor: Color.green,
                             .textEffect: NSAttributedString.TextEffectStyle.letterpressStyle,
                             .underlineStyle: NSUnderlineStyle.patternDashDotDot.rawValue,
                             .underlineColor: Color.cyan,
                             .writingDirection: NSWritingDirection.rightToLeft.rawValue
            ])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
                .backgroundColor(.red)
                .baselineOffset(10)
                .font(.systemFont(ofSize: 20))
                .color(.yellow)
                .expansion(1)
                .kerning(3)
                .ligature(.none)
                .obliqueness(0.5)
                .shadow(color: .black, radius: 10, x: 4, y: 4)
                .strikethrough(style: .patternDash, color: .black)
                .stroke(width: -2, color: .green)
                .textEffect(.letterpressStyle)
                .underline(.patternDashDotDot, color: .cyan)
                .writingDirection(.rightToLeft)
            AttrText(" with Swift")
        }

        XCTAssertTrue(sut.isEqual(testData))
    }
}
