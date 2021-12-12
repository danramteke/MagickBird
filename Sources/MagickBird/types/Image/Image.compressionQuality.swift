import Foundation
import MagickWand

extension Image {
  public var compressionQuality: Int {
    MagickGetCompressionQuality(self.pointer)
  }
  
  public func setCompressionQuality(_ int: Int) {
    MagickSetImageCompressionQuality(self.pointer, int)
  }
}
