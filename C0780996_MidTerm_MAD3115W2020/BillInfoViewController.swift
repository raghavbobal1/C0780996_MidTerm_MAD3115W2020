

import UIKit

class BillInfoViewController: UIViewController
{
    var customerBill: Customer?
    var bills = [Bill]()
    
    @IBOutlet weak var tblBillDetails: UITableView!
    @IBOutlet weak var lblBckGrnd: UILabel!
    @IBOutlet weak var lblTotalAmount: UILabel!
    
    override func viewDidLoad()
    {
        
        self.bills = customerBill!.getBills()
        self.lblTotalAmount.text = String(format:"$%.2f", (customerBill?.billTotal())!)
        lblTotalAmount.font = lblTotalAmount.font.withSize(30.0)
        lblTotalAmount.textColor = UIColor.white
        lblTotalAmount.textAlignment = .center
        self.addNewBillButton()
        lblBckGrnd.backgroundColor = UIColor .systemBlue
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
        
        if billList.billId.contains("mob")
        {
          cell.lblBillId?.text = billList.billId
          cell.lblBillDate?.text = billList.billDate.getFormattedDate()
          cell.imgIcon.image = UIImage(named:"mobileIcon")
          cell.lblBillAmount.text = String(format:"$%.2f", billList.billCalculation())
          cell.backgroundColor = UIColor(red:0.97, green:0.84, blue:1.00, alpha:1.0)
        }
           
        if billList.billId.contains("hy")
        {
         cell.lblBillId?.text = billList.billId
         cell.lblBillDate?.text = billList.billDate.getFormattedDate()
         cell.imgIcon.image = UIImage(named:"hydroIcon")
         cell.lblBillAmount.text = String(format:"$%.2f", billList.billCalculation())
         cell.backgroundColor = UIColor(red:0.95, green:1.00, blue:0.77, alpha:1.0)
         }
           
        if billList.billId.contains("in")
        {
         cell.lblBillId?.text = billList.billId
         cell.lblBillDate?.text = billList.billDate.getFormattedDate()
         cell.imgIcon.image = UIImage(named:"internetIcon")
         cell.lblBillAmount.text = String(format:"$%.2f", billList.billCalculation())
         cell.backgroundColor = UIColor(red:0.66, green:0.98, blue:1.00, alpha:1.0)
         }
          return cell
    }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
        {
            return CGFloat(100.0)
        }
 }

