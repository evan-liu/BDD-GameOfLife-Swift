//
//  ViewController.swift
//  GameOfLife
//
//  Created by Evan on 21/05/15.
//  Copyright (c) 2015 evancoding. All rights reserved.
//

import UIKit

class GameOfLifeViewController: UIViewController, GameOfLifeViewDataSource {
    var model = GameOfLifeModel(rows: 38, columns: 30)
    
    var numOfRows:Int {
        return model.rows
    }
    
    var numOfColumns:Int {
        return model.columns
    }
    
    func isCellAliveAtRow(row:Int, column:Int) -> Bool {
        return model.isCellAliveAtRow(row, column: column)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var gunCells:[(Int, Int)] = [(1, 5), (1, 6), (2, 5), (2, 6), (11, 5), (11, 6), (11, 7), (12, 4), (12, 8), (13, 3), (13, 9), (14, 3), (14, 9), (15, 6), (16, 4), (16, 8), (17, 5), (17, 6), (17, 7), (18, 6), (21, 3), (21, 4), (21, 5), (22, 3), (22, 4), (22, 5), (23, 2), (23, 6), (25, 1), (25, 2), (25, 6), (25, 7), (35, 3), (35, 4), (36, 3), (36, 4)]
        for (row, column) in gunCells {
            model.makeCellBeAliveAtRow(row, column: column)
        }
        
        (view as! GameOfLifeView).dataSource = self
        
        var updater = CADisplayLink(target: self, selector: Selector("update"))
        updater.frameInterval = 5
        updater.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
    }
    
    func update() {
        model.nextFrame()
        view.setNeedsDisplay()
    }
}