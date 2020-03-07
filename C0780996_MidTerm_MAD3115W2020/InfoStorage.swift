//
//  InfoStorage.swift
//  C0780996_MidTerm_MAD3115W2020
//
//  Created by Raghav Bobal on 2020-03-07.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation
import UIKit

class InfoStorage
{
   
static private var repoObj = InfoStorage()
lazy var customerDictionary = Dictionary<String, Customer>()
    
private init(){}

 
static func getInstance() -> InfoStorage{
return repoObj
    }
    
    var c1 = (Customer(customerId:"001",name: "Raghav Bobal", emailId: "raghav@gmail.com", mobileNumber: "647-937-0707",password: "rgv123"))
    var c2 = (Customer(customerId:"002",name: "Kush Bhatia", emailId: "kush@gmail.com", mobileNumber: "999-039-0900",password: "kush123"))
    var c3 = (Customer(customerId:"003",name: "Uday Shetty", emailId: "udaybhai@gmail.com", mobileNumber: "123-456-7890",password: "uday123"))
    var c4 = (Customer(customerId:"004",name: "Majnu Bhai", emailId: "sagarpanday@gmail.com", mobileNumber: "123-456-8888",password: "majnu123"))
    
func addCust(customer: Customer)
  {
    let cid = customer.customerId
    customerDictionary.updateValue(customer, forKey: cid)
  }

func loadData(){
       addCust(customer: c1)
       addCust(customer: c2)
       addCust(customer: c3)
    }
    
func dictToArray() -> [Customer]{
    var customerListStorage: [Customer] = []
    for i in customerDictionary{
        customerListStorage.append(i.value)
     }
    return customerListStorage
    }
}



