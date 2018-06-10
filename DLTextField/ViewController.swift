//
//  ViewController.swift
//  DLTextField
//
//  Created by Daniel Lahoz on 8/3/17.
//  Copyright © 2017 Daniel Lahoz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var text1: DLTextField!
    @IBOutlet var text2: DLTextField!
    
    @IBOutlet var label1: DLLabel!
    @IBOutlet var label2: DLLabel!
    
    @IBOutlet var label3: DLLabel!
    @IBOutlet var label4: DLLabel!
    @IBOutlet var label5: DLLabel!
    @IBOutlet var label6: DLLabel!
    
    var val1  = DLDouble(11.0)
    var val2  = DLDouble(22.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        text1.textDoubleFormatt(newVal: &val1)
        text2.textDoubleFormatt(newVal: &val2)
        
        label1.textDoubleFormatt(newVal: val1.val)
        label2.textDoubleFormatt(newVal: val2.val)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textEditDidEnd(_ sender: DLTextField) {
        sender.textFieldDidEndEditing(sender)
        
        label1.textDoubleFormatt(newVal: val1.val)
        label2.textDoubleFormatt(newVal: val2.val)
        
        let total = val1.val + val2.val
        label3.textDoubleFormatt(newVal: total)
        label4.textDoubleFormatt(newVal: total)
        label5.textDoubleFormatt(newVal: total)
        label6.textDoubleFormatt(newVal: total)
    }

}

