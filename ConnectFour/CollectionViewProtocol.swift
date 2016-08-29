//
//  CollectionViewProtocol.swift
//  ConnectFour
//
//  Created by Jackson Ehrenworth 18 on 8/25/16.
//  Copyright © 2016 Jackson Ehrenworth 18. All rights reserved.
//

import UIKit

extension ViewController {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 7
    }
 
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        
        cell.backgroundColor = UIColor.grayColor()
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        manageTurn(indexPath)
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
//        let section: Int = indexPath.section
//        let cells: Array<UICollectionViewCell> = cellsNotUsedInSection(section)
//        
//        changeColorOfCells(cells, color: UIColor.grayColor())
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        // Compute the dimension of a cell for an NxN layout with space S between
        // cells.  Take the collection view's width, subtract (N-1)*S points for
        // the spaces between the cells, and then divide by N to find the final
        // dimension for the cell's width and height.
        
        let cellsAcross: CGFloat = 10
        let spaceBetweenCells: CGFloat = 5
        let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
        return CGSizeMake(dim, dim)
    }
}
