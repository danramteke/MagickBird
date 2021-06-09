//
//  Size.swift
//  MagickBirdLib
//
//  Created by Daniel Ramteke on 3/22/19.
//

import Foundation

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
  var longestLength: Int {
    max(self.width, self.height)
  }
}

extension Size {
  var tilingTimes: Int {
    // Calculates how often an image with given dimension can be divided by two until 1x1 px are reached.

    let sideLog = log(Double(self.longestLength))
    let denominator = log(Double(2))
    return Int(ceil(sideLog/denominator))
  }
}
