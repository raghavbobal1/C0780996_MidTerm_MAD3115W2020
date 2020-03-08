//
//  Exceptions.swift
//  C0769778_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-06.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation
import UIKit

enum CustomerErrors: Error
{
    case invalidEmail(email: String)
    case invalidNumber(number: String)
}

struct Validations {
private static let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

static func email(email: String) -> Bool {
    
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegex)
    if !emailPred.evaluate(with: email){
        //throw CustomerErrors.invalidEmail(email: email)
        return false
    }
    return true
}
    
    static func mobileNumber(number: String) -> Bool {
    if number.count != 10 {
        return false
        //throw CustomerErrors.invalidNumber(number: number)
    }
        return true
  }
    static func checkMobileNumber(number: String) throws {
       if number.count != 10 {
           throw CustomerErrors.invalidNumber(number: number)
       }
     }
}

