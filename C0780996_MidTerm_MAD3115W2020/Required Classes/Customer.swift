//
//  Customer.swift
//  C0780996_MidTerm_MAD3115W2020
//
//  Created by Raghav Bobal on 2020-03-05.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation

public class Customer: IDisplayDelegate
{
    var customerId: Int
    private var firstName: String
    private var lastName: String
    private var fullName: String
    {return "\(firstName) \(lastName)"}
    private var emailId: String
    private var mobileNumber:String
   

     /*This function is for validating the email address
      provided by the customer*/
      
     public func isValid(emailAddressString: String) -> Bool
          {
              var returnValue = true
              let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
         do
          {
              let regex = try NSRegularExpression(pattern: emailRegEx)
              let nsString = emailAddressString as NSString
              let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
              
              if results.count == 0
              {
                  returnValue = false
              }
          }
          catch let error as NSError
              {
                print("invalid regex: \(error.localizedDescription)")
                returnValue = false
              }
          
          return  returnValue
          }

          init(customerId: Int, firstName: String, lastName: String, emailId: String, mobileNumber:String)
          {
              self.customerId = customerId
              self.firstName = firstName
              self.lastName = lastName
              self.mobileNumber = mobileNumber
              self.emailId = emailId
                if isValid(emailAddressString: self.emailId)
                  {
                    self.emailId = emailId
                  }
                  else
                  {
                    print("Please enter a valid email address")
                    exit(0)
                  }
                    
            }
    
    func display()
      {
          print("---------------- Customer Information ----------------")
          print("Customer ID: \(self.customerId)")
          print("Name: \(self.fullName)")
          print("Email ID: \(self.emailId)")
          print("Mobile Number: \(self.mobileNumber)")
      }
          
}