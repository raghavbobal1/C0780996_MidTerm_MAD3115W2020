

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
    
    private func addNewBillButton()
    {
        let newCustomerButton = UIBarButtonItem(title: "Add Bill", style: .plain, target: self, action: #selector(self.addNewBill))
        self.navigationItem.rightBarButtonItem = newCustomerButton
    }
    
    @objc func addNewBill()
    {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let addNewBillVC = sb.instantiateViewController(identifier: "addNewBillVC") as! AddNewBillViewController
        addNewBillVC.selectedCustomer = self.customerBill
        navigationController?.pushViewController(addNewBillVC, animated: true)
    }
}
