import Foundation
import MagickWand

extension Image {
  public func setFormat(_ string: String) {
    MagickSetImageFormat(self.pointer, string)
  }
  
  public func setCompressionQuality(_ int: Int) {
    MagickSetImageCompressionQuality(self.pointer, int)
  }

  public func setResolution(_ a: Double, _ b: Double) {
    MagickSetImageResolution(self.pointer, a, b)
  }
}
