import Foundation

public struct Rect {
  public let x: Int
  public let y: Int
  public let width: Int
  public let height: Int

  public init(x: Int, y: Int, width: Int, height: Int) {
    self.x = x
    self.y = y
    self.width = width
    self.height = height
  }

  public init(point: Point, size: Size) {
    self.x = point.x
    self.y = point.y
    self.width = size.width
    self.height = size.height
  }

  public var size: Size {
    return Size(width: width, height: height)
  }
}