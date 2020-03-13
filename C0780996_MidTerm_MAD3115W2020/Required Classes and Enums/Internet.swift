

import Foundation
public class Internet: Bill
{
    var providerName: String
    var internetGbUsed: Double
    var type: BillType = BillType.Internet

    init(billId: String, billDate: Date, billType: BillType, providerName: String, internetGbUsed: Double)
    {
           self.providerName = providerName
           self.internetGbUsed = internetGbUsed
           super.init(billId: billId, billDate: billDate, billType: billType)
           self.totalBillAmount = billCalculation()
    }
    
   
       func billCalculation() -> Double
     {
        var price: Double = 0.0
          
        if (internetGbUsed < 3)
        {
            price = 12.15 * internetGbUsed
        }
        else if (internetGbUsed > 3 && internetGbUsed < 10)
        {
            price = 14 * internetGbUsed
        }
        else
        {
            price = 15.15 * internetGbUsed
        }
              return price
     }
}
