//
//  ViewController.swift
//  ThreeInARowGame
//
//  Created by A J on 2021-11-24.
//

import UIKit

class ViewController: UIViewController {
    
    private var buttons = [UIButton]()
    private var currentPlayer = ""
    var board = [String]()
    var rules = [[0,1,2],[3,4,5],[6,7,8],
                 [0,3,6],[1,4,7],[2,5,8],
                 [0,4,8],[6,4,2]]
    
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
    var player1Score = 0
    var player2Score = 0
    
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
        
        if currentPlayer == "X" {
            sender.setTitle("X", for: .normal)
            currentPlayer = "O"
            infoLabel.text = "Player O turn"
        } else {
            sender.setTitle("O", for: .normal)
            currentPlayer = "X"
            infoLabel.text = "Player X turn"
        }
        

    }
    
    func boardGame(){
        for i in 0..<buttons.count{
            board.append("")
            
        }
    
    }
    
}
