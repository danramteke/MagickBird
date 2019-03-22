import MagickWand
public class Context {
  public init() {
    MagickWandGenesis()
  }
  deinit {
    MagickWandTerminus()
  }
  public func with(block: @escaping()->()) {
    block()
  }
}