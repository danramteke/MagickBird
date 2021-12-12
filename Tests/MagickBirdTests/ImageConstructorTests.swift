import Foundation
import XCTest
import MagickBird

final class ImageConstructorTests: XCTestCase {

	func testReturnsNilWhenPathDoesNotExist() {
		XCTAssertNil(Image(filePath: "./file/does/not/exist/example.png"))
	}

	func testInitImageFromFilePath() {

		guard let image = Image(filePath: Fixture.tibet.path) else {
			XCTFail("could not load image")
			return
		}

		XCTAssertNotNil(image.data)
		XCTAssertEqual(3931, image.width)
	}

	func testInitImageFromData() {

		guard let image = Image(data: Fixture.tibet.data) else {
			XCTFail("could not open image")
			return
		}

		XCTAssertNotNil(image.data)
		XCTAssertEqual(3931, image.width)
	}

	func testLoadsAnImageFromData() {
		let image = Image()
		image.read(data: Fixture.tibet.data)

		XCTAssertNotNil(image.data)
		XCTAssertEqual(3931, image.width)
	}
}
