//
//  GameHelpers.swift
//  ConnectFour
//
//  Created by Jackson Ehrenworth 18 on 8/26/16.
//  Copyright © 2016 Jackson Ehrenworth 18. All rights reserved.
//

import UIKit

extension ViewController {
    
    /// Maps an item and section to an index which can be used on the bitBoard.
    /// - parameters:
    ///   - item: The item to use when mapping.
    ///   - section: The section to use when mapping.
    func moveForBitBoardFromIndexAndSection(item: Int, section: Int) -> Int {
        let numberOfSections = 7
        return 5 - item + section * numberOfSections
    }
    
    /// Returns an array repr of the bitboard; this method uses uint_fast8_t because it can be quite a slow operation.  
    ///
    /// Useful when debugging.
    /// - parameters:
    ///   - board: The board to create an array from.
    func bitsInBitBoard(board: UInt64) -> Array<uint_fast8_t> {
        var bits: Array<uint_fast8_t> = []
        for i in 0...63 {
            bits.append(uint_fast8_t(board[i]))
        }; return bits
    }
    
    /// Returns the opposite turn to the turn passed in.
    /// - parameters: 
    ///   - turn: Turn to switch.
    func oppositeTurn(turn: Turn) -> Turn {
        if turn == Turn.PlayerOne {
            return Turn.PlayerTwo
        }; return Turn.PlayerOne
    }
}
