//
//  GameViewController.swift
//  GoRacing
//
//  Created by Наталья Карпова on 12.10.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    var gameTimer: Timer!
    var carPcTimer: Timer!
    var stateSemafor: Int = 1
    var gameTime: Timer!
    var timeLeft = 0

    @IBOutlet weak var pcCar: UIImageView!
    @IBOutlet weak var userCar: UIImageView!
    @IBOutlet weak var finishLine: UIImageView!
    @IBOutlet weak var semaforLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startGame: UIButton!
    @IBOutlet weak var driveCar: UIButton!
    @IBOutlet weak var endGame: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userCar.image = UIImage(named: userCarImage)

        startGame.layer.cornerRadius = 10.0
        driveCar.layer.cornerRadius = 10.0
        endGame.layer.cornerRadius = 10.0
        
    }
    
   
    @IBAction func startGameAction(_ sender: UIButton) {
        gameTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(intervalTimer), userInfo: nil, repeats: true)
        carPcTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(pcDrive), userInfo: nil, repeats: true)
        gameTime = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(game), userInfo: nil, repeats: true)
    }
    
    @objc func game() {
        timeLeft += 1
        timerLabel.text = String(timeLeft)
    }
    
    @IBAction func driveCarAction(_ sender:UIButton) {
        if stateSemafor == 2 {
            userCar.center.x += 30
        }
        if stateSemafor == 1 {
            userCar.center.x -= 10
        }
        if userCar.center.x > finishLine.center.x {
          
            gameEnd(message: "You winner")
            
        }
        
    }
    
    @IBAction func endGameAction(_ sender: UIButton) {
        
    }
    
    @objc func intervalTimer() {
        stateSemafor += 1
        
        if stateSemafor > 2 {
            stateSemafor = 1
        }
        
        switch stateSemafor {
        case 1:
            semaforLabel.text = "STOP"
            semaforLabel.textColor = .red
        case 2:
            semaforLabel.text = "DRIVE"
            semaforLabel.textColor = .green
        default:
            break
        }
    }
 
    @objc func pcDrive() {
        if stateSemafor == 2 {
            pcCar.center.x += 10
        }
        if pcCar.center.x > finishLine.center.x {
          
            gameEnd(message: "You lose")
        }
    }
    
    func gameEnd(message: String) {
        gameTimer.invalidate()
        carPcTimer.invalidate()
        gameTime.invalidate()
        let alert = UIAlertController(title: "Game End", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        results.append(resultData(playerName: "me", resultGame: message, timeGame: String(timeLeft)))
        
        
    }
    
    
}
