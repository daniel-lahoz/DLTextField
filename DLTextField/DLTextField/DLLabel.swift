//
//  DLLabel.swift
//  DLTextField
//
//  Created by Daniel Lahoz on 8/3/17.
//  Copyright © 2017 Daniel Lahoz. All rights reserved.
//

import UIKit


@IBDesignable
class DLLabel: UILabel {
    var typeOfFormatt : DLDobleFormattType = .decimal
    
    // IB: use the adapter
    @IBInspectable var typeOfFormattAdapter:Int {
        get {
            return typeOfFormatt.rawValue
        }
        set(newValue) {
            self.typeOfFormatt = DLDobleFormattType(rawValue: newValue)!
        }
    }
    
    ///Save the Label value, will be display according the typeOfFormatt selected
    func textDoubleFormatt( newVal: Decimal){
        
        var s : String = "DoubleFormattError"
        
        switch typeOfFormatt {
        case .decimal:
            s = newVal.formattedString!
        case .percent:
            s = newVal.formattedPercentString!
        case .nondecimal:
            s = newVal.formattedNonFractionString!
        case .money:
            s = newVal.formattedMoneyString!
        default:
            break
        }
        
        
        if s == "NaN" {
            s = "ERROR" //Put here you custom string
        }
    
        self.text = s
    }
    
    
}

