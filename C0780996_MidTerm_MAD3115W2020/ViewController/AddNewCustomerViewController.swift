//
//  AddNewCustomerViewController.swift
//  C0780996_MidTerm_MAD3115W2020
//
//  Created by Raghav Bobal on 2020-03-07.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class AddNewCustomerViewController: UIViewController
{
    @IBOutlet weak var lblAddCust: UILabel!
    @IBOutlet weak var newCustomerIDtxt: UITextField!
    @IBOutlet weak var newCustomerNametxt: UITextField!
    @IBOutlet weak var newCustomerEmailtxt: UITextField!
    @IBOutlet weak var newCustomerPasswordtxt: UITextField!
    @IBOutlet weak var newCustomerMobileNumbertxt: UITextField!
    
    @IBAction func btnAddCustomer(_ sender: Any)
    {
        let id = newCustomerIDtxt.text!
        let name = newCustomerNametxt.text!
        let number = newCustomerMobileNumbertxt.text!
        let email  = newCustomerEmailtxt.text!
        let password = newCustomerPasswordtxt.text!
        let mobileNumber = newCustomerMobileNumbertxt.text!
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }
    
}
