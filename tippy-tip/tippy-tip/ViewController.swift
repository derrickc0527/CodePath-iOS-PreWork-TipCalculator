//
//  ViewController.swift
//  tippy-tip
//
//  Created by Derrick Chong on 12/11/16.
//  Copyright © 2016 DerrickCorp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet weak var tip_label: UILabel!
    @IBOutlet weak var total_label: UILabel!
    @IBOutlet weak var bill_input: UITextField!
    @IBOutlet weak var tip_select: UISegmentedControl!
    
    @IBOutlet weak var total_box: UIView!
    @IBOutlet weak var bill_box: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (defaults.object(forKey: "defaultTip") == nil) {
            defaults.set(1, forKey: "defaultTip")
            defaults.synchronize()
        }
        tip_select.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")
        
        bill_input.becomeFirstResponder()
        
        total_box.alpha = 0
    }

    override func viewWillAppear(_ animated: Bool) {
        tip_select.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tap_rec(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculate_tip(_ sender: AnyObject) {
        
        if bill_input.text == "" {
            UIView.animate(withDuration: 0.4,
                                       animations: {
                                        self.total_box.alpha = 0
                                        self.bill_box.center.y = 243
                                        self.total_box.center.y = 360
            }
            )
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                self.total_box.alpha = 1
                self.bill_box.center.y = 150
                self.total_box.center.y = 300
            })
        }
        
        let tip_percentage = [0.15, 0.18, 0.2]
        let bill = Double(bill_input.text!) ?? 0
        let tip = bill * tip_percentage[tip_select.selectedSegmentIndex]
        let total = bill + tip
        
        
        tip_label.text = String (format: "$%0.2f", tip)
        total_label.text = String (format: "$%0.2f", total)
        
    }

}

