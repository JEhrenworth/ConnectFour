//
//  ConnectFourTests.swift
//  ConnectFourTests
//
//  Created by Jackson Ehrenworth 18 on 9/3/16.
//  Copyright © 2016 Jackson Ehrenworth 18. All rights reserved.
//

import XCTest
@testable import ConnectFour


/// **Test were temporary and do not work.  Will be updated.**
class ConnectFourTests: XCTestCase {
    
    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        viewController = storyboard.instantiateInitialViewController() as! ViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testMoveForBitBoardFromIndexAndSection() {
        XCTAssert(viewController.moveForBitBoardFromIndexAndSection(5, section: 0) == 0)
        XCTAssert(viewController.moveForBitBoardFromIndexAndSection(0, section: 0) == 5)
        XCTAssert(viewController.moveForBitBoardFromIndexAndSection(5, section: 1) == 7)
        XCTAssert(viewController.moveForBitBoardFromIndexAndSection(3, section: 3) == 23)
        XCTAssert(viewController.moveForBitBoardFromIndexAndSection(5, section: 6) == 42)
        XCTAssert(viewController.moveForBitBoardFromIndexAndSection(0, section: 6) == 47)
    }
    
    func testHasWonBitBoard() {
        let bitBoardWinFalseOne: UInt64 = 0b0000000000000000000000000000000000000000000000000000000000000000
        let bitBoardWinTrueVerticalOne: UInt64 = 0b1111000000000000000000000000000000000000000000000000000000000000
        var bitBoardWinTrueDiagonalOne: UInt64 = UInt64()
        bitBoardWinTrueDiagonalOne[0] = 1
        bitBoardWinTrueDiagonalOne[8] = 1
        bitBoardWinTrueDiagonalOne[16] = 1
        bitBoardWinTrueDiagonalOne[24] = 1
        var bitBoardWinTrueVerticalTwo: UInt64 = UInt64()
        bitBoardWinTrueVerticalTwo[5] = 1
        bitBoardWinTrueVerticalTwo[12] = 1
        bitBoardWinTrueVerticalTwo[19] = 1
        bitBoardWinTrueVerticalTwo[26] = 1
        
        XCTAssert(viewController.hasWonBitBoard(bitBoardWinFalseOne) == false)
        XCTAssert(viewController.hasWonBitBoard(bitBoardWinTrueVerticalOne) == true)
        XCTAssert(viewController.hasWonBitBoard(bitBoardWinTrueDiagonalOne) == true)
    }
}
