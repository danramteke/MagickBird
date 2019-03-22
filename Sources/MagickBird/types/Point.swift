import Foundation

public struct Point {
  public let x: Int
  public let y: Int

  public init(x: Int, y: Int) {
    self.x = x
    self.y = y
  }

  public static let zero = Point(x: 0, y: 0)
}