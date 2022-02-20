//
//  ViewController.swift
//  FirstDJIApp
//
//  Created by Ghaith on 2022/01/29.
//

import UIKit
import DJISDK

class ViewController: UIViewController, DJISDKManagerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resgisterApp()
    }
    
    func resgisterApp() {
        DJISDKManager.registerApp(with: self)
    }
    
    func appRegisteredWithError(_ error: Error?) {
        var message = "Register App Successed!"
        
        if error != nil {
            message = "Register App Failed! Please enter your App Key in the plist file and check the network"
        } else {
            print("registerAppSuccess!")
        }
        showAlertView(withTitle: "Register App", withMessage: message)
    }
    
    func showAlertView(withTitle title: String, withMessage message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func didUpdateDatabaseDownloadProgress(_ progress: Progress) {}

}

