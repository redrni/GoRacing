//
//  ViewController.swift
//  GoRacing
//
//  Created by Наталья Карпова on 11.10.2022.
//

import UIKit

//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate{
//
//}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var startNewGame: UIButton!
    @IBOutlet weak var result: UIButton!
    @IBOutlet weak var settings: UIButton!
    @IBOutlet weak var exit: UIButton!

    var playerName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewGame.layer.cornerRadius = 10.0
        result.layer.cornerRadius = 10.0
        settings.layer.cornerRadius = 10.0
        exit.layer.cornerRadius = 10.0
        
    }


    @IBAction func closeAppAction(_ sender: Any) {
        Darwin.exit(0)
    }
    
    
    @IBAction func settingsAction(_ sender: Any) {
        let alert = UIAlertController(title: "Settings name", message: "Enter player nickname. \n Nickname is now: \(String(describing: playerName))", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Player name"
        }
        
        let cancelAction = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        let addAction = UIAlertAction(title: "Confirm", style: .default) { (action) in
            let name = alert.textFields![0].text
            self.playerName = name
        }
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
}


