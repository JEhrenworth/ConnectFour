//
//  RangeTests.swift
//  ConnectFour
//
//  Created by Jackson Ehrenworth 18 on 9/4/16.
//  Copyright © 2016 Jackson Ehrenworth 18. All rights reserved.
//

import XCTest
@testable import ConnectFour

extension ConnectFourTests {
    
    func testRangeOfSectionFinder() {
        let rangeOfSectionZeroOnBitBoard: (Int, Int) = (0, 5)
        let rangeOfSectionOneOnBitBoard: (Int, Int) = (7, 12)
        let rangeOfSectionTwoOnBitBoard: (Int, Int) = (14, 19)
        let rangeOfSectionFiveOnBitBoard: (Int, Int) = (35, 40)
        let rangeOfSectionSixOnBitBoard: (Int, Int) = (42, 47)
        
        let rangeOfSectionZeroOnBoard: (Int, Int) = (0, 5)
        let rangeOfSectionOneOnBoard: (Int, Int) = (6, 11)
        let rangeOfSectionTwoOnBoard: (Int, Int) = (12, 17)
        let rangeOfSectionFiveOnBoard: (Int, Int) = (30, 35)
        let rangeOfSectionSixOnBoard: (Int, Int) = (36, 41)
        
//        XCTAssert(viewController.rangeOfSection(0, forBitBoard: true) == rangeOfSectionZeroOnBitBoard)
//        XCTAssert(viewController.rangeOfSection(1, forBitBoard: true) == rangeOfSectionOneOnBitBoard)
//        XCTAssert(viewController.rangeOfSection(2, forBitBoard: true) == rangeOfSectionTwoOnBitBoard)
//        XCTAssert(viewController.rangeOfSection(5, forBitBoard: true) == rangeOfSectionFiveOnBitBoard)
//        XCTAssert(viewController.rangeOfSection(6, forBitBoard: true) == rangeOfSectionSixOnBitBoard)
//        
//        XCTAssert(viewController.rangeOfSection(0, forBitBoard: false) == rangeOfSectionZeroOnBoard)
//        XCTAssert(viewController.rangeOfSection(1, forBitBoard: false) == rangeOfSectionOneOnBoard)
//        XCTAssert(viewController.rangeOfSection(2, forBitBoard: false) == rangeOfSectionTwoOnBoard)
//        XCTAssert(viewController.rangeOfSection(5, forBitBoard: false) == rangeOfSectionFiveOnBoard)
//        XCTAssert(viewController.rangeOfSection(6, forBitBoard: false) == rangeOfSectionSixOnBoard)
    }
    
    func testRangeOfMovesNotUsedInSection() {
        let boardOne: UInt64 = 0b1100000000000000000000000000000000000000000000000000000000000000
        let boardOneRange: (Int, Int) = (2, 5)
        
//        XCTAssert(viewController.rangeOfMovesNotUsedInSection(0, board: boardOne, forBitBoard: true)! == boardOneRange)
    }
}