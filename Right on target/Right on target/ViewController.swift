//
//  ViewController.swift
//  Right on target
//
//  Created by Egor Panin on 27.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var Game: game!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    

//    lazy var secondViewController: SecondViewController = getSecondViewController()
//    
//    private func getSecondViewController() -> SecondViewController {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        return storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
//    }
    
//POMARK - Обновление View
    private func updateLabelWithSecretNumber(newText: String){
        label.text = newText
    }
    private func showAlertWith(score: Int){
        let alert = UIAlertController(
            title: "Игра Окончена",
            message: "Вы заработали \(score) очков",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        self.present(alert,animated: true, completion: nil)
    }
    
//POMARK: Жизненный цикл
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Game = game(startValue: 1, endValue: 50, rounds: 5)
        updateLabelWithSecretNumber(newText: String(Game.currentSecretValue))
    }

    
    
    
    @IBAction func checkNumber() {
       
        Game.calculateScore(with: Int(slider.value))
        if Game.isGameEnded {
            showAlertWith(score: Game.score)
            Game.restartGame()
        } else {
            Game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(Game.currentSecretValue))
    }
    
    
    
    
    
    
    override func loadView () {
        super.loadView()
        print("loadView")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }


}

