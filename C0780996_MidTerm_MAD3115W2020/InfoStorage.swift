//
//  InfoStorage.swift
//  C0780996_MidTerm_MAD3115W2020
//
//  Created by Raghav Bobal on 2020-03-08.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation
import UIKit

class InfoStorage
{
   
static private var repoObj = InfoStorage()
lazy var customerDictionary = Dictionary<String, Customer>()
    
private init(){}

 
static func getInstance() -> InfoStorage
    {
       return repoObj
    }
func addCust(customer: Customer)
  {
    let cid = customer.customerId
    customerDictionary.updateValue(customer, forKey: cid)
  }

func loadData()
    {
        let formatter = DateFormatter()
           formatter.dateFormat = "dd/MMM/yyyy"
        let c1 = (Customer(customerId:"001",name: "Raghav Bobal", emailId: "raghav@gmail.com", mobileNumber: "6479370707",password: "rgv123"))
        let c2 = (Customer(customerId:"002",name: "Kush Bhatia", emailId: "kush@gmail.com", mobileNumber: "9990390900",password: "kush123"))
        let c3 = (Customer(customerId:"003",name: "Uday Shetty", emailId: "udaybhai@gmail.com", mobileNumber: "1234567890",password: "uday123"))
        let c4 = (Customer(customerId:"004",name: "Majnu Bhai", emailId: "sagarpanday@gmail.com", mobileNumber: "1234568888",password: "majnu123"))
        
        addCust(customer: c1)
        addCust(customer: c2)
        addCust(customer: c3)
        addCust(customer: c4)
    }
    
func dictToArray() -> [Customer]
    {
    var customerListStorage: [Customer] = []
    for i in customerDictionary
    {
        customerListStorage.append(i.value)
    }
    return customerListStorage
    }
}




