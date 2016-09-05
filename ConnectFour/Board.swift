//
//  Board.swift
//  ConnectFour
//
//  Created by Jackson Ehrenworth 18 on 9/3/16.
//  Copyright © 2016 Jackson Ehrenworth 18. All rights reserved.
//

import UIKit

extension UInt64 {
    
    /// Useful so that we can access the individual bits on a bit board. 
    ///
    /// `bitBoard[5] -> 5th bit` `bitboard[5] = 0 // sets bit 5 to 0`
    public subscript(index: Int) -> UInt64 {
        get {
            return (self >> UInt64(index)) & 1
        }
        set(newValue) {
            self |= 1 << UInt64(index)
        }
    }
}