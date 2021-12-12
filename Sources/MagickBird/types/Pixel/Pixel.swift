import MagickWand

public class Pixel {
  var pointer: OpaquePointer

  public var isPixelWand: Bool {
    IsPixelWand(self.pointer).bool
  }

  public func destroy() {
    guard self.isPixelWand else { return }
    DestroyPixelWand(self.pointer)
  }

  public required init() {
    self.pointer = NewPixelWand()
  }

  public required init?(pointer: OpaquePointer) {
    self.pointer = pointer
    guard isPixelWand else {
      return nil
    }
  }

  public func clone() -> Self? {
    guard let pointer = ClonePixelWand(self.pointer) else { return nil }
    return type(of: self).init(pointer: pointer)
  }
}
