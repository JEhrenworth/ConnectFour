//
//  ViewController.swift
//  ConnectFour
//
//  Created by Jackson Ehrenworth 18 on 8/25/16.
//  Copyright © 2016 Jackson Ehrenworth 18. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var connectFourLabel: UILabel!
    
    @IBOutlet weak var turnLabel: UILabel!
    
    var currentTurn: Turn = Turn.PlayerOne
    
    var indexOfBestMove: Int = Int()
    
    var currentBoard: UInt64 = UInt64()
    var combinedBoard: UInt64 = UInt64()
    var boardForPlayerOne: UInt64 = UInt64()
    var boardForPlayerTwo: UInt64 = UInt64()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        turnLabel.text = "\(currentTurn.uniqueIdentifier()) to Play"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.LandscapeLeft,UIInterfaceOrientationMask.LandscapeRight]
    }
    
    @IBAction func newGameButtonPressed(sender: UIButton) {
        resetGame()
    }

}

