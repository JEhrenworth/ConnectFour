//
//  CollectionViewHelpers.swift
//  ConnectFour
//
//  Created by Jackson Ehrenworth 18 on 8/26/16.
//  Copyright © 2016 Jackson Ehrenworth 18. All rights reserved.
//

import UIKit

extension ViewController {
    
    /// Changes the background color of all specified cells to the specified color.
    /// - parameters:
    ///   - cells: The cells to change the color of.
    ///   - color: The color to change the cells to.
    func changeColorOfCells(cells: Array<UICollectionViewCell>, color: UIColor) {
        for cell in cells {
            cell.backgroundColor = color
        }
    }
}