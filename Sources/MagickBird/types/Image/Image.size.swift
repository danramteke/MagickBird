import Foundation
import MagickWand

extension Image {
  public var size: Size {
    let width = MagickGetImageWidth(self.pointer)
    let height = MagickGetImageHeight(self.pointer)
    return Size(width: width, height: height)
  }
  
  public var width: Int {
    MagickGetImageWidth(self.pointer)
  }
  
  public var height: Int {
    MagickGetImageHeight(self.pointer)
  }
}
