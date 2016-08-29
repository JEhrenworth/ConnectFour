
//
//  GameOver.swift
//  ConnectFour
//
//  Created by Jackson Ehrenworth 18 on 8/27/16.
//  Copyright © 2016 Jackson Ehrenworth 18. All rights reserved.
//

import UIKit

extension ViewController {
    
    func handleGameOver() {
        turnLabel.font = UIFont(name: turnLabel.font.fontName, size: 30)
        if draw(board) {
            turnLabel.text = "It's a Draw, Nobody Wins."
        } else {
            print(turnLabel.font)
            turnLabel.text = "\(currentTurn.uniqueIdentifier()) Wins!"
        }
    }
    
    func resetGame() {
        changeColorOfCells(collectionView.visibleCells(), color: UIColor.grayColor())
        board = [String](count: 42, repeatedValue: "")
    }
}