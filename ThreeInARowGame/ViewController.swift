//
//  ViewController.swift
//  ThreeInARowGame
//
//  Created by A J on 2021-11-24.
//

import UIKit

class ViewController: UIViewController {
    
    private var buttons = [UIButton]()
    private var currentPlayer = 0
    var board = [String]()
    
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnThree: UIButton!
    @IBOutlet weak var btnFour: UIButton!
    @IBOutlet weak var btnFive: UIButton!
    @IBOutlet weak var btnSix: UIButton!
    @IBOutlet weak var btnSeven: UIButton!
    @IBOutlet weak var btnEight: UIButton!
    @IBOutlet weak var btnNine: UIButton!
    
    @IBOutlet weak var infoLabel: UILabel!
    var playerCross = 0
    var playerCircle = 0

    
    var playerX = [Int]()
    var playerO = [Int]()
    
    //Set scores to 0 for both player
    
    
    //Array list of UIButton    var playerX = [UIButton]()
    
    //var crosses = "X"
    //var circles = "O"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        buttons.append(btnOne)
        buttons.append(btnTwo)
        buttons.append(btnThree)
        buttons.append(btnFour)
        buttons.append(btnFive)
        buttons.append(btnSix)
        buttons.append(btnSeven)
        buttons.append(btnEight)
        buttons.append(btnNine)
        
        boardGame()
    
        //Initilaizing cross as first move
        //var firstTurn = tappedCross
        //var currentTurn = tappedCross
        //playerNameAlert()
        
        
    }
    
    @IBAction func btnTapped(_ sender: UIButton) {
        let index = buttons.firstIndex(of: sender)!
        print(index)
        gameManager(sender)
    
        
    }
    
    func gameManager(_ sender: UIButton){
        
        if currentPlayer == 0 {
            sender.setTitle("X", for: .normal)
            currentPlayer = 1
            infoLabel.text = "Player O turn"
        } else {
            sender.setTitle("O", for: .normal)
            currentPlayer = 0
            infoLabel.text = "Player X turn"
        }
        //Set button to be clicked only once
        sender.isEnabled = false
        

    }
    //Recives a string and returns a bool
    //Check win possibilities if symbol on button title matches with each other
    func checkWin(_ string: String) -> Bool {
        
        //Horizontical possibilites
        if thisSymbol(btnOne, string) && thisSymbol(btnTwo, string) && thisSymbol(btnThree, string){
            return true
        }
        if thisSymbol(btnFour, string) && thisSymbol(btnFive, string) && thisSymbol(btnSix, string){
            return true
        }
        if thisSymbol(btnSeven, string) && thisSymbol(btnEight, string) && thisSymbol(btnNine, string){
            return true
        }
        
        //Diagonal possibilities
        if thisSymbol(btnOne, string) && thisSymbol(btnFive, string) && thisSymbol(btnNine, string){
            return true
        }
        if thisSymbol(btnSeven, string) && thisSymbol(btnFive, string) && thisSymbol(btnThree, string){
            return true
        }
        
        return false
    }
    
    //Recives a UIButton and a string and return a bool
    //If the button title has a X or O, if so return true
    func thisSymbol(_ button : UIButton,_ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }
    
    func boardGame(){
        for i in 0..<buttons.count{
            board.append("")
            
        }
    
    }
    
    
    //Function doesnt work properly. Suppose to show at up-start
    /*func playerNameAlert(){
        
        
        let alert = UIAlertController(title: "Enter player one name", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in }))
        
        
        
    }
    */
}
