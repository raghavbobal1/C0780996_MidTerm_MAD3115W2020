//
//  Exceptions.swift
//  C0780996_MidTerm_MAD3115W2020
//
//  Created by Raghav Bobal on 2020-03-07.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation

enum ValidationErrors: Error
{
    case invalidEmail(email: String)
    case invalidNumber(number: String)
}


struct Validations
{

/*This function is for validating the email address
 provided by the customer*/
 
private static let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

static func email(email: String) -> Bool
    {
    
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegex)
    if !emailPred.evaluate(with: email)
        {
        //throw CustomerErrors.invalidEmail(email: email)
        return false
       }
    return true
    }
    
    static func mobileNumber(number: String) -> Bool
    {
      if number.count != 10
      {
          return false
        
      }
          return true
    }
      static func checkMobileNumber(number: String) throws
      {
         if number.count != 10
         {
             throw ValidationErrors.invalidNumber(number: number)
         }
       }
}
