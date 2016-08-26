//
//  CollectionViewHelpers.swift
//  ConnectFour
//
//  Created by Jackson Ehrenworth 18 on 8/26/16.
//  Copyright © 2016 Jackson Ehrenworth 18. All rights reserved.
//

import UIKit

extension ViewController {
    
    /// Returns all cells in a given section.
    /// - parameters:
    ///   - section: The section to use when finding cells to return.
    func cellsInSection(section: Int) -> Array<UICollectionViewCell> {
        
        var cells: Array<UICollectionViewCell> = []
        
        for item in 0...collectionView.numberOfItemsInSection(section) - 1 {
            cells.append(collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: item, inSection: section))!)
        }; return cells
    }
    
    /// Changes the background color of all specified cells to the specified color.
    /// - parameters:
    ///   - cells: The cells to change the color of.
    ///   - color: The color to change the cells to.
    func changeColorOfCells(cells: Array<UICollectionViewCell>, color: UIColor) {
        for cell in cells {
            cell.backgroundColor = color
        }
    }
    
    /// Returns cells that haven't been moved on in a given section.
    /// - parameters:
    ///   - section: The section to use when finding cells.
    func cellsNotUsedInSection(section: Int) -> Array<UICollectionViewCell> {
        let cells: Array<UICollectionViewCell> = cellsInSection(section)
        var filteredCells: Array<UICollectionViewCell> = []
        
        let cellNotInUseTagConst: Int = 0
        
        for cell in cells {
            if cell.tag == cellNotInUseTagConst {
                filteredCells.append(cell)
            }
        }; return filteredCells
    }
}