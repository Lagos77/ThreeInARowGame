//
//  ViewController.swift
//  ThreeInARowGame
//
//  Created by A J on 2021-11-24.
//

import UIKit

class ViewController: UIViewController {
    
    private var tappedCircle : Bool = true
    private var tappedCross : Bool = false
    private var currentPlayer = ""
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnThree: UIButton!
    @IBOutlet weak var btnFour: UIButton!
    @IBOutlet weak var btnFive: UIButton!
    @IBOutlet weak var btnSix: UIButton!
    @IBOutlet weak var btnSeven: UIButton!
    @IBOutlet weak var btnEight: UIButton!
    @IBOutlet weak var btnNine: UIButton!
    
    var crosses = "X"
    var circles = "O"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Initilaizing cross as first move
        //var firstTurn = tappedCross
        //var currentTurn = tappedCross
        

        
    }
    
    @IBAction func btnTapped(_ sender: UIButton) {
        gameManager(sender)
        
    }
    
    func gameManager(_ sender: UIButton){
        _ = tappedCross
        _ = tappedCross
        
        if currentPlayer == "X" {
            sender.setTitle("X", for: .normal)
            currentPlayer = "O"
        } else {
            sender.setTitle("O", for: .normal)
            currentPlayer = "X"
        }
        

    }
    

    
}

/*if(sender.title(for: .normal) == nil){
    if(currentTurn == tappedCircle){
        sender.setTitle(crosses, for: .normal)
        currentTurn = tappedCross
        infoLabel.text = crosses
    } else {
        if(currentTurn == tappedCross){
            sender.setTitle(circles, for: .normal)
            currentTurn = tappedCircle
            infoLabel.text = circles
        }
     }
}
*/
