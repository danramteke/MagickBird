public struct Tile {

  public let level: Int
  public let position: Position
  public let image: Image

  public init(level: Int, position: Position, image: Image) {
    self.level = level
    self.position = position
    self.image = image
  }

  public var filestem: String {
    "\(level)_\(position.x)_\(position.y)"
  }
}

extension Tile {

  public struct Position {
    public let x: Int
    public let y: Int

    public init(x: Int, y: Int) {
      self.x = x
      self.y = y
    }

    public var incrementingX: Self {
      .init(x: x + 1, y: y)
    }

    public var incrementingY: Self {
      .init(x: x, y: y + 1)
    }

    public var resettingX: Self {
      .init(x: 0, y: y)
    }

    public var resettingY: Self {
      .init(x: x, y: 0)
    }

    public static let zero: Self = .init(x: 0, y: 0)
  }
}
