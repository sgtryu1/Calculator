//
//  ViewController.swift
//  Calculator
//
//  Created by Rizky Amanatama on 20/08/19.
//  Copyright © 2019 Rizky Amanatama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var prevNumber:Double = 0;
    var performMath = false;
    var operation = 0;

    @IBOutlet weak var label: UILabel!
    @IBAction func numbers(_ sender: UIButton)
    {
        
        if performMath == true{
            label.text = String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
            performMath = false
        }
        else
        {
            label.text = label.text! + String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
        }
        
    }
    
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if label.text != "" && sender.tag != 11 && sender.tag != 16{
            
            prevNumber = Double(label.text!)!
            
            if sender.tag == 12 {//"/"
                label.text = "/";
            }
            else if sender.tag == 13{//"x"
                label.text = "x";
            }
            else if sender.tag == 14{//"-"
                label.text = "-";
            }
            else if sender.tag == 15{//"+"
                label.text = "+";
            }
            
            operation = sender.tag
            performMath = true
        }
        
        else if sender.tag == 16{
            if operation == 12{
                label.text = String(prevNumber / numberOnScreen)
            }
            else if operation == 13{
                label.text = String(prevNumber * numberOnScreen)
            }
            else if operation == 14{
                label.text = String(prevNumber - numberOnScreen)
            }
            else if operation == 15{
                label.text = String(prevNumber + numberOnScreen)
            }
        }
        
        else if sender.tag == 11{
            label.text = ""
            prevNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

