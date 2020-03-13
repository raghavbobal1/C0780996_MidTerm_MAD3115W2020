import Foundation
import UIKit

class Customer
{
    var customerId: String
    var name: String
    var email: String
    var userName: String
    var password: String
    var mobileNumber: String
    var dob: String
    lazy var customerBills = [String:Bill]()
    var totalBillAmount: Double = 0.0

    init(customerId: String, name: String, email: String, userName: String, password: String,mobileNumber: String,dob:String)
    {
        self.customerId = customerId
        self.name = name
        self.email = email
        self.userName = userName
        self.password = password
        self.mobileNumber = mobileNumber
        self.dob = dob
    }
    
    func newBill(bill: Bill, billId: String)
        {
          customerBills.updateValue(bill, forKey: billId)
        }
    
    func billTotal() -> Double
    {
      var allTotal = 0.0
      for i in customerBills
      {
        allTotal += i.value.totalBillAmount
        
      }
        return allTotal
    }
    
    func getBills() -> [Bill]
    {
        var bills = [Bill]()
        for i in customerBills
        {
            bills.append(i.value)
        }
        return bills
    }
}


