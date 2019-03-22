//
//  Size.swift
//  MagickBirdLib
//
//  Created by Daniel Ramteke on 3/22/19.
//

import Foundation
public struct Size: Equatable {

  public static let zero = Size()

  public var width: Int = 0
  public var height: Int = 0

  public init() { }

  public init(width: Int, height: Int) {
    self.width = width
    self.height = height
  }

  public static func ==(lhs: Size, rhs: Size) -> Bool {
    return lhs.width == rhs.width
      && lhs.height == rhs.height
  }

  public static func !=(lhs: Size, rhs: Size) -> Bool {
    return !(lhs == rhs)
  }
}
