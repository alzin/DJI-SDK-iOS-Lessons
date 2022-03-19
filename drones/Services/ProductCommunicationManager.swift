//
//  ProductCommunicationManager.swift
//  drones
//
//  Created by Ghaith on 2022/02/21.
//

import DJISDK

class ProductCommunicationManager: NSObject, DJISDKManagerDelegate {
    
    let useBridge = true
    let debugId = "192.168.1.122"
    
    func registerApp() {
        guard
            let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path) as? Dictionary<String, AnyObject>,
            let appKey = dict["DJISDKAppKey"] as? String,
            appKey == "839137884bfe4974e4490b40"
        else {
            print("\n<<<ERROR: Please add DJI App Key in Info.plist after registering as a developer>>>\n")
            return
        }
        print("Regoistering Product with registeration ID: \(appKey)")
        
        DJISDKManager.registerApp(with: self)
    }
    
    func appRegisteredWithError(_ error: Error?) {
        if useBridge {
            if error == nil {
                DJISDKManager.enableBridgeMode(withBridgeAppIP: debugId)
            }
        } else {
            if error != nil {
                print("Error Registering the App: \(String(describing: error))")
            } else {
                DJISDKManager.startConnectionToProduct()
            }
        }
    }
    
    func productConnected(_ product: DJIBaseProduct?) {
        if product != nil, let model=product?.model {
            print("Connection to model \(model) has succeeded!")
        }
    }
    
    func didUpdateDatabaseDownloadProgress(_ progress: Progress) {}
}
