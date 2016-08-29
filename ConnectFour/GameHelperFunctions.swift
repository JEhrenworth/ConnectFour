//
//  GameHelpers.swift
//  ConnectFour
//
//  Created by Jackson Ehrenworth 18 on 8/26/16.
//  Copyright © 2016 Jackson Ehrenworth 18. All rights reserved.
//

import UIKit

extension ViewController {
    
    func manageTurn(indexPath: NSIndexPath) {
        let section: Int = indexPath.section
        
        if let itemAndSectionOfValidMove: (Int, Int) = validMoveInSection(section, board: board) {
            
            let itemOfValidMove: Int = itemAndSectionOfValidMove.0
            let sectionOfValidMove: Int = itemAndSectionOfValidMove.1
            
            makePlayerMove(itemOfValidMove, section: sectionOfValidMove)
            if gameOver(currentTurn, board: board, item: itemOfValidMove, section: sectionOfValidMove) {
                handleGameOver()
            } else {
                currentTurn = oppositeTurn(currentTurn)
                turnLabel.text = "\(currentTurn.uniqueIdentifier()) to Play"
            }
        }
    }
    
    /// Updates the board and changes the UI to reflect.
    /// - parameters: 
    ///   - item: The item of the valid move.
    ///   - section: The section of the valid move.
    func makePlayerMove(item: Int, section: Int) {
        let cellToMoveOn: UICollectionViewCell = collectionView.cellForItemAtIndexPath(
            NSIndexPath(forItem: item, inSection: section)
        )!
        let move: Int = moveFromIndexAndSection(item, section: section)
        
        cellToMoveOn.backgroundColor = currentTurn.color()
        
        board = newBoardFromMove(move, board: board)
    }

    /// Returns a move (index) from a given item and section.
    /// - parameters:
    ///   - item: Item to use when finding the move.
    ///   - section: Section to use when finding the move.
    func moveFromIndexAndSection(item: Int, section: Int) -> Int {
        return item + collectionView.numberOfItemsInSection(section) * section
    }
    
    /// Returns a new board from a given move.
    /// - note: Function returns a new board, does not make the move on the given board.
    /// - parameters: 
    ///   - move: The index of the move on the board.
    ///   - board: The board to use when creating the board to return.
    func newBoardFromMove(move: Int, board: Array<String>) -> Array<String> {
        var newBoard: Array<String> = board
        
        newBoard[move] = currentTurn.uniqueIdentifier()
        
        return newBoard
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
