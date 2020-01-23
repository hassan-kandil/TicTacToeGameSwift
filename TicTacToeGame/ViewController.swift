//
//  ViewController.swift
//  TicTacToeGame
//
//  Created by auc on 1/22/20.
//  Copyright © 2020 AUC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textbox1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        
//        let image = UIImageView()
//        image.image = #imageLiteral(resourceName: "PersonIcon")
        
        
    }
    
    @IBAction func playAction(_ sender: Any) {
        
        if let text = textbox1.text, text.trimmingCharacters(in: .whitespaces).isEmpty {
            menuAlert(Title: "Player Name Missing!", Msg: "Please Enter Your Name To Contine!")
        } else {
            performSegue(withIdentifier: "screen1to2", sender: self)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "screen1to2")
        {
            
            let destination = segue.destination as! Screen2ViewController
            
            if let unwrapped = textbox1.text
            {
                destination.str = unwrapped
            }else{
                destination.str = "Player "
            }
            
        
        }
        
    }
    
    func menuAlert(Title: String, Msg: String){
        // Create the alert controller
        let alertController = UIAlertController(title: Title, message: Msg, preferredStyle: .alert)
        
        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            alertController.dismiss(animated: true, completion: nil)
        }

        
        // Add the actions
        alertController.addAction(okAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

