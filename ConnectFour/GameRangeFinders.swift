//
//  GameRangeFinders.swift
//  ConnectFour
//
//  Created by Jackson Ehrenworth 18 on 8/27/16.
//  Copyright © 2016 Jackson Ehrenworth 18. All rights reserved.
//

import UIKit

extension ViewController {
    
    /// Returns a range of items that haven't been used in a paticular section.
    /// - parameters:
    ///   - section: The section to use when finding range.
    ///   - board: The board to use when finding the range.
    func rangeOfItemsNotUsedInSection(section: Int, board: UInt64) -> (Int, Int)? {
        let sectionRange: (Int, Int) = (0, 5)
        
        let moveStart: Int = moveForBitBoardFromIndexAndSection(sectionRange.1, section: section)
        let moveEnd: Int = moveForBitBoardFromIndexAndSection(sectionRange.0, section: section)
        
        var boardArrayRepr: Array<uint_fast8_t> = []
        
        for i in moveStart...moveEnd {
            boardArrayRepr.append(uint_fast8_t(board[i]))
        }
        
        let start: Int = sectionRange.0
        var end: Int = -1
        
        for (index, square) in boardArrayRepr.reverse().enumerate() {
            if square == 0 {
                end = index
            } else {
                break
            }
        }
        
        if end == -1 {
            return nil
        }; return (start, end)
    }
}