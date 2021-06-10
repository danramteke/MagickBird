import Foundation
import MagickWand

extension Image {

	/// Crop the current image
  public func crop(x: Int, y: Int, width: Int, height: Int) {
    MagickCropImage(self.pointer, width, height, x, y)
    MagickResetImagePage(self.pointer, "0x0+0+0")
  }
}
