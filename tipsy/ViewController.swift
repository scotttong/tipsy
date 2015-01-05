//
//  ViewController.swift
//  tipsy
//
//  Created by Scott Tong on 1/4/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var billTextField: UITextField!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var calculationsView: UIView!
    @IBOutlet var tipControl: UISegmentedControl!
    @IBOutlet var splitTwoLabel: UILabel!
    @IBOutlet var splitThreeLabel: UILabel!
    @IBOutlet var splitFourLabel: UILabel!
    @IBOutlet var billAmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
//        set the landing state
        billTextField.center = CGPoint (x:160, y:250)
        calculationsView.alpha = 0
        billAmountLabel.center = CGPoint (x:160, y:180)
        //self.billTextField.becomeFirstResponder()
        }
    
    @IBAction func onTouchDownTextField(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: {
            self.billTextField.center = CGPoint (x:160, y:80)
            self.calculationsView.alpha = 1
            self.billAmountLabel.alpha = 0
        })
    }
    
    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
//        println("user is editing")
        
        var billAmount = NSString(string: billTextField.text).doubleValue
        var tipPercentages = [0.15, 0.18, 0.20]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var tip = billAmount * tipPercentage
        var totalAmount = billAmount + tip
        
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(totalAmount)"
        
//        formats the numbers to two decimal places
        tipLabel.text = String (format:"$%.2f",tip)
        totalLabel.text = String (format:"$%.2f",totalAmount)
        splitTwoLabel.text = String (format:"$%.2f",totalAmount/2)
        splitThreeLabel.text = String (format:"$%.2f",totalAmount/3)
        splitFourLabel.text = String (format:"$%.2f",totalAmount/4)

   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

