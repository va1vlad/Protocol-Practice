//
//  ViewController.swift
//  Homework 3 @VladVa1
//
//  Created by user on 30.11.2022.
//

import UIKit

class ViewController: UIViewController {
    let casino = Game()
    var gambler = Gambler(nickname: "Salivan")
    var regular = Gambler(nickname: "Bill")

    @IBOutlet weak var startNewGameButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "Result here"
        startNewGameButton.setTitle("Start", for: .normal)
    }

    @IBAction func startButtonAction(_ sender: Any) {
        casino.startTheGame(firstPlayer: gambler, secondPlayer: regular)
        resultLabel.text = casino.result
    }
    
}

