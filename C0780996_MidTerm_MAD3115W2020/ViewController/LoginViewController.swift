//
//  ViewController.swift
//  C0780996_MidTerm_MAD3115W2020
//
//  Created by Raghav Bobal on 2020-03-05.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var remMeSwitch: UISwitch!
   
    
    override func viewDidLoad()
       {
            super.viewDidLoad()
            let userDf = UserDefaults.standard
            let name = userDf.string(forKey:"name")
            let pswrd = userDf.string(forKey: "password")
            self.navigationItem.hidesBackButton = true
                if let uName = name
                {
                    emailTxt.text = uName
                }
                if let password = pswrd
                {
                    passwordTxt.text=password
                }
       }
    @IBAction func btnLogin(_ sender: Any)
    {
        if (emailTxt.text == "" || passwordTxt.text == "")
          {
        let alertController = UIAlertController(title: "Error", message: "Email/Password is blank", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
          }
        
    }
   


}

