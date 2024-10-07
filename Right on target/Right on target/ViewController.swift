//
//  ViewController.swift
//  Right on target
//
//  Created by Egor Panin on 27.09.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var number = 0
    var round = 1
    var points = 0
    
    lazy var secondViewController: SecondViewController = getSecondViewController()
    
    private func getSecondViewController() -> SecondViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
    }
    
    
    
    @IBAction func showNextScreen() {
        present(secondViewController, animated: true , completion: nil)
    }
    
    @IBAction func checkNumber() {
       
            let numSlider = Int(slider.value.rounded())
            if numSlider > number {
                points += 50 - numSlider + number
            } else if numSlider < number {
                points += 50 - number + numSlider
            } else {
                points += 50
            }
            if round == 5 {
                let alert = UIAlertController(title: "Результат", message: "Твои очки: \(points)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Отлично!", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                round = 1
                points = 0
            } else {
                round += 1
            }
            number = Int.random(in: 1...50)
            label.text = String(number)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print (viewDidLoad)
        number = Int.random(in: 1...50)
        label.text = String(number)
        
    }
    
    override func loadView () {
        super.loadView()
        print("loadView")
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        versionLabel.text = "Version: 1.1"
        view.addSubview(versionLabel)
        
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

