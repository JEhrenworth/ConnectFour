//
//  ManageGame.swift
//  ConnectFour
//
//  Created by Jackson Ehrenworth 18 on 9/4/16.
//  Copyright © 2016 Jackson Ehrenworth 18. All rights reserved.
//

import UIKit

extension ViewController {
    
    func manageTurn(indexPath: NSIndexPath) {
        
        let section: Int = indexPath.section
        
        if let itemAndSectionOfValidMove: (Int, Int) = validMoveInSection(section, board: combinedBoard) {
            
            let itemOfValidMove: Int = itemAndSectionOfValidMove.0
            let sectionOfValidMove: Int = itemAndSectionOfValidMove.1
            
            makePlayerMove(itemOfValidMove, section: sectionOfValidMove)
            
            currentBoard = currentTurn == Turn.PlayerOne ? boardForPlayerOne : boardForPlayerTwo
            combinedBoard = boardForPlayerOne | boardForPlayerTwo
            
            print(getIndexOfBestMove(boardForPlayerOne, boardForPlayerTwo: boardForPlayerTwo, turn: currentTurn, depth: 0, alpha: -NSIntegerMax, beta: NSIntegerMax))
            
            if gameOver(currentBoard, combinedBoard: combinedBoard) {
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
        
        cellToMoveOn.backgroundColor = currentTurn.color()
        
        let bitMove = moveForBitBoardFromIndexAndSection(item, section: section)
        
        if currentTurn == Turn.PlayerOne {
            boardForPlayerOne[bitMove] = 1
        } else {
            boardForPlayerTwo[bitMove] = 1
        }
    }
    
    func handleGameOver() {
        if draw(combinedBoard) {
            connectFourLabel.text = "It's a Draw."
        } else {
            connectFourLabel.text = "\(currentTurn.uniqueIdentifier()) Wins!"
        }
    }
    
    /// Resets the game board and the UI.
    func resetGame() {
        changeColorOfCells(collectionView.visibleCells(), color: UIColor.grayColor())
        
        combinedBoard = UInt64()
        currentBoard = UInt64()
        boardForPlayerOne = UInt64()
        boardForPlayerTwo = UInt64()
        
        connectFourLabel.text = "Connect Four"
        currentTurn = Turn.PlayerOne
    }
}
