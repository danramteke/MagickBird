import Foundation

/// Represents the size of an image
public struct Size: Equatable  {
  public static let zero = Size(width: 0, height: 0)
  
  public let width: Int
  public let height: Int
  
  public init(side: Int) {
    self.init(width: side, height: side)
  }
  
  public init(width: Int, height: Int) {
    self.width = width
    self.height = height
  }
}

extension Size {
  
  /// Calculates the max of the width and height.
  public var longestSide: Int {
    max(self.width, self.height)
  }
}

extension Image {
  
  /// Calculates the max of the width and height.
  public var longestSide: Int {
    let size = self.size
    return max(size.width, size.height)
  }
}

extension Size {
  
  /// Calculates how often an image with given dimension can be divided by two until 1x1 px are reached.
  public var tilingTimes: Int {
    let sideLog = log(Double(self.longestSide))
    let denominator = log(Double(2))
    return Int(ceil(sideLog/denominator))
  }
}
