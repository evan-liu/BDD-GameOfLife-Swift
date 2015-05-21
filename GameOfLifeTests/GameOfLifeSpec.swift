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
    }
}