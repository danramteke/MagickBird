import MagickBirdLib
import Foundation

let context = Context()
context.with {
  Tiler(inputPath: "./Samples/subway_map.png", outputPath: "./Samples/output").tile()
}
// MagickWandGenesis()
// let wand = NewMagickWand()
// let pixel = NewPixelWand()

// PixelSetColor(pixel, "#222222")
// MagickSetBackgroundColor(wand, pixel)

// MagickNewImage(wand, 100, 100, pixel)
// MagickWriteImage(wand, "test.jpg")

// DestroyMagickWand(wand)
// DestroyPixelWand(pixel)
// MagickWandTerminus()
