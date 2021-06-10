import Foundation
import MagickWand

extension Image {
	public var format: String {
		get {
			let cstring: UnsafeMutablePointer<CChar> = MagickGetImageFormat(self.pointer)
			return String(cString: cstring)
		}
		set {
			MagickSetImageFormat(self.pointer, newValue)
		}
	}
}
