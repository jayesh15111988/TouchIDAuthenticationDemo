//
//  TouchIDAuthenticatorUtlity.swift
//  TouchIDAuthenticationDemo
//
//  Created by Jayesh Kawli on 7/31/17.
//  Copyright © 2017 Jayesh Kawli. All rights reserved.
//

import UIKit
import LocalAuthentication

let defaultUserName = "jdotkawli@gmail.com"
let defaultPassword = "password"

protocol AlertDisplayable {
    func showAlert()
    func authneticationSuccssful()
}

class TouchIDAuthenticatorUtlity {

    let presenter: AlertDisplayable

    init(presenter: AlertDisplayable) {
        self.presenter = presenter
    }

    func authenticateUser() {
        let context = LAContext()
        var error: NSError?
        let reasonString = "Authentication is needed to access orders"

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reasonString, reply: { (success, evalPolicyError) in
                if success {
                    self.presenter.authneticationSuccssful()
                } else {
                    if let error = evalPolicyError as NSError? {
                        switch error.code {

                        case LAError.systemCancel.rawValue:
                            print("Authentication was cancelled by the system")

                        case LAError.userCancel.rawValue:
                            print("Authentication was cancelled by the user")

                        case LAError.userFallback.rawValue:
                            print("User selected to enter custom password")
                            self.presenter.showAlert()
                        default:
                            print("Authentication failed")
                            self.presenter.showAlert()
                        }
                    }
                }
            })
        } else {
            switch error!.code {
            case LAError.touchIDNotEnrolled.rawValue:
                print("TouchID is not enrolled")
            case LAError.passcodeNotSet.rawValue:
                print("A passcode has not been set")
            default:
                print("TouchID not available")
            }
            self.presenter.showAlert()
        }
    }
}
