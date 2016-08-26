
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
        case .PlayerOne:
            return UIColor.blueColor()
        case .PlayerTwo:
            return UIColor.redColor()
        }
    }
}

extension ViewController {
    
    /// Returns the first cell that hasn't been played on in a given section, or nil if there are no valid cells.
    /// - parameters:
    ///   - section: The section to use when finding a valid cell.
    func validMoveInSection(section: Int) -> UICollectionViewCell? {
        let cells: Array<UICollectionViewCell> = cellsInSection(section)
        
        let cellNotInUseTagConst: Int = 0
        let cellInUseTagConst: Int = 1
        
        for cell in cells.reverse() {
            if cell.tag == cellNotInUseTagConst {
                cell.tag = cellInUseTagConst
                return cell
            }
        }; return nil
    }
}
