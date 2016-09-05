//
//  Minimax.swift
//  ConnectFour
//
//  Created by Jackson Ehrenworth 18 on 9/1/16.
//  Copyright © 2016 Jackson Ehrenworth 18. All rights reserved.
//

import UIKit

extension ViewController {
    
    func getIndexOfBestMove(boardForPlayerOne: UInt64, boardForPlayerTwo: UInt64, turn: Turn, depth: Int, alpha: Int, beta: Int) -> Int {
        
        minimax(
            boardForPlayerOne, boardForPlayerTwo: boardForPlayerTwo, turn: turn, depth: depth, alpha: alpha, beta: beta
        ); return indexOfBestMove
    }
    
    func minimax(boardForPlayerOne: UInt64, boardForPlayerTwo: UInt64, turn: Turn, depth: Int, alpha: Int, beta: Int) -> Int {
        let currentBoard: UInt64 = turn == Turn.PlayerOne ? boardForPlayerOne : boardForPlayerTwo
        let combinedBoard: UInt64 = boardForPlayerOne | boardForPlayerTwo
        
        if gameOver(currentBoard, combinedBoard: combinedBoard) || depth == 15 {
            return evaluateBoard(currentBoard, turn: turn, depth: depth)
        }
        
        var varAlpha: Int = alpha
        var varBeta: Int = beta
        let currentDepth = depth + 1
        var scores: Array<Int> = []
        var moves: Array<Int> = []
        
        let children: Array<(UInt64, Int)> = getNewBoardStates(currentBoard, combinedBoard: combinedBoard)
        
        for childNode in children {
            let score: Int = turn == Turn.PlayerOne ?
            minimax(childNode.0, boardForPlayerTwo: boardForPlayerTwo, turn: oppositeTurn(turn), depth: currentDepth, alpha: varAlpha, beta: varBeta) :
            minimax(boardForPlayerOne, boardForPlayerTwo: childNode.0, turn: oppositeTurn(turn), depth: currentDepth, alpha: varAlpha, beta: varBeta)
            if turn == Turn.PlayerOne {
                if score > alpha { varAlpha = score }
            } else {
                if score < beta { varBeta = score }
            }; if varAlpha >= varBeta { return turn == Turn.PlayerOne ? varAlpha : varBeta }
            else { scores.append(score); moves.append(childNode.1) }
        }
        
        if turn == Turn.PlayerOne {
            let maxScoreIndex = scores.indexOf(scores.maxElement()!)
            indexOfBestMove = moves[maxScoreIndex!]
            return scores[maxScoreIndex!]
        } else {
            let maxScoreIndex = scores.indexOf(scores.minElement()!)
            indexOfBestMove = moves[maxScoreIndex!]
            return scores[maxScoreIndex!]
        }
    }
    
    func evaluateBoard(board: UInt64, turn: Turn, depth: Int) -> Int {
        if hasNumberOfMovesInARow(board, numberOfMoves: 4) {
            return turn == Turn.PlayerOne ? 100 - depth : depth - 100
        } else {
            return 0
        }
    }
    
    /// Returns an array of tuples containing the new boards and the moves that were played to get them.
    /// - parameters: 
    ///    - currentBoard: The current players board.
    ///    - combinedBoard: The board of both players combined.
    func getNewBoardStates(currentBoard: UInt64, combinedBoard: UInt64) -> Array<(UInt64, Int)> {
        let indexOfPossibleMoves: Array<Int> = getIndexOfPossibleMoves(combinedBoard)
        var boardStates: Array<(UInt64, Int)> = []
        
        for index in indexOfPossibleMoves {
            boardStates.append((newBoardFromMove(currentBoard, move: index), index))
        }; return boardStates
    }
    
    /// Returns a new board with the given move 'played' on the board.
    /// - parameters:
    ///   - board: The board to play on.
    ///   - move: The index on the `board` to play.
    func newBoardFromMove(combinedBoard: UInt64, move: Int) -> UInt64 {
        var dupeBoard: UInt64 = combinedBoard
        dupeBoard[move] = 1
        
        return dupeBoard
    }
    
    /// Returns the index on the board of all moves that are legal to play.
    /// - parameters: 
    ///   - board: The board to find moves on.
    func getIndexOfPossibleMoves(combinedBoard: UInt64) -> Array<Int> {
        var possibleMoves: Array<Int> = []
        for section in 0...6 {
            if let itemAndSection: (Int, Int) = validMoveInSection(section, board: combinedBoard) {
                possibleMoves.append(
                    moveForBitBoardFromIndexAndSection(itemAndSection.0, section: itemAndSection.1)
                )
            }
        }; return possibleMoves
    }
}
