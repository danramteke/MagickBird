//
//  MagickBooleanType.swift
//  MagickBird
//
//  Created by Daniel Ramteke on 3/22/19.
//

import Foundation
import MagickWandMac

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
