//
//  game.swift
//  Right on target
//
//  Created by Egor Panin on 12.10.2024.
//
import UIKit

protocol GameProtocol{
    var score: Int { get }
    var currentSecretValue: Int { get }
    var isGameEnded: Bool { get }
    
    func startNewRound()
    func calculateScore(with value: Int)
    
}

class game: GameProtocol{
  
    //Очки
    var score = 0
    private var minSecretValue: Int = 0
    private var maxSecretValue: Int = 0
    var currentSecretValue: Int = 0
    //Раунды
    private var lastRound: Int = 0
    private var currentRound: Int = 1
    var isGameEnded: Bool {
        if currentRound >= lastRound {
            return true
        } else {
            return false
        }
    }
    
    init?(startValue: Int, endValue: Int, rounds: Int){
        guard startValue <= endValue else{
            return nil
        }
        minSecretValue = startValue
        maxSecretValue = endValue
        lastRound = rounds
        currentSecretValue = self.getNewSecretValue()
    }
    
    func restartGame(){
        score = 0
        currentRound = 1
        startNewRound()
    }
    func startNewRound(){
        currentSecretValue = self.getNewSecretValue()
        currentRound += 1
    }
    
    private func getNewSecretValue() -> Int{
        (minSecretValue...maxSecretValue).randomElement()!
    }
    func calculateScore(with value: Int){
        if value == currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
    }
    
}


