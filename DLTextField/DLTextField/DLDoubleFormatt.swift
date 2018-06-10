//
//  DLDobleFormatt.swift
//  DLTextField
//
//  Created by Daniel Lahoz on 8/3/17.
//  Copyright © 2017 Daniel Lahoz. All rights reserved.
//

import Foundation

//This numbers are use on Interface Builder to assing DataType
enum DLDobleFormattType : Int {
    case decimal = 0
    case percent = 1
    case nondecimal = 2
    case money = 3
    case none = 4
}

extension Decimal{
    
    var doubleValue:Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
    
    var formattedString : String? {
        get{
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 2
            //formatter.locale = Locale(identifier: "es_ES")
            
            return formatter.string(from: self as NSDecimalNumber)
        }
        set(newValue){
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 2
            //formatter.locale = Locale(identifier: "es_ES")
            
            self = formatter.number(from: newValue!)!.decimalValue
        }
    }
    
    
    var formattedPercentString : String? {
        get{
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .percent
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 8
            //formatter.multiplier = 100
            //formatter.locale = Locale(identifier: "es_ES")
            
            return formatter.string(from: self as NSDecimalNumber)
        }
        set(newValue){
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .percent
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 8
            //formatter.multiplier = 100
            //formatter.locale = Locale(identifier: "es_ES")
            
            self = formatter.number(from: newValue!)!.decimalValue
        }
    }
    
    var formattedNonFractionString : String? {
        get{
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 0
            //formatter.locale = Locale(identifier: "es_ES")
            
            return formatter.string(from: self as NSDecimalNumber)
        }
        set(newValue){
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 0
            //formatter.locale = Locale(identifier: "es_ES")
            
            self = formatter.number(from: newValue!)!.decimalValue
        }
    }
    
    
    var formattedMoneyString : String? {
        get{
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            //formatter.multiplier = 100
            //formatter.locale = Locale(identifier: "es_ES")
            
            return formatter.string(from: self as NSDecimalNumber)
        }
        set(newValue){
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            //formatter.multiplier = 100
            //formatter.locale = Locale(identifier: "es_ES")
            
            self = formatter.number(from: newValue!)!.decimalValue
        }
    }
    

    
    init?(formattedString s: String, withFormatt f: DLDobleFormattType) {
        
        var ss = s
        ss = ss.replacingOccurrences(of: " ", with: "")
        ss = ss.replacingOccurrences(of: "%", with: "")
        ss = ss.replacingOccurrences(of: "€", with: "")
        ss = ss.replacingOccurrences(of: "$", with: "")
        
        switch f {
        case .decimal:
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 2
            //formatter.locale = Locale(identifier: "es_ES")
            
            let number = formatter.number(from: ss)
            if number != nil{
                //self.init(number!.decimalValue)
                self = number!.decimalValue
            }else{
                return nil
            }
        case .percent:
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 8
            formatter.negativeSuffix = " %"
            formatter.positiveSuffix = " %"
            formatter.multiplier = 100
            //formatter.locale = Locale(identifier: "es_ES")
            
            var ss = s
            ss = ss.replacingOccurrences(of: " ", with: "")
            ss = ss.replacingOccurrences(of: "%", with: "")
            ss.append(" %")
            
            let number = formatter.number(from: ss)
            if number != nil{
                //self.init(number!.decimalValue)
                self = number!.decimalValue
            }else{
                return nil
            }
        
        case .nondecimal:
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 0
            //formatter.locale = Locale(identifier: "es_ES")
            
            let number = formatter.number(from: ss)
            if number != nil{
                //self.init(number!.decimalValue)
                self = number!.decimalValue
            }else{
                return nil
            }
        case .money:
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            //formatter.multiplier = 100
            //formatter.locale = Locale(identifier: "es_ES")
            
            let number = formatter.number(from: ss)
            if number != nil{
                //self.init(number!.decimalValue)
                self = number!.decimalValue
            }else{
                return nil
            }
            
        default:
            return nil
        }
        
        
    }
    
    
    init?(formattedString s: String) {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        //formatter.locale = Locale(identifier: "es_ES")

        let number = formatter.number(from: s)
        
        if (number != nil){
            let val = number!.decimalValue
            
            //self.init(val)
            self = val
        }else{
           return nil
        }
        
    }
}
