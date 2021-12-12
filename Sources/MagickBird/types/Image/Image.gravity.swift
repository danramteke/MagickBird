
import Foundation
import MagickWand

public enum Gravity: Equatable, CaseIterable {

  case undefined,
       forget,
       northWest,
       north,
       northEast,
       west,
       center,
       east,
       southWest,
       south,
       southEast

  public init(gravityType: GravityType) {
    switch gravityType {
    case ForgetGravity:
      self = .forget

    case NorthWestGravity:
      self = .northWest
    case NorthGravity:
      self = .north
    case NorthEastGravity:
      self = .northEast
    case WestGravity:
      self = .west
    case CenterGravity:
      self = .center
    case EastGravity:
      self = .east
    case SouthWestGravity:
      self = .southWest
    case SouthGravity:
      self = .south
    case SouthEastGravity:
      self = .southEast

    default:
      self = .undefined
    }
  }

  public var gravityType: GravityType {
    switch self {
    case .undefined:
      return UndefinedGravity
    case .forget:
      return ForgetGravity
    case .northWest:
      return NorthWestGravity
    case .north:
      return NorthGravity
    case .northEast:
      return NorthGravity
    case .west:
      return WestGravity
    case .center:
      return CenterGravity
    case .east:
      return EastGravity
    case .southWest:
      return SouthWestGravity
    case .south:
      return SouthGravity
    case .southEast:
      return SouthEastGravity
    }
  }
}

extension Image {

  public var gravity: Gravity {
    get {
      Gravity(gravityType: MagickGetImageGravity(self.pointer))
    }
    set {
      MagickSetGravity(self.pointer, newValue.gravityType)
    }
  }
}
