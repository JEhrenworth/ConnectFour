//
//  DiagonalRangeFinders.swift
//  ConnectFour
//
//  Created by Jackson Ehrenworth 18 on 8/28/16.
//  Copyright © 2016 Jackson Ehrenworth 18. All rights reserved.
//

import UIKit

extension ViewController {
    
    /// Returns all the indices above and to the right of the move passed in.
    /// - note: Returns the move passed in in the list of indices.
    /// - parameters:
    ///   - item: The item of the move.
    ///   - section: The section of the move.
    func indicesUpAndRight(item: Int, section: Int) -> Array<Int> {
        var indicesUpAndRight: Array<Int> = []
        
        for i in 0...item {
            if section + i >= collectionView.numberOfSections() {
                break
            }; indicesUpAndRight.append(moveFromIndexAndSection(item - i, section: section + i))
        }; return indicesUpAndRight
    }
    
    /// Returns all the indices above and to the left of the move passed in.
    /// - note: Returns the move passed in in the list of indices.
    /// - parameters:
    ///   - item: The item of the move.
    ///   - section: The section of the move.
    func indicesUpAndLeft(item: Int, section: Int) -> Array<Int> {
        var indicesUpAndLeft: Array<Int> = []
        
        for i in 0...item {
            if section - i < 0 {
                break
            }; indicesUpAndLeft.append(moveFromIndexAndSection(item - i, section: section - i))
        }; return indicesUpAndLeft
    }
    
    /// Returns all the indices below and to the right of the move passed in.
    /// - note: Does not return the move passed in in the list of indices.
    /// - parameters:
    ///   - item: The item of the move.
    ///   - section: The section of the move.
    func indicesDownAndRight(item: Int, section: Int) -> Array<Int> {
        var indicesDownAndRight: Array<Int> = []
        
        // No items below in the case that a bottom item was selected
        if collectionView.numberOfItemsInSection(section) - item - 1 <= 0 {
            return indicesDownAndRight
        }
        
        for i in 1...(collectionView.numberOfItemsInSection(section) - item - 1) {
            if section + i >= collectionView.numberOfSections() {
                break
            }; indicesDownAndRight.append(moveFromIndexAndSection(item + i, section: section + i))
        }; return indicesDownAndRight
    }
    
    /// Returns all the indices below and to the left of the move passed in.
    /// - note: Does not return the move passed in in the list of indices.
    /// - parameters:
    ///   - item: The item of the move.
    ///   - section: The section of the move.
    func indicesDownAndLeft(item: Int, section: Int) -> Array<Int> {
        var indicesDownAndLeft: Array<Int> = []
        
        // No items below in the case that a bottom item was selected
        if collectionView.numberOfItemsInSection(section) - item - 1 <= 0 {
            return indicesDownAndLeft
        }
        
        for i in 1...(collectionView.numberOfItemsInSection(section) - item - 1) {
            if section - i < 0 {
                break
            }; indicesDownAndLeft.append(moveFromIndexAndSection(item + i, section: section - i))
        }; return indicesDownAndLeft
    }
}