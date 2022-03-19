//
//  ViewController.swift
//  drones
//
//  Created by Ghaith on 2022/02/21.
//

import UIKit
import DJIUXSDKBeta

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fpvWidget = DUXBetaFPVWidget()
        fpvWidget.install(in: self)
    }
}

