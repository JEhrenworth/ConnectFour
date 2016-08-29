//
//  GameOver.swift
//  ConnectFour
//
//  Created by Jackson Ehrenworth 18 on 8/28/16.
//  Copyright © 2016 Jackson Ehrenworth 18. All rights reserved.
//

import UIKit

extension ViewController {
    
    func gameOver(player: Turn, board: Array<String>, item: Int, section: Int) -> Bool {
        
        if hasWon(player, board: board, item: item, section: section) || draw(board) {
            return true
        }; return false
    }
    
    func hasWon(player: Turn, board: Array<String>, item: Int, section: Int) -> Bool {        
        let hasWon: Bool = hasWonOnVertical(player, board: board, item: item, section: section) ||
            hasWonOnHorizontal(player, board: board, item: item, section: section) ||
            hasWonOnDiagonal(player, board: board, item: item, section: section)
        return hasWon
    }
    
    /// Returns true if a player has won on a diagonal given an arbitrary board.
    /// - parameters:
    ///   - player: The player to use when figuring out if the game has been won.
    ///   - board: The board to search on.
    ///   - item: The item of the current move.
    ///   - section: The section of the current move.
    func hasWonOnDiagonal(player: Turn, board: Array<String>, item: Int, section: Int) -> Bool {
        var numberOfMovesInARow: Int = Int()
        let indices: (Array<Int>, Array<Int>) = indicesOfDiagonal(item, section: section)
        
        /* Check first diagonal */
        for index in indices.0 {
            if board[index] == player.uniqueIdentifier() {
                numberOfMovesInARow += 1
            }
        }; if numberOfMovesInARow >= 4 {
            return true
        }; numberOfMovesInARow = 0
        
        /* Check second diagonal */
        for index in indices.1 {
            if board[index] == player.uniqueIdentifier() {
                numberOfMovesInARow += 1
            }
        }; return numberOfMovesInARow >= 4 ? true : false
    }
    
    /// Returns true if a player has won on a vertical given an arbitrary board.
    /// - parameters:
    ///   - player: The player to use when figuring out if the game has been won.
    ///   - board: The board to search on.
    ///   - item: The item of the current move.
    ///   - section: The section of the current move.
    func hasWonOnVertical(player: Turn, board: Array<String>, item: Int, section: Int) -> Bool {
        var numberOfMovesInARow: Int = Int()
        let range: (Int, Int) = rangeOfSection(section)
        
        for index in range.0...range.1 {
            if board[index] == player.uniqueIdentifier() {
                numberOfMovesInARow += 1
            }
        }; return numberOfMovesInARow >= 4 ? true : false
    }
    
    /// Returns true if a player has won on a horizontol given an arbitrary board.
    /// - parameters:
    ///   - player: The player to use when figuring out if the game has been won.
    ///   - board: The board to search on.
    ///   - item: The item of the current move.
    ///   - section: The section of the current move.
    func hasWonOnHorizontal(player: Turn, board: Array<String>, item: Int, section: Int) -> Bool {
        var numberOfMovesInARow: Int = Int()
        
        for index in indicesOfRow(item) {
            if board[index] == player.uniqueIdentifier() {
                numberOfMovesInARow += 1
            }
        }; return numberOfMovesInARow >= 4 ? true : false
    }
    
    /// Returns true if every square of the board has been taken.
    /// - parameters:
    ///   - board: The board to check for a draw on.
    func draw(board: Array<String>) -> Bool {
        for square in board {
            if squareIsValid(square) {
                return false
            }
        }; return true
    }
}
