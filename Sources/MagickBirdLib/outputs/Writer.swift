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
    self.write(image: writable.image, to: writable.filename)
  }

  public func write(image: Image, to filename: String) {
    let url = URL(fileURLWithPath: "\(self.outputDir)\(filename)")
    try! image.data!.write(to: url, options: .atomic)
  }
}
