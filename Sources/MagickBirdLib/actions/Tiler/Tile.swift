
public struct Tile {
  public let level: Int
  public let position: Position
  public let image: Image

  public init(level: Int, position: Position, image: Image) {
    self.level = level
    self.position = position
    self.image = image
  }

  public struct Position {
    public let x: Int
    public let y: Int

    public init(x: Int, y: Int) {
      self.x = x
      self.y = y
    }
    
    public func incrementedX() -> Position {
      return Position(x: x + 1, y: y)
    }

    public func incrementedY() -> Position {
      return Position(x: x, y: y + 1)
    }

    public static let zero: Position = Position(x: 0, y: 0)
  }
}

extension Tile: Writable {
  public var filename: String {
    return "\(level)_\(position.x)_\(position.y).png"
  }
}
