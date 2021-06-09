import Foundation
import MagickWand

extension Image {
  public var size: Size {
    let width = Int(MagickGetImageWidth(self.pointer))
    let height = Int(MagickGetImageHeight(self.pointer))
    return Size(width: width, height: height)
  }

	public var width: Int {
		Int(MagickGetImageWidth(self.pointer))
	}

	public var height: Int {
		Int(MagickGetImageHeight(self.pointer))
	}
}
