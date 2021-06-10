import XCTest
import MagickBird

final class ReadPropertiesTests: XCTestCase {

	let image = Fixture.tibet.image

	func testReadDimensions() {


		XCTAssertEqual(3931, image.width)
		XCTAssertEqual(2247, image.height)
		XCTAssertEqual(Size(width: 3931, height: 2247), image.size)
	}

	func testReadResolution() {

		XCTAssertEqual(Resolution(x: 72, y: 72), image.resolution)
	}

	func testReadFormat() {

		XCTAssertEqual("JPEG", image.format)
	}

	func testReadDepth() {

		XCTAssertEqual(8, image.depth)
	}

	func testReadCompression() {

		XCTAssertEqual(0, image.compressionQuality)
	}
}
