import Foundation
import MagickBird

enum Fixture: String {

	case tibet

	var fileExtension: String {
		switch self {
		case .tibet: return "jpg"
		}
	}
}

extension Fixture {
	var path: String {
		Bundle.module.resourcePath! + "/fixtures/\(rawValue).\(fileExtension)"
	}

	var data: Data {
		try! Data(contentsOf: URL(fileURLWithPath: path))
	}

	var image: Image {
		Image(filePath: self.path)!
	}
}
