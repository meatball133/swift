import XCTest

@testable import ChessGame

let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

class TaskFileAndRanks: XCTestCase {
  func testRanks() {
    XCTAssertEqual(ranks, 1...8)
  }

  func testFiles() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(files, "A"..."H")
  }
}

class TaskIsValidSquare: XCTestCase {
  func testValidSquare() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isValidSquare(rank: 1, file: "A"))
  }

  func testAnotherValidSquare() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isValidSquare(rank: 8, file: "H"))
  }

  func testOutOfRankRange() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isValidSquare(rank: 9, file: "B"))
  }

  func testOutOfFileRange() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isValidSquare(rank: 1, file: "I"))
  }

  func testRankIsLessThanOne() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isValidSquare(rank: 0, file: "A"))
  }
}

class TaskMoveMessage: XCTestCase {
  func testValidMove() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(moveMessage(toRank: 1, toFile: "A"), "Moved to A1")
  }

  func testAnotherValidMove() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(moveMessage(toRank: 8, toFile: "H"), "Moved to H8")
  }

  func testInvalidMove() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(moveMessage(toRank: 9, toFile: "I"), "Invalid square")
  }

  func testInvalidMoveWithZeroRank() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(moveMessage(toRank: 0, toFile: "A"), "Invalid square")
  }
}
