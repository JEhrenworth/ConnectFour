//
//  GameHelpers.swift
//  ConnectFour
//
//  Created by Jackson Ehrenworth 18 on 8/26/16.
//  Copyright © 2016 Jackson Ehrenworth 18. All rights reserved.
//

import UIKit

extension ViewController {
    
    /// Returns the opposite turn to the turn passed in.
    /// - parameters: 
    ///   - turn: Turn to switch.
    func oppositeTurn(turn: Turn) -> Turn {
        if turn == Turn.PlayerOne {
            return Turn.PlayerTwo
        }; return Turn.PlayerOne
    }
}
