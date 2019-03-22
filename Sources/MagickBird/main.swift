import MagickWandMac
print("Hello, world!")
// MagickWand.ConvertImageCommand()
MagickWandGenesis()
let wand = NewMagickWand()
let pixel = NewPixelWand()

PixelSetColor(pixel, "red")
MagickSetBackgroundColor(wand, pixel)

MagickNewImage(wand, 100, 100, pixel)
MagickWriteImage(wand, "test.jpg")

DestroyMagickWand(wand)
DestroyPixelWand(pixel)
MagickWandTerminus()