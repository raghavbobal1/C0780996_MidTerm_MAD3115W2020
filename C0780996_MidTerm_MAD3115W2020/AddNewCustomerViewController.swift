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
    @IBOutlet weak var newCustomerPswrdtxt: UITextField!
    @IBOutlet weak var newCustomerMobileNumbertxt: UITextField!

    
    @IBAction func btnAddCustomer(_ sender: Any)
    {
        if(newCustomerIDtxt.text == "" || newCustomerNametxt.text == "" || newCustomerPswrdtxt.text == "")
             {
                 let alertController = UIAlertController(title:"Error", message: "Invalid entry", preferredStyle: .alert)
                 alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                 self.present(alertController, animated: true, completion: nil)
                 return
             }
             
        if(Validations.email(email: newCustomerEmailtxt.text!) == false && Validations.mobileNumber(number: newCustomerMobileNumbertxt.text!) == false)
             {
                let alertController = UIAlertController(title:"Error", message: "Invalid email ID and phone number", preferredStyle: .alert)
                 alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                 self.present(alertController, animated: true, completion: nil)
                 return
             }
             
        if(Validations.email(email: newCustomerEmailtxt.text!) == false)
                 {
                     let alertController = UIAlertController(title:"Error", message: "Invalid email ID", preferredStyle: .alert)
                     alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                     self.present(alertController, animated: true, completion: nil)
                     return
                 }
             
        if(Validations.mobileNumber(number: newCustomerMobileNumbertxt.text!) == false)
             {
                 let alertController = UIAlertController(title:"Error", message: "Invalid phone number", preferredStyle: .alert)
                 alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                 self.present(alertController, animated: true, completion: nil)
                 return
             }
        



    
    }

}
