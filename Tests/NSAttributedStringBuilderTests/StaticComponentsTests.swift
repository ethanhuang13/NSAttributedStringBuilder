@testable import NSAttributedStringBuilder
import XCTest

final class StaticComponentsTests: XCTestCase {
    func testEmpty() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "")
            mas.append(NSAttributedString(string: ""))
            return mas
        }()

        let sut = NSAttributedString {
            Empty()
            Empty()
        }

        XCTAssertEqual(sut, testData)
    }

    func testSpace() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: " ")
            return mas
        }()

        let sut = NSAttributedString {
            Empty()
            Space()
        }

        XCTAssertEqual(sut, testData)
    }

    func testLineBreak() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "")
            mas.append(NSAttributedString(string: "\n"))
            mas.append(NSAttributedString(string: ""))
            return mas
        }()

        let sut = NSAttributedString {
            Empty()
            LineBreak()
            Empty()
        }

        XCTAssertEqual(sut, testData)
    }
}
