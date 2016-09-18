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
        
        let section: int_fast8_t = int_fast8_t(indexPath.section)
        
        if let itemAndSectionOfValidMove: (uint_fast8_t, uint_fast8_t) = validMoveInSection(section, validMoves: validMoves) {
            
            let itemOfValidMove: uint_fast8_t = itemAndSectionOfValidMove.0
            let sectionOfValidMove: uint_fast8_t = itemAndSectionOfValidMove.1
            
            makePlayerMove(itemOfValidMove, section: sectionOfValidMove)
            
            currentBoard = currentTurn == Turn.PlayerOne ? boardForPlayerOne : boardForPlayerTwo
            combinedBoard = boardForPlayerOne | boardForPlayerTwo
            
            print(getIndexOfBestMove(boardForPlayerOne, boardForPlayerTwo: boardForPlayerTwo, turn: currentTurn, depth: 0, alpha: -NSIntegerMax, beta: NSIntegerMax))
            print(combinedBoard)
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
    func makePlayerMove(item: uint_fast8_t, section: uint_fast8_t) {
        let intItem: Int = Int(item)
        let intSection: Int = Int(section)
        let cellToMoveOn: UICollectionViewCell = collectionView.cellForItemAtIndexPath(
            NSIndexPath(forItem: intItem, inSection: intSection)
        )!
        
        cellToMoveOn.backgroundColor = currentTurn.color()
        
        let bitMove: uint_fast8_t = moveForBitBoardFromIndexAndSection(intItem, section: intSection)
        
        validMoves[intSection] = int_fast8_t(intItem - 1)
        
        if currentTurn == Turn.PlayerOne {
            boardForPlayerOne[Int(bitMove)] = 1
        } else {
            boardForPlayerTwo[Int(bitMove)] = 1
        }; print(validMoves)
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
        validMoves = Array<int_fast8_t>()
        
        connectFourLabel.text = "Connect Four"
        currentTurn = Turn.PlayerOne
    }
}
