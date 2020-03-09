
//
//  SecondViewController.swift
//  C0769778_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-04.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class CustomerListTableViewController: UIViewController
{

    @IBOutlet weak var lblCustomerList: UILabel!
    @IBOutlet weak var tblViewCustomerList: UITableView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.addlogOutButton()
        self.addNewCustomerButton()
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tblViewCustomerList.reloadData()
    }
        
    private func addlogOutButton()
    {
        let logOutButton = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(self.logOut))
        self.navigationItem.leftBarButtonItem = logOutButton
    }
    
    @objc func logOut()
    {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = sb.instantiateViewController(identifier: "loginVC") as! LoginViewController
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    
    private func addNewCustomerButton()
    {
        let newCustomerButton = UIBarButtonItem(title: "New Customer", style: .plain, target: self, action: #selector(self.addCustomer))
        self.navigationItem.rightBarButtonItem = newCustomerButton
    }
    
    @objc func addCustomer()
    {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let addNewCustomerVC = sb.instantiateViewController(identifier: "AddNewCustomerVC") as! AddNewCustomerViewController
        navigationController?.pushViewController(addNewCustomerVC, animated: true)
    }
    

}
   extension CustomerListTableViewController: UITableViewDataSource, UITableViewDelegate
   {
       func numberOfSections(in tableView: UITableView) -> Int
       {
           return 1
       }
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
       {
        return DataRepository.getInstance().customerDictionary.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
       {
           let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerCell")
           let customerArray = DataRepository.getInstance().dictionaryToArray()
           let customer = customerArray[indexPath.row]
           cell?.textLabel?.text = customer.name
           return cell!
       }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        {
            let customers = DataRepository.getInstance().dictionaryToArray()
            let selectedCustomer = customers[indexPath.row]
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let detailedCustomerVC = sb.instantiateViewController(identifier: "showBillDetailsVC") as ShowBillDetailsViewController
            detailedCustomerVC.customers = selectedCustomer
            self.navigationController?.pushViewController(detailedCustomerVC, animated: true)
        }
    }

    
