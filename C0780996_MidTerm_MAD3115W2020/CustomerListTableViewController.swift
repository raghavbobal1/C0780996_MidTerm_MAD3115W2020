//
//  CustomerListTableViewController.swift
//  C0780996_MidTerm_MAD3115W2020
//
//  Created by Raghav Bobal on 2020-03-05.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class CustomerListTableViewController: UIViewController
{

    @IBOutlet weak var lblListOfCust: UILabel!
    @IBOutlet weak var tblviewCustomerList: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.logOutBtn()
        self.btnToAddNewCustomer()
        self.navigationItem.hidesBackButton = true
     }
    
    override func viewWillAppear(_ animated: Bool)
    {
           self.tblviewCustomerList.reloadData()
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
}


extension CustomerListTableViewController : UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int
        {
            return 1
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return InfoStorage.getInstance().customerDictionary.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerCell")
            let customerArray = InfoStorage.getInstance().dictToArray()
            let customer = customerArray[indexPath.row]
            cell?.textLabel?.text = customer.name
            return cell!
        }
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
     {
         let customer = InfoStorage.getInstance().dictToArray()
         let selectedCustomer = customer[indexPath.row]
         
         let sb = UIStoryboard(name: "Main", bundle: nil)
         let showBillDetailsVC = sb.instantiateViewController(identifier: "showBillDetailsVC") as ShowBillDetailsViewController
            showBillDetailsVC.customer = selectedCustomer
         self.navigationController?.pushViewController(showBillDetailsVC, animated: true)
      }
 }
