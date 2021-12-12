import MagickWand

extension Pixel {

  public var alphaQuantum: Quantum {
    get {
      PixelGetAlphaQuantum(self.pointer)
    }
    set {
      PixelSetAlphaQuantum(self.pointer, newValue)
    }
  }

  public var blackQuantum: Quantum {
    get {
      PixelGetBlackQuantum(self.pointer)
    }
    set {
      PixelSetBlackQuantum(self.pointer, newValue)
    }
  }

  public var blueQuantum: Quantum {
    get {
      PixelGetBlueQuantum(self.pointer)
    }
    set {
      PixelSetBlueQuantum(self.pointer, newValue)
    }
  }

  public var redQuantum: Quantum {
    get {
      PixelGetRedQuantum(self.pointer)
    }
    set {
      PixelSetRedQuantum(self.pointer, newValue)
    }
  }

  public var greenQuantum: Quantum {
    get {
      PixelGetGreenQuantum(self.pointer)
    }
    set {
      PixelSetGreenQuantum(self.pointer, newValue)
    }
  }

  public var yellowQuantum: Quantum {
    get {
      PixelGetYellowQuantum(self.pointer)
    }
    set {
      PixelSetYellowQuantum(self.pointer, newValue)
    }
  }

  public var cyanQuantum: Quantum {
    get {
      PixelGetCyanQuantum(self.pointer)
    }
    set {
      PixelSetCyanQuantum(self.pointer, newValue)
    }
  }

  public var magentaQuantum: Quantum {
    get {
      PixelGetMagentaQuantum(self.pointer)
    }
    set {
      PixelSetMagentaQuantum(self.pointer, newValue)
    }
  }
}
