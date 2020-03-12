
import Foundation
public class Bill
{
    private var billId: String
    private var billDate: Date
    var totalBillAmount: Double = 0.0
    private var billType: BillType
    
    init(billId: String, billDate: Date, billType: BillType)
    {
        self.billId = billId
        self.billDate = billDate
        self.billType = billType
        self.totalBillAmount = billCalculation()
    }
    
    func billCalculation() -> Double
    {
        return 0.0
    }
}
