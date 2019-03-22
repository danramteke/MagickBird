import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(MagickBirdTests.allTests),
    ]
}
#endif