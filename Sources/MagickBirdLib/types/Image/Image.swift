//
//  Image.swift
//  MagickBird
//
//  Created by Daniel Ramteke on 3/22/19.
//

import Foundation
import MagickWand

public class Image {
  var pointer: OpaquePointer

  public convenience init?(filePath: String) {
    self.init()
    MagickReadImage(self.pointer, filePath)
  }

  public var isMagickWand: Bool {
    return IsMagickWand(self.pointer).bool
  }

  public func clear() {
    guard self.isMagickWand else { return }
    ClearMagickWand(self.pointer)
  }

  public func clone() -> Self? {
    guard let pointer = CloneMagickWand(self.pointer) else { return nil }
    return type(of: self).init(pointer: pointer)
  }

  public func destroy() {
    guard self.isMagickWand else { return }
    DestroyMagickWand(self.pointer)
  }

  public required init?() {
    guard let pointer = NewMagickWand() else { return nil }
    self.pointer = pointer
  }

  public required init(pointer: OpaquePointer) {
    self.pointer = pointer
  }

  public convenience init?(data: Data) {
    self.init()

    self.read(data: data)
  }

  public convenience init?<T>(bytes: UnsafePointer<T>, length: Int) {
    self.init()

    self.read(bytes: bytes, length: length)
  }

  public convenience init?(bytes: [UInt8]) {
    self.init()

    self.read(bytes: bytes)
  }

  public func read(data: Data) {
    let length = data.count
    let bytes = UnsafeMutablePointer<UInt8>.allocate(capacity: length)

    data.copyBytes(to: bytes, count: length)

    self.read(bytes: bytes, length: length)

    bytes.deallocate()
  }

  public func read<T>(bytes: UnsafePointer<T>, length: Int) {
    let bytes = UnsafePointer<UInt8>(OpaquePointer(bytes))

    let bufferPointer = UnsafeBufferPointer(start: bytes, count: length)
    let array = Array(bufferPointer)

    self.read(bytes: array)
  }

  public func read(bytes: [UInt8]) {
    MagickReadImageBlob(self.pointer, bytes, bytes.count)
  }

  deinit {
    self.clear()
    self.destroy()
  }

  public var imageBytes: [UInt8] {
    var size: Int = 0
    guard let imageBlob = MagickGetImageBlob(self.pointer, &size) else {
      return []
    }
    
    defer {
      MagickRelinquishMemory(imageBlob)
    }
    
    var result = [UInt8](repeating: 0, count: size)
    for i in 0..<size {
        result[i] = imageBlob[i]
    }
    
    return result
  }
    
  public var data: Data? {
    let array = self.imageBytes
    
    guard array.count > 0 else { return nil }
    
    return Data(bytes: array)
  }
}
