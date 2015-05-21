//
//  GameOfLifeTests.swift
//  GameOfLifeTests
//
//  Created by Evan on 21/05/15.
//  Copyright (c) 2015 evancoding. All rights reserved.
//

import Quick
import Nimble
import GameOfLife

class GameOfLifeSpec: QuickSpec {
    override func spec() {
        var model:GameOfLifeModel!
        beforeEach {
            model = GameOfLifeModel(rows: 3, columns: 3)
        }
        
        describe("Rule #1") {
            context("A live cell with fewer than 2 live neighbours") {
                it("will die") {
                    model.makeCellBeAliveAtRow(1, column: 1)
                    
                    // 0 live neighbours
                    expect(model.willCellBeAliveAtRow(1, column: 1)).to(beFalse())
                    
                    // 1 live neighbour
                    model.makeCellBeAliveAtRow(0, column: 0)
                    expect(model.willCellBeAliveAtRow(1, column: 1)).to(beFalse())
                }
            }
        }
        
        describe("Rule #2") {
            context("A live cell with two or three live neighbours") {
                it("will live") {
                    model.makeCellBeAliveAtRow(1, column: 1)
                    
                    // 2 live neighbours
                    model.makeCellBeAliveAtRow(0, column: 0)
                    model.makeCellBeAliveAtRow(0, column: 1)
                    expect(model.willCellBeAliveAtRow(1, column: 1)).to(beTrue())
                    
                    // 3 live neighbours
                    model.makeCellBeAliveAtRow(0, column: 2)
                    expect(model.willCellBeAliveAtRow(1, column: 1)).to(beTrue())
                }
            }
        }
        
        describe("Rule #3") {
            context("A live cell with more than three live neighbours") {
                it("will die") {
                    model.makeCellBeAliveAtRow(1, column: 1)
                    
                    // 4 live neighbours
                    model.makeCellBeAliveAtRow(0, column: 0)
                    model.makeCellBeAliveAtRow(0, column: 1)
                    model.makeCellBeAliveAtRow(2, column: 0)
                    model.makeCellBeAliveAtRow(2, column: 1)
                    expect(model.willCellBeAliveAtRow(1, column: 1)).to(beFalse())
                    
                    // 5 live neighbours
                    model.makeCellBeAliveAtRow(2, column: 2)
                    expect(model.willCellBeAliveAtRow(1, column: 1)).to(beFalse())
                }
            }
        }
    }
}