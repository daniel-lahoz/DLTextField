//
//  DLDouble.swift
//  DLTextField
//
//  Created by Daniel Lahoz on 8/3/17.
//  Copyright © 2017 Daniel Lahoz. All rights reserved.
//

import Foundation

//DLDouble has two Decimals values
//The original data and the actual data
//You can simply reset all DLDoubles to the original value
public struct DLDouble{
    
    private var originalValue : Decimal?
    private var actualValue : Decimal?
    
    var val : Decimal {
        set{
            if originalValue == nil {
                originalValue = newValue
                actualValue = newValue
            }else{
               actualValue = newValue
            }
        }
        get{
            return actualValue!
        }
    }
    
    var originalVal : Decimal {
        get{
            return originalValue!
        }
    }
    
    public init(_ v: Decimal){
        self.val = v
    }
    
    public mutating func reset() -> Decimal{
        actualValue = originalVal
        return actualValue!
    }
    
}

extension DLDouble: Equatable {
    public static func == (lhs: DLDouble, rhs: DLDouble) -> Bool {
        return lhs.val == rhs.val
    }

    public static func < (lhs: DLDouble, rhs: DLDouble) -> Bool {
        return lhs.val < rhs.val
    }
}
