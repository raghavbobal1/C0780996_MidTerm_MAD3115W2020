

import UIKit

class BillInfoViewController: UIViewController
{
    var customerBill: Customer?
    var bills = [Bill]()
    
    @IBOutlet weak var lblBckGrnd: UILabel!
    @IBOutlet weak var lblTotalAmount: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.bills = customerBill!.getBills()
        self.title = "CUSTOMER BILLS"
        self.lblTotalAmount.text = String(format:"$%.2f", (customerBill?.billTotal())!)
        lblTotalAmount.font = lblTotalAmount.font.withSize(40.0)
        lblTotalAmount.textColor = UIColor.white
        lblTotalAmount.textAlignment = .center
        lblBckGrnd.backgroundColor = UIColor.systemBlue
    }

}
