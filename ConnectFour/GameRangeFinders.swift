//
//  GameRangeFinders.swift
//  ConnectFour
//
//  Created by Jackson Ehrenworth 18 on 8/27/16.
//  Copyright © 2016 Jackson Ehrenworth 18. All rights reserved.
//

import UIKit

extension ViewController {
    
    /// Returns a range of all the cells that haven't been used in a given section.
    /// - parameters:
    ///   - section: The section to use when finding range.
    ///   - board: The board to find the use when finding the range.
    func rangeOfMovesNotUsedInSection(section: Int, board: Array<String>) -> (Int, Int)? {
        let sectionRange: (Int, Int) = rangeOfSection(section)
        let start: Int = sectionRange.0
        var end: Int = -1
        
        for (index, square) in board[sectionRange.0...sectionRange.1].enumerate() {
            if squareIsValid(square) {
                end = index
            } else {
                break
            }
        }
        
        if end == -1 {
            return nil
        }; return (start, end)
    }
    
    /// Returns the range of a given section.
    /// - parameters:
    ///   - section: The section to find the range of.
    func rangeOfSection(section: Int) -> (Int, Int) {
        let start: Int = section * collectionView.numberOfItemsInSection(section)
        let end: Int = start + collectionView.numberOfItemsInSection(section) - 1

        return (start, end)
    }
    
    /// Returns the indices of the board in a given row.
    /// - parameters: 
    ///   - row: The row to use when finding the indices.
    func indicesOfRow(row: Int) -> Array<Int> {
        
        var indices: Array<Int> = []
        
        for section in 0...5 {
            indices.append(row + collectionView.numberOfItemsInSection(section) * section)
        }; return indices
    }
    
    /// Returns the indices of the diagonals of the board on a given move.
    /// - parameters: 
    ///   - item: The item of the move.
    ///   - section: The section of the move.
    func indicesOfDiagonal(item: Int, section: Int) -> (Array<Int>, Array<Int>) {
        let indicesOfDiagonalOne: Array<Int> = indicesUpAndRight(item, section: section) + indicesDownAndLeft(item, section: section)
        let indicesOfDiagonalTwo: Array<Int> = indicesUpAndLeft(item, section: section) + indicesDownAndRight(item, section: section)
        
        return (indicesOfDiagonalOne, indicesOfDiagonalTwo)
    }

}