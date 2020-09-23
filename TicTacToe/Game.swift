//
//  Game.swift
//  TicTacToe
//
//  Created by Rob Vance on 9/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    private(set) var board: GameBoard = GameBoard()
    internal var activePlayer: GameBoard.Mark? = .x
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark? = nil
    
    enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    var state: GameState {
        if let winningPlayer = winningPlayer {
            return .won(winningPlayer)
        } else if gameIsOver {
            return .cat
        } else {
            return .active(activePlayer!)
        }
    }
    
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let player = activePlayer else { return }
        
        try board.place(mark: player, on: coordinate)
        
        if game(board: board, isWonBy: player) {
            gameIsOver = true
            winningPlayer = player
            
        } else if board.isFull {
            gameIsOver = true
            winningPlayer = nil
        } else {
            if player == .x {
                self.activePlayer = .o
            } else {
                self.activePlayer = .x
            }
        }
    }
    
}
