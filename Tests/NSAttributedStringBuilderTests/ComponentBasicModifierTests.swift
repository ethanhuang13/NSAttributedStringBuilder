@testable import NSAttributedStringBuilder
import XCTest

final class ComponentBasicModifierTests: XCTestCase {
    func testModifyWithSingleAttribute() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.foregroundColor: Color.yellow])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .attribute(.foregroundColor, value: Color.yellow)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyBackgroundColor() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.backgroundColor: Color.red])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .backgroundColor(.red)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyBaselineOffset() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.baselineOffset: 10])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .baselineOffset(10)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyFontAndColor() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "")
            mas.append(NSAttributedString(string: "Hello world",
                                          attributes: [
                                              .font: Font.systemFont(ofSize: 20),
                                              .foregroundColor: Color.yellow,
                                          ]))
            mas.append(NSAttributedString(string: "\n"))
            mas.append(NSAttributedString(string: "Second line",
                                          attributes: [.font: Font.systemFont(ofSize: 24)]))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .font(.systemFont(ofSize: 20))
                .foregroundColor(.yellow)
            LineBreak()
            AText("Second line")
                .font(.systemFont(ofSize: 24))
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyExpansion() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.expansion: 1])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .expansion(1)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyKerning() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.kern: 3])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .kerning(3)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyLigature() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.ligature: 0])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .ligature(.none)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyObliqueness() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.obliqueness: 0.5])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .obliqueness(0.5)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
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
            AText("Hello world")
                .shadow(color: .black, radius: 10, x: 4, y: 4)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyStrikethrough() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.strikethroughStyle: NSUnderlineStyle.double.rawValue])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .strikethrough(style: .double)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
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
            AText("Hello world")
                .strikethrough(style: .patternDash, color: .black)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyStroke() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.strokeWidth: -2])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .stroke(width: -2)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
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
            AText("Hello world")
                .stroke(width: -2, color: .green)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyTextEffect() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.textEffect: NSAttributedString.TextEffectStyle.letterpressStyle])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .textEffect(.letterpressStyle)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyUnderline() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.underlineStyle: NSUnderlineStyle.patternDashDotDot.rawValue])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .underline(.patternDashDotDot)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
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
            AText("Hello world")
                .underline(.patternDashDotDot, color: .cyan)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }

    func testModifyWritingDirection() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world",
                                                attributes: [.writingDirection: NSWritingDirection.rightToLeft.rawValue])
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .writingDirection(.rightToLeft)
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
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
                AText("Hello world")
                    .vertical()
                AText(" with Swift")
            }

            XCTAssertEqual(sut, testData)
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
                             .writingDirection: NSWritingDirection.rightToLeft.rawValue]
            )
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
                .backgroundColor(.red)
                .baselineOffset(10)
                .font(.systemFont(ofSize: 20))
                .foregroundColor(.yellow)
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
            AText(" with Swift")
        }

        XCTAssertEqual(sut, testData)
    }
}
