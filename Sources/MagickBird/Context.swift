import MagickWand

public func MagickBirdContext(block: @escaping ()->()) {
  MagickWandGenesis()


  block()
	MagickWandTerminus()
}
