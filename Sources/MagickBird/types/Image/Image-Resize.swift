import Foundation
import MagickWand

extension Image {
  public func resize(by factor: Double) {
    let newSize = self.size.scaled(by: factor)
    MagickResizeImage(self.pointer, newSize.width, newSize.height, LanczosFilter)
  }

  public func resize(to size: Size) {
    MagickResizeImage(self.pointer, size.width, size.height, LanczosFilter)
  }
}

private extension Size {
  func scaled(by factor: Double) -> Size {
    let newWidth = Int(Double(self.width) * factor + 0.5)
    let newHeight = Int(Double(self.height) * factor + 0.5)
    return Size(width: newWidth, height: newHeight)
  }
}
