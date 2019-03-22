//
//  Size.swift
//  MagickBirdLib
//
//  Created by Daniel Ramteke on 3/22/19.
//

import Foundation

public struct Size {
  public static let zero = Size()

  public let width: Int
  public let height: Int

  public init(side: Int) {
    self.init(width: side, height: side)
  }

  public init(width: Int = 0, height: Int = 0) {
    self.width = width
    self.height = height
  }
}

extension Size: Equatable {
  public static func ==(lhs: Size, rhs: Size) -> Bool {
    return lhs.width == rhs.width
      && lhs.height == rhs.height
  }
}

extension Size {
  var longestLength: Int {
    return max(self.width, self.height)
  }
}

extension Size {
  var tilingTimes: Int {
    // Calculates how often an image with given dimension can
    // be divided by two until 1x1 px are reached.
    return Int(ceil(log2(Double(self.longestLength))/log2(2)))
  }
}
