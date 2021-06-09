import Foundation
import MagickWand

extension Image {

	public func setFormat(_ string: String) {
		MagickSetImageFormat(self.pointer, string)
	}

	public var format: String {
		let cstring: UnsafeMutablePointer<CChar> = MagickGetImageFormat(self.pointer)
		return String(cString: cstring)
	}
}
