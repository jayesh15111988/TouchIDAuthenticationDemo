//
//  ViewController.swift
//  TouchIDAuthenticationDemo
//
//  Created by Jayesh Kawli on 7/30/17.
//  Copyright © 2017 Jayesh Kawli. All rights reserved.
//

// Reference: http://www.appcoda.com/touch-id-api-ios8/

import UIKit
import LocalAuthentication

class OrdersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "All Orders"
        self.tableView.tableFooterView = UIView()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Order \(indexPath.row + 1)"
        return cell
    }
}

