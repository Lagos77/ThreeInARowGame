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
    private var currentPlayer = 2 // Player X
    
    //Game board is a list of string.
    var board = [String]()
    
    //Variable rules show all winning possibilities.
    var rules = [[0,1,2],[3,4,5],[6,7,8],
                 [0,3,6],[1,4,7],[2,5,8],
                 [0,4,8],[6,4,2]]
    
    @IBOutlet var collectionOfButtons: Array<UIButton>?
    
    @IBOutlet weak var playAI: UIButton!
    @IBOutlet weak var addNames: UIButton!
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var roundCounterLabel: UILabel!
    
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    
    @IBOutlet weak var playerOneScore: UILabel!
    @IBOutlet weak var playerTwoScore: UILabel!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    var recieveNameOne : String? = ""
    var recieveNameTwo : String? = ""
    
    //Setting both player scores to 0
    var player1Score = 0
    var player2Score = 0
    
    var roundCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    //Adding all the buttons to the arraylist.
        
        if let collectionOfButtons = collectionOfButtons {
            for button in collectionOfButtons {
                buttons.append(button)
            }
        }
        
        playerOneLabel.text = recieveNameOne
        playerTwoLabel.text = recieveNameTwo
        
        boardGame()

    
    }
    

    @IBAction func btnTapped(_ sender: UIButton) {
        
        //Getting the index of each button and sender is not empty.
        let index = buttons.firstIndex(of: sender)!
        
        if !board[index].isEmpty {
            return
        }
        
        if currentPlayer == 1 {
            sender.setTitle("O", for: .normal)
            currentPlayer = 2
            board[index] = "O"
            infoLabel.text = "\(playerOneLabel.text ?? "") turn !"
        } else {
            sender.setTitle("X", for: .normal)
            currentPlayer = 1
            board[index] = "X"
            infoLabel.text = "\(playerTwoLabel.text ?? "") turn !"
        }
        checkWinner()
    }
    

    
    
    //Checks player corrisponding position on the board, following by the three rules.
    func checkWinner() {
        var winCheck = 0
        for rule in rules{
            //Applies rules horizontical, vertical and diagonal.
            let playeratPos0 = board[rule[0]]
            let playeratPos1 = board[rule[1]]
            let playeratPos2 = board[rule[2]]
            
            //If the rules are equal to each other and board is not empty
            if playeratPos0 == playeratPos1 && playeratPos1 == playeratPos2 && currentPlayer == 1 && !playeratPos0.isEmpty{
                winCheck = 1
            }
            if playeratPos0 == playeratPos1 && playeratPos1 == playeratPos2 && currentPlayer == 2 && !playeratPos0.isEmpty{
                winCheck = 2

            }
            if winCheck == 1 {
                player1Score += 1
                playerOneScore.text = "\(player1Score)"
                winnerAlert()
                return
            } else if winCheck == 2{
                player2Score += 1
                playerTwoScore.text = "\(player2Score)"
                winnerAlert()
                return
            }

        }
        //If gameboard is not empty and there is no winner, function drawAlert() iniziates.
        if !board.contains(""){
            drawAlert()
        }
    }
    
    //Size of the board is the size of the buttons
    //Initilize with empty string
    func boardGame(){
        for _ in 0..<buttons.count{
            board.append("")
        }
    }
    
    //Deletes every string added on board and restart function boardGame
    func resetGame(){
        roundCounter += 1
        roundCounterLabel.text = "\(roundCounter)"
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
