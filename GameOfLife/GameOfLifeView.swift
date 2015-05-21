//
//  GameOfLifeView.swift
//  GameOfLife
//
//  Created by Evan on 22/05/15.
//  Copyright (c) 2015 evancoding. All rights reserved.
//

import UIKit

protocol GameOfLifeViewDataSource {
    var numOfRows:Int {get}
    var numOfColumns:Int {get}
    func isCellAliveAtRow(row:Int, column: Int) -> Bool
}

class GameOfLifeView: UIView {
    var dataSource:GameOfLifeViewDataSource!
    
    private let startY = 30
    private let cellSize = 8
    
    override func drawRect(rect: CGRect) {
        if (dataSource == nil) {
            return
        }
        
        UIColor.blackColor().setFill()
        for i in 0..<dataSource.numOfRows {
            for j in 0..<dataSource.numOfColumns {
                if (dataSource.isCellAliveAtRow(i, column: j)) {
                    UIBezierPath(rect: CGRect(x: i * cellSize, y: startY + j * cellSize, width: cellSize, height: cellSize)).fill()
                }
            }
        }
    }
}
