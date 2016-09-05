
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
            return "Player One"
        case Turn.PlayerTwo:
            return "Player Two"
        }
    }
}

extension ViewController {
    
    /// Returns the item and section of the first valid move in a given section, if no valid move is present returns nil.
    /// - parameters:
    ///   - section: The section to use when finding a valid move.
    ///   - board: The board to use to find a valid move from.
    func validMoveInSection(section: Int, board: UInt64) -> (Int, Int)? {
        
        guard let rangeOfMoves: (Int, Int) = rangeOfItemsNotUsedInSection(section, board: board) else { return nil }

        let item: Int = rangeOfMoves.1
        
        return (item, section)
    }
}
