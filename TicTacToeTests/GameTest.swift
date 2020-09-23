//
//  GameTest.swift
//  TicTacToeTests
//
//  Created by Rob Vance on 9/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTest: XCTestCase {
    
    func testMakeMark() {
        var testGame = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        
        try! testGame.makeMark(at: (0,0))
    }
    
    func testRestart() {
        var testGame = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        
        try! testGame.makeMark(at: (0,0))
        testGame.restart()
    }
    
}
