import Foundation
import MagickWand

extension Image {
	public var depth: Int {
		get {
			MagickGetImageDepth(self.pointer)
		}
		set {
			MagickSetImageDepth(self.pointer, newValue)
		}
	}
}
