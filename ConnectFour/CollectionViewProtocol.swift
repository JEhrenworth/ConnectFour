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
        handlePlayerTurn(indexPath)
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
//        let section: Int = indexPath.section
//        let cells: Array<UICollectionViewCell> = cellsNotUsedInSection(section)
//        
//        changeColorOfCells(cells, color: UIColor.grayColor())
    }
}
