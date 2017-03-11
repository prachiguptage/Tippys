//
//  ViewController.swift
//  Tippys
//
//  Created by Gupta, Siddharth(AWF) on 3/11/17.
//  Copyright © 2017 Gupta,Prachi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var shareLabel: UILabel!
    @IBOutlet weak var peopleField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peopleField.text = String("1")
        peopleField.isUserInteractionEnabled = false
        
        let defaults = UserDefaults.standard
        defaults.set("1",forKey:"person")
        defaults.set("0",forKey:"tip_control")
        defaults.synchronize()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onTap(_ sender: Any) {
        
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        peopleField.isUserInteractionEnabled = true
        
        let tipPercentage = [0.18,0.2,0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]

        let total = bill + tip
        let person = Double(peopleField.text!) ?? 0
        let share = total/person
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        shareLabel.text = String(format: "$%.2f", share)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "tip_control")
        
        tipControl.selectedSegmentIndex = intValue
        peopleField.text = defaults.string(forKey: "person")
    }
    
}

