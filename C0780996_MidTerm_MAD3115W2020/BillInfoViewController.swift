

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
    

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.tblBillDetails.reloadData()
    }
}

extension BillInfoViewController: UITableViewDataSource,
    UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
     return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.bills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BillTableViewCell") as! BillTableViewCell
        let billList = bills[indexPath.row]
        
        if billList.billId.contains("MB")
        {
          cell.lblbillId?.text = billList.billId
          cell.lblbillDate?.text = billList.billDate.getFormattedDate()
          cell.imgBillicon.image = UIImage(named:"mobileicon")
          cell.billAmount.text = String(format:"$%.2f", billList.billCalculate())
          cell.backgroundColor = UIColor(displayP3Red: 0.98, green: 0.91, blue: 0.71, alpha: 1.0)
        }
           
        if billList.billId.contains("HY")
        {
         cell.lblbillId?.text = billList.billId
         cell.lblbillDate?.text = billList.billDate.getFormattedDate()
         cell.imgBillicon.image = UIImage(named:"hydroicon")
         cell.billAmount.text = String(format:"$%.2f", billList.billCalculate())
         cell.backgroundColor = UIColor(displayP3Red: 0.91, green: 1.0, blue: 1.0, alpha: 1.0)
         }
           
        if billList.billId.contains("IN")
        {
         cell.lblbillId?.text = billList.billId
         cell.lblbillDate?.text = billList.billDate.getFormattedDate()
         cell.imgBillicon.image = UIImage(named:"interneticon")
         cell.billAmount.text = String(format:"$%.2f", billList.billCalculate())
         cell.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.98, alpha: 1.0)
         }
          return cell
    }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
        {
            return CGFloat(150.0)
        }
 }

