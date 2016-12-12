//
//  ViewController.swift
//  tippy-tip
//
//  Created by Derrick Chong on 12/11/16.
//  Copyright © 2016 DerrickCorp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tip_label: UILabel!
    @IBOutlet weak var total_label: UILabel!
    @IBOutlet weak var bill_input: UITextField!
    @IBOutlet weak var tip_select: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tap_rec(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculate_tip(_ sender: AnyObject) {
        
        let tip_percentage = [0.15, 0.18, 0.2]
        let bill = Double(bill_input.text!) ?? 0
        let tip = bill * tip_percentage[tip_select.selectedSegmentIndex]
        let total = bill + tip
        
        tip_label.text = String (format: "$%0.2f", tip)
        total_label.text = String (format: "$%0.2f", total)
    }

}

