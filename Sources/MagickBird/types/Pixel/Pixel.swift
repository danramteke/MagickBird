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

  public func clear() {
    guard self.isPixelWand else { return }
    ClearPixelWand(self.pointer)
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

  deinit {
    self.clear()
    self.destroy()
  }

  public convenience init(red: Double, blue: Double, green: Double) {
    self.init()
    self.red = red
    self.blue = blue
    self.green = green
  }

  public func clone() -> Self? {
    guard let pointer = ClonePixelWand(self.pointer) else { return nil }
    return type(of: self).init(pointer: pointer)
  }
}
