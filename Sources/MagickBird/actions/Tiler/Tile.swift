
public struct Tile {
  public let level: Int
  public let position: Position
  public let image: Image
	public let filetype: String

	public init(level: Int, position: Position, image: Image, filetype: String) {
    self.level = level
    self.position = position
    self.image = image
		self.filetype = filetype
  }

  public struct Position {
    public let x: Int
    public let y: Int

    public init(x: Int, y: Int) {
      self.x = x
      self.y = y
    }
    
    public var incrementingX: Position {
      return Position(x: x + 1, y: y)
    }

    public var incrementingY: Position {
      return Position(x: x, y: y + 1)
    }

    public var resettingX: Position {
      return Position(x: 0, y: y)
    }

    public var resettingY: Position {
      return Position(x: x, y: 0)
    }

    public static let zero: Position = Position(x: 0, y: 0)
  }
}

extension Tile: Writable {
  public var filename: String {
    "\(level)_\(position.x)_\(position.y).\(filetype)"
  }
}
