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

        XCTAssertTrue(sut.isEqual(testData))
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

        XCTAssertTrue(sut.isEqual(testData))
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

        XCTAssertTrue(sut.isEqual(testData))
    }
}
