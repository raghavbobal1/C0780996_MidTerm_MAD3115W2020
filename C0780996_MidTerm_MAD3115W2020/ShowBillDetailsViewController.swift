//
//  ShowBillDetailsViewController.swift
//  C0769778_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-06.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class ShowBillDetailsViewController: UIViewController
{
    
        var customers: Customer?
        @IBOutlet weak var lblCustomerId: UILabel!
        @IBOutlet weak var lblCustomerUsername: UILabel!
        @IBOutlet weak var lblCustomerEmail: UILabel!
        @IBOutlet weak var lblCustomerDOB: UILabel!
        @IBOutlet weak var lblCustomerName: UILabel!
        @IBOutlet weak var lblMobileNo: UILabel!
        
          override func viewDidLoad()
              {
                  super.viewDidLoad()
                  self.lblCustomerId.text = customers?.customerId
                  self.lblCustomerName.text = customers?.name
                  self.lblCustomerEmail.text = customers?.email
                  self.lblCustomerUsername.text = customers?.userName
                  self.lblMobileNo.text = customers?.mobileNumber
                  self.lblCustomerDOB.text = customers?.dob
              }
          
          
    
    @IBAction func btnViewBills(_ sender: Any)
    {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let BillInfoVC = sb.instantiateViewController(identifier: "billinfoVC") as! BillInfoViewController
        navigationController?.pushViewController(BillInfoVC, animated: true)
    }
    
    
  
    
    
}
        

    
