import Foundation

public protocol Writable {
  var filename: String { get }
  var image: Image { get }
}

public class Writer {
  let outputDir: URL
  public init(outputDir: String) {
    self.outputDir = URL(fileURLWithPath: outputDir)
  }
  public func write(_ writable: Writable) {
    // self.outputDir + writable.filename
    self.write(image: writable.image, to: writable.filename)
  }

  public func write(image: Image, to filename: String) {
    if #available(OSX 10.11, *) {
      let url = URL(fileURLWithPath: filename, relativeTo: self.outputDir)
      try! image.data!.write(to: url, options: .atomic)
    } else {
      fatalError("requires OS X 10.11")
    }

  }
}
