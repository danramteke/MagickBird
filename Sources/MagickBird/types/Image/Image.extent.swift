import MagickWand

extension Image {

  /// Crop the current image
  public func extent(x: Int, y: Int, width: Int, height: Int) {
    MagickExtentImage(self.pointer, width, height, x, y)
  }
}
