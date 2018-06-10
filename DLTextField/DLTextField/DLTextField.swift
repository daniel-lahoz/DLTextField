//
//  DLBinderExtensions.swift
//  DLTextField
//
//  Created by Daniel Lahoz on 8/3/17.
//  Copyright © 2017 Daniel Lahoz. All rights reserved.
//

import UIKit


@IBDesignable
class DLTextField: UITextField, UITextFieldDelegate {
    var typeOfFormatt : DLDobleFormattType = .decimal
    
    let originalColor = UIColor.black
    
    // IB: use the adapter
    @IBInspectable var typeOfFormattAdapter:Int {
        get {
            return typeOfFormatt.rawValue
        }
        set(newValue) {
            self.typeOfFormatt = DLDobleFormattType(rawValue: newValue)!
        }
    }

    //The original value, use for reset
    var originalDouble : UnsafeMutablePointer<DLDouble>?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.keyboardType = .decimalPad
        self.returnKeyType = .done
        self.addDoneCancelToolbar()
        self.clearButtonMode = .whileEditing
        delegate = self
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.keyboardType = .decimalPad
        self.returnKeyType = .done
        self.addDoneCancelToolbar()
        self.clearButtonMode = .whileEditing
        delegate = self
    }

    ///Reset the TextField to original value
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        if originalDouble != nil {
            
            let newVal =  originalDouble!.pointee.originalVal
            originalDouble!.pointee.val = newVal
            
            switch typeOfFormatt {
            case .decimal:
                textField.text = newVal.formattedString!
            case .percent:
                textField.text = newVal.formattedPercentString!
            case .nondecimal:
                textField.text = newVal.formattedNonFractionString!
            case .money:
                textField.text = newVal.formattedMoneyString!
            default:
                break
            }
            
            self.resignFirstResponder()
        }
        
        return false
    }
    
    ///Clear content before start writting
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = " "
    }
    
    ///Apply formatt to new value and save new value to the pointer source
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let newVal = Decimal(formattedString: textField.text!, withFormatt: typeOfFormatt)
        
        if newVal != nil {
            
            switch typeOfFormatt {
            case .decimal:
                textField.text = newVal?.formattedString!
            case .percent:
                textField.text = newVal?.formattedPercentString!
            case .nondecimal:
                textField.text = newVal?.formattedNonFractionString!
            case .money:
                textField.text = newVal?.formattedMoneyString!
            default:
                break
            }

            if originalDouble != nil {
                originalDouble!.pointee.val = newVal!
            }
            
        }else{
            //If something go wrong put in red the TextField
            textField.textColor = .red
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                textField.textColor = self.originalColor
            }
            
        }
        

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    ///Bind data and apply formatt
    func textDoubleFormatt(newVal: inout DLDouble){
        
        var s : String = "DoubleFormattError"

        originalDouble = withUnsafeMutablePointer(to: &newVal) {UnsafeMutablePointer<DLDouble>($0)}
        
        switch typeOfFormatt {
        case .decimal:
            s = newVal.val.formattedString!
        case .percent:
            s = newVal.val.formattedPercentString!
        case .nondecimal:
           s = newVal.val.formattedNonFractionString!
        case .money:
            s = newVal.val.formattedMoneyString!
        default:
            break
        }
        
        self.text = s
    }
    

}
