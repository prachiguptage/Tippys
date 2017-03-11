//
//  SettingsViewController.swift
//  Tippys
//
//  Created by Gupta, Siddharth(AWF) on 3/11/17.
//  Copyright © 2017 Gupta,Prachi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var personField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "tip_control")
        
        tipControl.selectedSegmentIndex = intValue
        personField.text = defaults.string(forKey: "person")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }*/
     @IBAction func setdefaultValue(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        
        defaults.set(tipControl.selectedSegmentIndex,forKey:"tip_control")
        
        defaults.synchronize()
     }
 
    
    @IBAction func setDefaultPerson(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        
        defaults.set(personField.text,forKey:"person")
        
        defaults.synchronize()
    }

    
}
