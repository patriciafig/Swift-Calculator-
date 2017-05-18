//
//  ViewController.swift
//  Calculator
//
//  Created by Patricia on 5/17/17.
//  Copyright © 2017 Patricia Figueroa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // define variable number 
    var numberOnScreen : Double = 0;
    var PreviousNum: Double = 0;
    var EqualsNum = 0;
    var doesMath = false
    
    
    @IBOutlet weak var Label: UILabel!     //Label display, displays the numbers the user presses on

    @IBAction func Numbers(_ sender: UIButton)   //function for number buttons
    {
        /* 
         //To display numbers on the display label, takes the text that already in the label and then adding the number that the user presses on.
          //Using tag - 1 because each number was given a tag that was one number higher than the actual value
         // Converts it to a string to be able to display it in the text field
         
         */
        
        if doesMath == true
        {
            Label.text = String(sender.tag-1)
            numberOnScreen = Double(Label.text!)!
            doesMath = false    // don't want to call it every time
        }
            
        else
        {
            Label.text = Label.text! + String(sender.tag-1)
            // want to save it as a real number that can actually calculate
            numberOnScreen = Double (Label.text!)!
        }
    }
    
    
    //Function for other buttons 
    
    @IBAction func Buttons(_ sender: UIButton)
    
    {
      
        
        if Label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            
            PreviousNum = Double (Label.text!)!
            
            
            
            if sender.tag == 12     //divide
            {
                Label.text = "/";
            }
            else if sender.tag == 13  // multiply
            {
                Label.text = "x";
            }
        
            else if sender.tag == 14 // subtract
            {
                Label.text = "-";
            }
                
            else if sender.tag == 15  // addition
            {
                Label.text = "+";
            }
            
            // varible for =
            
            EqualsNum = sender.tag
            doesMath = true;
            
        }
        
        else if sender.tag == 16
        {
            if EqualsNum == 12
            {
                Label.text = String(PreviousNum / numberOnScreen)
            }
            else if EqualsNum == 13
            {
                Label.text = String(PreviousNum * numberOnScreen)
            }
            else if EqualsNum == 14
            {
                Label.text = String(PreviousNum - numberOnScreen)
            }
            else if EqualsNum == 15
            {
                Label.text = String(PreviousNum + numberOnScreen)
            }
        }
        
        else if sender .tag == 11
        {
        Label.text = " "
            PreviousNum = 0;
            numberOnScreen = 0;
            EqualsNum = 0;
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

