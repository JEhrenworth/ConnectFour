//
//  GameOver.swift
//  ConnectFour
//
//  Created by Jackson Ehrenworth 18 on 8/28/16.
//  Copyright © 2016 Jackson Ehrenworth 18. All rights reserved.
//

import UIKit

extension ViewController {
    
    /// Returns true if the game is over on a board, either because of a draw or a win.
    /// - parameters:
    ///   - playerBoard: The current players bitboard.
    ///   - combinedBoard: The both players combined bitboard. I.e. `bitboardPlayerOne | bitboardPlayerTwo`
    func gameOver(playerBoard: UInt64, combinedBoard: UInt64) -> Bool {
        
        if hasNumberOfMovesInARow(playerBoard, numberOfMoves: 4) || draw(combinedBoard) {
            return true
        }; return false
    }

    /// Returns true if the board has more the x number of move in a row on it.
    /// - parameters: 
    ///   - board: The board to check for move on.
    ///   - numberOfMoves: The number of move in a row to check for.  **Must be > 1.**
    func hasNumberOfMovesInARow(board: UInt64, numberOfMoves: UInt64) -> Bool {
        
        if numberOfMoves < 2 {
            assertionFailure("numberOfMoves must be greater than one ")
        }
        
        let diagonalOne: UInt64 = board & (board >> 6)
        let horizontal: UInt64 = board & (board >> 7)
        let diagonalTwo: UInt64 = board & (board >> 8)
        let vertical: UInt64 = board & (board >> 1)
        
        let shiftMultiplier: UInt64 = numberOfMoves - 2
        let verticalShift: UInt64 = shiftMultiplier
        
        let diagonalOneCheck: UInt64 = diagonalOne & (diagonalOne >> (shiftMultiplier * 6)) // check \ diagonal
        let horizontalCheck: UInt64 = horizontal & (horizontal >> (shiftMultiplier * 7))   // check horizontal -
        let diagonalTwoCheck: UInt64 = diagonalTwo & (diagonalTwo >> (shiftMultiplier * 8)) // check / diagonal
        let verticalCheck: UInt64 = vertical & (vertical >> verticalShift)           // check vertical |
        
        if diagonalOneCheck != 0 || horizontalCheck != 0 || diagonalTwoCheck != 0 || verticalCheck != 0 {
            return true
        }; return false
    }
    
    /// Returns true if the current board is a draw.
    /// - parameters: 
    ///   - board: The board to check for a draw on.
    func draw(board: UInt64) -> Bool {
        let bitsNeverUsedOnBoard: UInt64 = 0b0000010000001000000100000010000001000000100000011111111111111111
        let drawBoard: UInt64 = 0b1111111111111111111111111111111111111111111111111111111111111111
        let draw = (board | bitsNeverUsedOnBoard) == drawBoard
        
        return draw
    }
}
