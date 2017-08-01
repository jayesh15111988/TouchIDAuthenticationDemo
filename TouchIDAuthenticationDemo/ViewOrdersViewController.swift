//
//  EditNoteViewController.swift
//  TouchIDAuthenticationDemo
//
//  Created by Jayesh Kawli on 7/30/17.
//  Copyright © 2017 Jayesh Kawli. All rights reserved.
//

import UIKit

class ViewOrdersViewController: UIViewController, UIAlertViewDelegate, AlertDisplayable {

    lazy var localAuthenticator: TouchIDAuthenticatorUtlity = {
        return TouchIDAuthenticatorUtlity(presenter: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "View Previous Orders"
    }

    @IBAction func viewPreviousOrdersButtonPressed(_ sender: Any) {
        self.localAuthenticator.authenticateUser()
    }

    func showAlert() {
        DispatchQueue.main.async {

            let alertTitle = "Enter Password"
            let alertBody = "Please enter an account password to view your previous orders"

            let alertController = UIAlertController(title: alertTitle, message: alertBody, preferredStyle: .alert)

            alertController.addTextField(configurationHandler: { (textField) in
                textField.isSecureTextEntry = true
                textField.placeholder = "Password"
                textField.text = defaultPassword
            })

            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                if let password = alertController.textFields?.first?.text, password == defaultPassword {
                    self.moveToOrderList()
                } else {
                    self.showAlert()
                }
            })

            let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }

    func authneticationSuccssful() {
        DispatchQueue.main.async {
            self.moveToOrderList()
        }
    }

    func moveToOrderList() {
        if let allOrdersViewController = self.storyboard?.instantiateViewController(withIdentifier: "allOrders") {
            self.navigationController?.pushViewController(allOrdersViewController, animated: true)
        } else {
            fatalError("Failed to grab expected view controller from storyboard")
        }
    }


}
