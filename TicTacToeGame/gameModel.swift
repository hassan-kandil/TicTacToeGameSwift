//
//  File.swift
//  TicTacToeGame
//
//  Created by auc on 1/22/20.
//  Copyright © 2020 AUC. All rights reserved.
//

import Foundation

class gameModel {
    var board = Array(repeating: Array(repeating: " ", count: 3), count: 3)
    var movesCount:Int = 9
    var isWinnerPlayer:Bool = false
    var isWinnerComp:Bool = false
    var compR:Int!          //the row that the computer played its move on
    var compC:Int!         //the column that the computer played its move on
    
    init(){
    }
    
    func resetBoard(){
    
    for i in 0...2 {
        for  j in 0...2{
            board[i][j] = " ";
        }
    
    }
    
    self.movesCount = 9;
    self.isWinnerPlayer = false;
    self.isWinnerComp = false;
    
    
    }

    
    func playMoveComputer(){
    
    if movesCount > 0 {
    
    
        movesCount = movesCount-1
    
        if !computerCanWin() {
            if !playerCanWin() {
                makeRandomMove();
            }
        }
    
    
        if isWinner(r: compR, c: compC, symbol: "O")
        {
            isWinnerComp = true;
        }
    
        }
    
    }
    
    
    func makeRandomMove(){
    
    var done = false
    var randomRow:Int
    var randomCol:Int
    
    repeat {
    randomRow = Int(arc4random())%3
    randomCol = Int(arc4random())%3
        
    if board[randomRow][randomCol] == " "
    {
        board[randomRow][randomCol] = "O";
        compR = randomRow;
        compC = randomCol;
        done = true;
    }
    
    
    }while !done
    
    }
    
    func isWinner(r: Int, c: Int, symbol: String) -> Bool {
    var countRow = 0;
    var countCol = 0;
    var countLDiag = 0;
    var countRDiag = 0;
    
    for i in 0...2 {
        if board[r][i] == symbol
        {
            countRow = countRow + 1
        }
        if board[i][c] == symbol
        {
            countCol =  countCol + 1
        }
        if board[i][i] == symbol
        {
            countRDiag = countRDiag + 1
        }
        if board[3-1-i][i] == symbol
        {
            countLDiag = countLDiag + 1
        }
        
    }
    
    if countCol==3 || countRow==3 || countLDiag == 3 || countRDiag == 3
    {
        return true
    }
    
    return false;
    }
    
    func playMovePlayer(r: Int, c: Int) -> Int {
    
    if r > 2 || c > 2
    {
        return  0;
    }
        
    if board[r][c] != " " {
        return 1;
    }
    else
    {
    board[r][c] = "X";
    movesCount = movesCount - 1
    isWinnerPlayer = isWinner(r: r , c: c, symbol: "X")
        
    }
    
    return 2;
    }
    
    func  computerCanWin() -> Bool{
        for i in 0...2 {
            for j in 0...2{
                if  board[i][ (j + 1)%3] == "O" && board[i][(j + 2)%3] == "O" && board[i][j] == " " {
                    board[i][j] = "O";
                    compR = i;
                    compC = j;
                    return true;
                } else if  board[(i + 1)%3][j] == "O" && board[(i + 2)%3][j] == "O" && board[i][j] == " " {
                    board[i][j] = "O";
                    compR = i;
                    compC = j;
                    return true;
                }
                else if  board[(i + 1)%3][(j+1)%3] == "O" && board[(i + 2)%3][(j+2)%3] == "O" && board[i][j] == " " {
                    board[i][j] = "O";
                    compR = i;
                    compC = j;
                    return true;
                }
            }
        }
        return false;
        }
    
    func  playerCanWin() -> Bool{
        for i in 0...2 {
            for j in 0...2{
                if  board[i][ (j + 1)%3] == "X" && board[i][(j + 2)%3] == "X" && board[i][j] == " " {
                    board[i][j] = "O";
                    compR = i;
                    compC = j;
                    return true;
                } else if  board[(i + 1)%3][j] == "X" && board[(i + 2)%3][j] == "X" && board[i][j] == " " {
                    board[i][j] = "O";
                    compR = i;
                    compC = j;
                    return true;
                }
                else if  board[(i + 1)%3][(j+1)%3] == "X" && board[(i + 2)%3][(j+2)%3] == "X" && board[i][j] == " " {
                    board[i][j] = "O";
                    compR = i;
                    compC = j;
                    return true;
                }
            }
        }
        return false;
    }
    
    func checkWinnerComp() -> Bool{
    return isWinnerComp;
    }
    
    func checkWinnerPlayer() -> Bool{
    return isWinnerPlayer;
    }
    
    
    
    
}





   
