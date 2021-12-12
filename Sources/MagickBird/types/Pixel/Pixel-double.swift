import MagickWand

extension Pixel {

  public var alpha: Double {
    get {
      PixelGetAlpha(self.pointer)
    }
    set {
      PixelSetAlpha(self.pointer, newValue)
    }
  }

  public var black: Double {
    get {
      PixelGetBlack(self.pointer)
    }
    set {
      PixelSetBlack(self.pointer, newValue)
    }
  }

  public var blue: Double {
    get {
      PixelGetBlue(self.pointer)
    }
    set {
      PixelSetBlue(self.pointer, newValue)
    }
  }

  public var red: Double {
    get {
      PixelGetRed(self.pointer)
    }
    set {
      PixelSetRed(self.pointer, newValue)
    }
  }

  public var green: Double {
    get {
      PixelGetGreen(self.pointer)
    }
    set {
      PixelSetGreen(self.pointer, newValue)
    }
  }

  public var yellow: Double {
    get {
      PixelGetYellow(self.pointer)
    }
    set {
      PixelSetYellow(self.pointer, newValue)
    }
  }

  public var cyan: Double {
    get {
      PixelGetCyan(self.pointer)
    }
    set {
      PixelSetCyan(self.pointer, newValue)
    }
  }

  public var magenta: Double {
    get {
      PixelGetMagenta(self.pointer)
    }
    set {
      PixelSetMagenta(self.pointer, newValue)
    }
  }

  public var fuzz: Double {
    get {
      PixelGetFuzz(self.pointer)
    }
    set {
      PixelSetFuzz(self.pointer, newValue)
    }
  }
}
