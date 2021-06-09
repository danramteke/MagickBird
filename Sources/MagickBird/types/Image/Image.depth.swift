import Foundation
import MagickWand

extension Image {
	public var depth: Int {
		MagickGetImageDepth(self.pointer)
	}

	public func setDepth(_ a: Int) {
		MagickSetImageDepth(self.pointer, a)
	}
}
