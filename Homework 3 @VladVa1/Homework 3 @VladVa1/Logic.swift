//
//  Logic.swift
//  Homework 3 @VladVa1
//
//  Created by user on 30.11.2022.
//

import Foundation

protocol Emotions {
    func showWinner(name: String) -> String?
}

struct Gambler {
    var nickname: String
    var status = ""
    var hand: [Int] = []
}

class Game {
    var result = ""
    var cards = [
        2, 3, 4, 6, 7, 8, 9, 10, 11,
        2, 3, 4, 6, 7, 8, 9, 10, 11,
        2, 3, 4, 6, 7, 8, 9, 10, 11,
        2, 3, 4, 6, 7, 8, 9, 10, 11,
    ]
    
    func startTheGame(firstPlayer: Gambler, secondPlayer: Gambler) {
        var firstPlayer = firstPlayer
        var secondPlayer = secondPlayer
        
        cards.shuffle()
 
        for (index ,card) in cards[0...1].enumerated() {
            firstPlayer.hand.append(card)
            cards.remove(at: index)
        }

        for (index ,card) in cards[0...1].enumerated() {
            secondPlayer.hand.append(card)
            cards.remove(at: index)
        }

        if firstPlayer.hand.reduce(0, +) > secondPlayer.hand.reduce(0, +) {
            result = firstPlayer.showWinner(name: firstPlayer.nickname) ?? ""
            result += " he has \(firstPlayer.hand.reduce(0, +)) points"
        } else if firstPlayer.hand.reduce(0, +) < secondPlayer.hand.reduce(0, +) {
            result = secondPlayer.showWinner(name: secondPlayer.nickname) ?? ""
            result += " he has \(secondPlayer.hand.reduce(0, +)) points"
        } else {
            result = "You have same🥶"
        }
        cards += (firstPlayer.hand + secondPlayer.hand)
    }
}

extension Gambler: Emotions {
    func showWinner(name: String) -> String? {
        return "Winner is \(name)"
    }
}
