//
//  ViewController.swift
//  ThreeInARowGame
//
//  Created by A J on 2021-11-24.
//

import UIKit

class ViewController: UIViewController {
    
    //Buttons added into a variable "buttons" which is an arraylist.
    private var buttons = [UIButton]()
    
    //Setting current player to empty space.
    private var currentPlayer = ""
    
    //Game board is a list of string.
    var board = [String]()
    
    //Variable rules show all winning possibilities.
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
    
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var roundCounterLabel: UILabel!
    
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    
    @IBOutlet weak var playerOneScore: UILabel!
    @IBOutlet weak var playerTwoScore: UILabel!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    //Setting both player scores to 0
    var player1Score = 0
    var player2Score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    //Adding all the buttons to the arraylist.
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
    
    }
    

    @IBAction func btnTapped(_ sender: UIButton) {
        
        //Getting the index of each button and sender is not empty.
        let index = buttons.firstIndex(of: sender)!
        
        if !board[index].isEmpty {
            return
        }
        
        if currentPlayer == "X" {
            sender.setTitle("X", for: .normal)
            currentPlayer = "O"
            board[index] = "X"
            infoLabel.text = "Player O turn"
        } else {
            sender.setTitle("O", for: .normal)
            currentPlayer = "X"
            board[index] = "O"
            infoLabel.text = "Player X turn"
        }
        checkWinner()
    }
    
    func checkWinner() {
        for rule in rules{
            let player0 = board[rule[0]]
            let player1 = board[rule[1]]
            let player2 = board[rule[2]]
            
            if player0 == player1 && player1 == player2 && !player0.isEmpty{
                winnerAlert()
            }
        }
        //If gameboard is not empty, function drawAlert() iniziates.
        if !board.contains(""){
            drawAlert()
        }
    }
    
    func boardGame(){
        for _ in 0..<buttons.count{
            board.append("")
        }
    }
    
    //Deletes every string added on board and restart function boardGame
    func resetGame(){
        board.removeAll()
        boardGame()
        
        //For each button in the arraylist buttons, changes button title back to "?"
        for button in buttons {
            button.setTitle("?", for: .normal)
        }
    }
    
    
    func winnerAlert(){
        let winAlert = UIAlertController(title: "Congratulations!", message: "You are a winner!", preferredStyle: .alert)
        let winAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.resetGame()
        }
        winAlert.addAction(winAction)
        present(winAlert, animated: true, completion: nil)
    }
    
    func drawAlert(){
        let drawAlert = UIAlertController(title: "Woops!", message: "Draw game!", preferredStyle: .alert)
        let drawAction = UIAlertAction(title: "Try again", style: .default) { _ in
            self.resetGame()
        }
        drawAlert.addAction(drawAction)
        present(drawAlert, animated: true, completion: nil)
    }
    
}
