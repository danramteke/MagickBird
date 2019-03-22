import MagickWandMac
import Foundation

public class Tiler {
  let inputPath: String
  let outputPath: String
  public init(inputPath: String, outputPath: String) {
    self.inputPath = inputPath
    self.outputPath = outputPath
  }
  public let tileSide = 512
  public func tile() {
    MagickWandGenesis()

    let wand: OpaquePointer = NewMagickWand()

    MagickReadImage(wand, "./Samples/subway_map.png")

   let image = Image(filePath: "./Samples/subway_map.png")!
   print(image.size)
print(MagickGetImageWidth(wand))
    print("done")
//    DestroyMagickWand(wand)
//    MagickWandTerminus()
  }
}

