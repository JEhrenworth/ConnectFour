//
//  Minimax.swift
//  ConnectFour
//
//  Created by Jackson Ehrenworth 18 on 9/1/16.
//  Copyright © 2016 Jackson Ehrenworth 18. All rights reserved.
//

import UIKit

extension ViewController {
    
    func getIndexOfBestMove(boardForPlayerOne: UInt64, boardForPlayerTwo: UInt64, turn: Turn, depth: uint_fast8_t, alpha: Int, beta: Int) -> uint_fast8_t {
        
        minimax(
            boardForPlayerOne, boardForPlayerTwo: boardForPlayerTwo, validMoves: validMoves, turn: turn, depth: depth, alpha: alpha, beta: beta
        ); print(indexOfBestMove); return indexOfBestMove
    }
    
    func minimax(boardForPlayerOne: UInt64, boardForPlayerTwo: UInt64, validMoves: Array<int_fast8_t>, turn: Turn, depth: uint_fast8_t, alpha: Int, beta: Int) -> Int {
        let currentBoard: UInt64 = turn == Turn.PlayerOne ? boardForPlayerOne : boardForPlayerTwo
        let combinedBoard: UInt64 = boardForPlayerOne | boardForPlayerTwo
        
        if gameOver(currentBoard, combinedBoard: combinedBoard) || depth == 10 {
            return evaluateBoard(currentBoard, turn: turn, depth: depth)
        }

        var varAlpha: Int = alpha
        var varBeta: Int = beta
        let currentDepth = depth + 1
        var scores: Array<int_fast8_t> = []
        var moves: Array<uint_fast8_t> = []
        
        let children: Array<(UInt64, uint_fast8_t, Array<int_fast8_t>)> = getNewBoardStates(currentBoard, combinedBoard: combinedBoard, validMoves: validMoves)
        
        for childNode in children {
            let score: Int = turn == Turn.PlayerOne ?
                minimax(childNode.0, boardForPlayerTwo: boardForPlayerTwo, validMoves: childNode.2, turn: oppositeTurn(turn), depth: currentDepth, alpha: varAlpha, beta: varBeta) :
                minimax(boardForPlayerOne, boardForPlayerTwo: childNode.0, validMoves: childNode.2, turn: oppositeTurn(turn), depth: currentDepth, alpha: varAlpha, beta: varBeta)
            if turn == Turn.PlayerOne {
                if score > alpha { varAlpha = score }
            } else {
                if score < beta { varBeta = score }
            }; if varAlpha >= varBeta { return turn == Turn.PlayerOne ? varAlpha : varBeta }
            else { scores.append(int_fast8_t(score)); moves.append(childNode.1) }
        }
        
        if scores.count == 0 {
            return 0
        }
        
        if turn == Turn.PlayerOne {
            let maxScoreIndex = scores.indexOf(scores.maxElement()!)
            indexOfBestMove = moves[maxScoreIndex!]
            return Int(scores[maxScoreIndex!])
        } else {
            let maxScoreIndex = scores.indexOf(scores.minElement()!)
            indexOfBestMove = moves[maxScoreIndex!]
            return Int(scores[maxScoreIndex!])
        }
    }
    
    func evaluateBoard(board: UInt64, turn: Turn, depth: uint_fast8_t) -> Int {
        if hasNumberOfMovesInARow(board, numberOfMoves: 4) {
            return turn == Turn.PlayerOne ? 100 - Int(depth) : Int(depth) - 100
        } else {
            return 0
        }
    }
    
    /// Returns an array of tuples containing the new boards and the moves that were played to get them.
    /// - parameters:
    ///    - currentBoard: The current players board.
    ///    - combinedBoard: The board of both players combined.
    func getNewBoardStates(currentBoard: UInt64, combinedBoard: UInt64, validMoves: Array<int_fast8_t>) -> Array<(UInt64, uint_fast8_t, Array<int_fast8_t>)> {
        let itemAndSectionOfPossibleMoves: Array<(uint_fast8_t, uint_fast8_t)> = getIndexOfPossibleMoves(validMoves)
        var boardStates: Array<(UInt64, uint_fast8_t, Array<int_fast8_t>)> = []
        
        for itemAndSection in itemAndSectionOfPossibleMoves {
            let item: uint_fast8_t = itemAndSection.0
            let section: uint_fast8_t = itemAndSection.1
            let move: uint_fast8_t = moveForBitBoardFromIndexAndSection(Int(item), section: Int(section))
            let boardState: (UInt64, Array<int_fast8_t>) = newBoardFromMove(combinedBoard, validMoves: validMoves, move: move, item: item, section: section)
            
            boardStates.append(boardState.0, move, boardState.1)
            
        }; return boardStates
    }
    
    /// Returns a new board with the given move 'played' on the board.
    /// - parameters:
    ///   - combinedBoard: The board to play on.
    ///   - validMoves: An array of the lowest playable moves.
    ///   - move: The move to play on the board.
    ///   - item: Item of the move to play
    ///   - section: The section of the move to play.
    func newBoardFromMove(combinedBoard: UInt64, validMoves: Array<int_fast8_t>, move: uint_fast8_t, item: uint_fast8_t, section: uint_fast8_t) -> (UInt64, Array<int_fast8_t>) {
        var dupeBoard: UInt64 = combinedBoard
        var dupeMoves: Array<int_fast8_t> = validMoves
        dupeBoard[Int(move)] = 1
        dupeMoves[Int(section)] = int_fast8_t(int_fast8_t(item) - 1)
        
        return (dupeBoard, dupeMoves)
    }
    
    
    /// Returns the index on the board of all moves that are legal to play.
    /// - parameters:
    ///   - validMoves: The lowest playable moves on the board.
    func getIndexOfPossibleMoves(validMoves: Array<int_fast8_t>) -> Array<(uint_fast8_t, uint_fast8_t)> {
        var possibleMoves: Array<(uint_fast8_t, uint_fast8_t)> = []
        for section in 0...6 {
            if let itemAndSection: (uint_fast8_t, uint_fast8_t) = validMoveInSection(int_fast8_t(section), validMoves: validMoves) {
                possibleMoves.append((itemAndSection.0, itemAndSection.1))
            }
        }; return possibleMoves
    }
}
