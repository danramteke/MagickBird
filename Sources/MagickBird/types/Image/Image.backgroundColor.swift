
import MagickWand

extension Image {
  public var backgroundColor: Pixel {
    get {
      let pixel = Pixel()
      MagickGetImageBackgroundColor(self.pointer, pixel.pointer)
      return pixel
    }
    set {
      MagickSetImageBackgroundColor(self.pointer, newValue.pointer)
    }
  }
}
