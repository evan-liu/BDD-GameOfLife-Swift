//
//  GameOfLifeModel.swift
//  GameOfLife
//
//  Created by Evan on 21/05/15.
//  Copyright (c) 2015 evancoding. All rights reserved.
//

import Foundation

public class GameOfLifeModel {
    public var rows: Int
    public var columns: Int
    
    private var aliveMap = [String:Bool]()
    
    public init(rows:Int, columns:Int) {
        self.rows = rows
        self.columns = columns;
    }
    
    public func isCellAliveAtRow(row: Int, column: Int) -> Bool {
        return aliveMap[keyOfCellAtRow(row, column: column)] == true
    }
    
    public func makeCellBeAliveAtRow(row: Int, column: Int) {
        aliveMap[keyOfCellAtRow(row, column: column)] = true
    }
    
    public func willCellBeAliveAtRow(row: Int, column: Int) -> Bool {
        var aliveNeighbours = 0
        for i in row - 1...row + 1 {
            for j in column - 1...column + 1 {
                if !(i == row && j == column) && isCellAliveAtRow(i, column: j) {
                    aliveNeighbours++
                }
            }
        }
        
        if isCellAliveAtRow(row, column: column) {
            return aliveNeighbours == 2 || aliveNeighbours == 3
        }
        
        return false
    }
    
    private func keyOfCellAtRow(row: Int, column: Int) -> String {
        return "\(row)_\(column)";
    }
}