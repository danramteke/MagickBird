import MagickWandMac
print("Hello, world!")

MagickWandGenesis()
let wand = NewMagickWand()
let pixel = NewPixelWand()

PixelSetColor(pixel, "#222222")
MagickSetBackgroundColor(wand, pixel)

MagickNewImage(wand, 100, 100, pixel)
MagickWriteImage(wand, "test.jpg")

DestroyMagickWand(wand)
DestroyPixelWand(pixel)
MagickWandTerminus()