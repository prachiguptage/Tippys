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
    
    @IBOutlet var tipView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peopleField.text = String("1")
        peopleField.isUserInteractionEnabled = false
        
        let defaults = UserDefaults.standard
        defaults.set("1",forKey:"person")
        defaults.set("0",forKey:"tip_control")
        defaults.synchronize()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = String(format: "%@", currencyFormatter(num: 0))
        totalLabel.text = String(format: "%@", currencyFormatter(num: 0))
        shareLabel.text = String(format: "%@", currencyFormatter(num: 0))
        billField.becomeFirstResponder()
        
        
        
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
        var share = Double(0)
        if(person>0){
        share = total/person
        }
        
        tipLabel.text = String(format: "%@", currencyFormatter(num: tip))
        totalLabel.text = String(format: "%@", currencyFormatter(num: total))
        shareLabel.text = String(format: "%@", currencyFormatter(num: share))
        
        
    }
    
    
    func currencyFormatter(num : Double)-> String{
        
        let number = NSDecimalNumber(decimal: Decimal(num))
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        
        let result = numberFormatter.string(from: number)
        return result!
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "tip_control")
        
        tipControl.selectedSegmentIndex = intValue
        
        peopleField.text = defaults.string(forKey: "person")
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
}

