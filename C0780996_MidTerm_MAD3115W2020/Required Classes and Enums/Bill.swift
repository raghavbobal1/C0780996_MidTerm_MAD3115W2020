import Foundation
public class Bill
    
{
  var billId: String
  var billDate: Date
  var billType: BillType
  var totalBillAmount: Double = 0.0

init(billId: String, billDate: Date, billType: BillType)
    {
    self.billId = billId
    self.billType = billType
    self.billDate = billDate
    }
    
public func billCalculation() -> Double
 {
    var x: Double = 0.0
    return x
 }
    
}

