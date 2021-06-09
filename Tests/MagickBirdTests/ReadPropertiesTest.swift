import XCTest
import MagickBird

final class ReadPropertiesTest: XCTestCase {
	func testReadProperties() {

		let inputPath: String = Bundle.module.resourcePath! + "/fixtures/tibet.jpg"
		print(inputPath)
		MagickBirdContext {
			guard let image = Image(filePath: inputPath) else {
				XCTFail("could not load image at path \(inputPath)")
				return
			}

			XCTAssertNotNil(image.data)
			XCTAssertEqual(3931, image.width)
		}
	}

}
