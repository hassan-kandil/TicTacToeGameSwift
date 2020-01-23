//
//  Screen2ViewController.swift
//  TicTacToeGame
//
//  Created by auc on 1/22/20.
//  Copyright © 2020 AUC. All rights reserved.
//

import UIKit

class Screen2ViewController: UIViewController {
    
    var model: gameModel = gameModel()
    
    var str:String!

    @IBOutlet weak var playerNameLabel: UILabel!

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBAction func actionBtn(_ sender: AnyObject) {
        

        var row: Int = 0
        var col: Int = 0
        
        getRC(tag: sender.tag, r: &row, c: &col)
        
        
        let error = model.playMovePlayer(r:row, c:col)
        
        
        if(error != 1)
        {
            sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
            if(self.model.checkWinnerPlayer())
            {
                gameAlert(Title: "YOU WON!", Msg: "Play Again ?")
            }
            else{
                self.model.playMoveComputer()
                switch (self.model.compR,model.compC) {
                    case (0,0):
                        self.btn1.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                    case(0,1):
                        self.btn2.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                    case (0,2):
                        self.btn3.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                
                    case (1,0):
                        self.btn4.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                    case (1,1):
                        self.btn5.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                
                    case (1,2):
                        btn6.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                
                    case (2,0):
                        btn7.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                
                    case (2,1):
                        btn8.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                
                    case (2,2):
                        btn9.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                    default:
                        btn1.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                }
                
                if(model.checkWinnerComp())
                {
                    gameAlert(Title: "YOU LOST!", Msg: "Play Again ?")
                    
                }
                
                if(model.movesCount==0)
                {
                    gameAlert(Title: "DRAW!", Msg: "Play Again ?")
                }
            
            }

 

        }

    }
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerNameLabel.text = str
        
      

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    
    func resetGame(){
        
        btn1.setImage(nil, for: UIControlState())
        btn2.setImage(nil, for: UIControlState())
        btn3.setImage(nil, for: UIControlState())
        btn4.setImage(nil, for: UIControlState())
        btn5.setImage(nil, for: UIControlState())
        btn6.setImage(nil, for: UIControlState())
        btn7.setImage(nil, for: UIControlState())
        btn8.setImage(nil, for: UIControlState())
        btn9.setImage(nil, for: UIControlState())
        
        model.resetBoard();



    }
    
    func gameAlert(Title: String, Msg: String){
        // Create the alert controller
        let alertController = UIAlertController(title: Title, message: Msg, preferredStyle: .alert)
        
        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.resetGame()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
            self.navigationController?.popViewController(animated: true)
            
        }
        
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)

    }
    
    func getRC(tag: Int, r: inout Int , c: inout Int){
        
        switch tag {
        case 1:
            r=0
            c=0
        case 2:
            r=0
            c=1
        case 3:
            r=0
            c=2
        case 4:
            r=1
            c=0
        case 5:
            r=1
            c=1
        case 6:
            r=1
            c=2
        case 7:
            r=2
            c=0
        case 8:
            r=2
            c=1
        case 9:
            r=2
            c=2
        default:
            r=0
            c=0
        }
        
        
    }
    
    func getTag(r: Int, c: Int)-> Int{
        var tag = 0
        
        switch (r,c) {
        case (0,0):
            tag = 1
        case(0,1):
            tag = 2
        case (0,2):
            tag = 3
        
        case (1,0):
            tag = 4
        case (1,1):
            tag = 5
        
        case (1,2):
            tag=6
            
        case (2,0):
            tag=7
        
        case (2,1):
            tag=8
            
        case (2,2):
            tag=9
        default:
            tag=0
        }
        
        
        
        return tag
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
