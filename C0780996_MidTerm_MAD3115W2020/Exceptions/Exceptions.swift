

import Foundation
import UIKit

enum CustomerErrors: Error
{
    case invalidEmail(email: String)
    case invalidNumber(number: String)
}

struct Validations {
private static let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

static func email(email: String) -> Bool
    {
    
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        if !emailPred.evaluate(with: email){
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
    static func checkMobileNumber(number: String) throws {
       if number.count != 10 {
           throw CustomerErrors.invalidNumber(number: number)
       }
     }
}

