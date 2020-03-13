

import Foundation
public class Mobile: Bill
{
    private var mobileManufacturerName: String
    private var planName: String
    private var mobileNumber: String
    private var mobileDataUsed: Double
    private var callMinutesUsed: Int
    var type: BillType = BillType.Mobile

    
     init(billId: String, billDate: Date, billType: BillType,mobileManufacturerName: String, planName: String, mobileNumber: String, mobileDataUsed: Double, callMinutesUsed: Int)
    {
           self.mobileManufacturerName = mobileManufacturerName
           self.planName = planName
           self.mobileNumber = mobileNumber
           self.mobileDataUsed = mobileDataUsed
           self.callMinutesUsed = callMinutesUsed
           super.init(billId: billId, billDate: billDate, billType: billType)
           self.totalBillAmount = billCalculation()
           
    }

    override public func billCalculation() -> Double
    {
        var monthlyBill: Double = 0.0
        var minutePrice: Int = 0
        var dataPrice: Double = 0.0
        
         if (callMinutesUsed < 300)
           {
                minutePrice += 35
           }
         else if (callMinutesUsed > 300 && callMinutesUsed < 500)
           {
                minutePrice += 50
           }
         else
           {
            minutePrice = Int(0.15 * Double(callMinutesUsed))
           }
        
         if (mobileDataUsed < 5)
           {
                dataPrice += 50
           }
         else if (mobileDataUsed > 5 && mobileDataUsed < 10)
           {
                dataPrice += 85
           }
         else
           {
                dataPrice = 9.75 * mobileDataUsed
           }
        
        monthlyBill = Double(minutePrice) + dataPrice
        return monthlyBill
        
    }
}
