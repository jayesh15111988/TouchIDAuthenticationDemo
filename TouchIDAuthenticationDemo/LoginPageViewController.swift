//
//  LoginPageViewController.swift
//  TouchIDAuthenticationDemo
//
//  Created by Jayesh Kawli on 7/31/17.
//  Copyright © 2017 Jayesh Kawli. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
    }

    @IBAction func logMeInButtonPressed(_ sender: Any) {
        if usernameTextField.text == defaultUserName && passwordTextField.text == defaultPassword {
            if let viewOrdersViewController = self.storyboard?.instantiateViewController(withIdentifier: "viewOrders") {
                self.navigationController?.pushViewController(viewOrdersViewController, animated: true)
            } else {
                fatalError("Failed to grab expected view controller from storyboard")
            }
        } else {
            print("Authentication Failed. Please try again")
        }
    }
}
