import Foundation

public struct Point {
  public let x: Int
  public let y: Int

  public init(x: Int, y: Int) {
    self.x = x
    self.y = y
  }

  public static let zero = Point(x: 0, y: 0)

  public func incrementingX(by value: Int) -> Self {
    .init(x: x + value, y: y)
  }

  public func incrementingY(by value: Int) -> Self {
    .init(x: x, y: y + value)
  }

  public var resettingX: Self {
    .init(x: 0, y: y)
  }

  public var resettingY: Self {
    .init(x: x, y: 0)
  }
}