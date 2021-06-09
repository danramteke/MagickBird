import Foundation
import MagickWand

extension MagickBooleanType {
  public var bool: Bool {
    switch self {
    case MagickFalse: return false
    case MagickTrue: return true
    default:
      fatalError("could not parse true or false")
    }
  }
}
