//
//  IntroViewController.swift
//  ThreeInARowGame
//
//  Created by A J on 2021-12-08.
//

import UIKit

class IntroViewController: UIViewController {
    
    let segueToGameplayViewID = "segueToView2"
    
    @IBOutlet weak var enterPlayer1Name: UITextField!
    
    @IBOutlet weak var enterPlayer2Name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func play1v1(_ sender: UIButton) {

        if enterPlayer1Name.text == "" || enterPlayer2Name.text == "" {
            show1v1Alert()
            
        } else {
            performSegue(withIdentifier: segueToGameplayViewID, sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == segueToGameplayViewID) {
            let destinationVC = segue.destination as! ViewController
//            destinationVC.recieveNameOne = enterPlayer1Name.text
//            destinationVC.recieveNameTwo = enterPlayer2Name.text
            destinationVC.playerOne.name = enterPlayer1Name.text ?? "PlayerOne"
            destinationVC.playerTwo.name = enterPlayer2Name.text ?? "PlayerTwo"
            
        }
        
    }
    
    
    @IBAction func playVsAI(_ sender: UIButton) {
        showAIAlert()
        performSegue(withIdentifier: segueToGameplayViewID, sender: self)
        
    }
    
    func showAIAlert(){
        let alertPlay = UIAlertController(title: "Enter player name", message: nil, preferredStyle: .alert)
        let cancelPlay = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertPlay.addTextField { textField in
            textField.placeholder = "Place enter name"
        }
        
        let okPlay = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { action in
            if let name = alertPlay.textFields?.first?.text {
            }
        }
        
        alertPlay.addAction(cancelPlay)
        alertPlay.addAction(okPlay)
        
        self.present(alertPlay, animated: true, completion: nil)
    }
    
    func show1v1Alert(){
        let alertNameEmpty = UIAlertController(title: "Something is wrong...", message: "You need to enter name for both players.", preferredStyle: .alert)
        let okEmpty = UIAlertAction(title: "Got it!", style: UIAlertAction.Style.default) { _ in
            return
        }
        alertNameEmpty.addAction(okEmpty)
        self.present(alertNameEmpty, animated: true, completion: nil)
        
    }
    

}
