//
//  ViewController.swift
//  Calculator
//
//  Created by Carrie Taylor on 1/11/17.
//  Copyright © 2017 Carrie Taylor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numDisplay:Double = 0
    var prevNum:Double = 0
    var preformingMath = false
    var operation = 0
    
    @IBOutlet weak var output: UILabel!

    
    
    @IBAction func num(sender: UIButton) {
        if preformingMath == true
        {
            output.text = String(sender.tag-1)
            numDisplay = Double(output.text!)!
            preformingMath = false
        }
        else{
            output.text = output.text! + String(sender.tag-1)
            numDisplay = Double(output.text!)!
        }
    }
    
    @IBAction func functions(sender: UIButton) {
        
        if output.text != "" && sender.tag != 11 && sender.tag != 16{
            prevNum = Double(output.text!)!
            if sender.tag == 12 //Divide
            {
                output.text = "/";
            }
            else if sender.tag == 13 //Multiply
            {
                output.text = "*";
            }
            else if sender.tag == 14 //Subtract
            {
                output.text = "-";
            }
            else if sender.tag == 15 //Add
            {
                output.text = "+";
            }
            operation = sender.tag
            preformingMath = true
        }
        else if sender.tag == 16{
            if operation == 12{
                output.text = String(prevNum / numDisplay)
            }
            else if operation == 13{
                output.text = String(prevNum * numDisplay)
            }
            else if operation == 14{
                output.text = String(prevNum - numDisplay)
            }
            else if operation == 15{
                output.text = String(prevNum + numDisplay)
            }
        }
        else if sender.tag == 11
        {
            output.text = " "
            prevNum = 0;
            numDisplay = 0;
            operation = 0;
            
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

