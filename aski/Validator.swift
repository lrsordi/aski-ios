//
//  Utils.swift
//  aski
//
//  Created by LUIZ RICARDO SORDI on 2/22/16.
//  Copyright © 2016 LUIZ RICARDO SORDI. All rights reserved.
//

import UIKit

class Validator: NSObject {
    static func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluateWithObject(testStr)
        return result
    }
    
    static func isValidPhone(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        var phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        var result =  phoneTest.evaluateWithObject(value)
        return result
    }
}
