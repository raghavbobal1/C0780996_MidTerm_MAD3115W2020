//
//  CustomerListTableViewController.swift
//  C0780996_MidTerm_MAD3115W2020
//
//  Created by Raghav Bobal on 2020-03-05.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class CustomerListTableViewController: UIViewController {

    @IBOutlet weak var lblListOfCust: UILabel!
    @IBOutlet weak var tblviewCustomerList: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.logOutBtn()
        self.btnToAddNewCustomer()
        self.navigationItem.hidesBackButton = true
       
    }
    
    private func logOutBtn()
    {
        let logOutButton = UIBarButtonItem(title:"Log Out",style:.plain,target:self,action:#selector(self.logOut))
        self.navigationItem.leftBarButtonItem = logOutButton
    }

    @objc func logOut()
       {
           let sb = UIStoryboard(name: "Main", bundle: nil)
           let loginVC = sb.instantiateViewController(identifier: "loginVC") as! LoginViewController
           navigationController?.pushViewController(loginVC, animated: true)
       }
    

    private func btnToAddNewCustomer()
       {
           let newCustomerButton = UIBarButtonItem(title:"New Customer",style:.plain,target:self,action:#selector(self.addNewCustomer))
           self.navigationItem.rightBarButtonItem = newCustomerButton
       }
    
    @objc func addNewCustomer()
       {
           let sb = UIStoryboard(name: "Main", bundle: nil)
           let addNewCustomerVC = sb.instantiateViewController(identifier: "AddNewCustomerVC") as! AddNewCustomerViewController
           navigationController?.pushViewController(addNewCustomerVC, animated: true)
       }
       
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
