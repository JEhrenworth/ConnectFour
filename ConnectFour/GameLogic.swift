
//
//  GameLogic.swift
//  ConnectFour
//
//  Created by Jackson Ehrenworth 18 on 8/26/16.
//  Copyright © 2016 Jackson Ehrenworth 18. All rights reserved.
//

import UIKit

enum Turn {
    case PlayerOne
    case PlayerTwo
    
    func color() -> UIColor {
        switch self {
        case Turn.PlayerOne:
            return UIColor.blueColor()
        case Turn.PlayerTwo:
            return UIColor.redColor()
        }
    }
    
    func uniqueIdentifier() -> String {
        switch self {
        case Turn.PlayerOne:
            return "PlayerOne"
        case Turn.PlayerTwo:
            return "PlayerTwo"
        }
    }
}

extension ViewController {
    
    /// Returns the item and section of the first valid move in a given section, if no valid move is present returns nil.  When this is called, a cell can be extracted from the collection view.
    /// - parameters:
    ///   - section: The section to use when finding a valid move.
    ///   - board: The board to use to find a valid move from.
    func validMoveInSection(section: Int, board: Array<String>) -> (Int, Int)? {

        guard let rangeOfMoves: (Int, Int) = rangeOfMovesNotUsedInSection(section, board: board) else { return nil }
        
        let item: Int = rangeOfMoves.1
        
        return (item, section)
    }

    /// Returns true if a square hasn't been played on.
    /// - parameters:
    ///   - square: The square to check for validity.
    func squareIsValid(square: String) -> Bool {
        if square == "" {
            return true
        }; return false
    }
}
