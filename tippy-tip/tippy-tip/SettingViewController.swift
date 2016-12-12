//
//  SettingViewController.swift
//  tippy-tip
//
//  Created by Derrick Chong on 12/11/16.
//  Copyright © 2016 DerrickCorp. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet weak var default_tip: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        default_tip.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func default_tip(_ sender: Any) {
        defaults.set(default_tip.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
