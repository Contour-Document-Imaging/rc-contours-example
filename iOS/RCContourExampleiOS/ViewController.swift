//
//  ViewController.swift
//  RCContourExampleiOS
//
//  Created by kapil teotia on 28/03/25.
//

import UIKit
import RC_Contour_SDK
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func openSDK() {
        var configuration = Configuration()
        configuration.clientId = "YOUR_CLIENT_ID"
        configuration.token = "YOUR_TOKEN"
        configuration.environmentId = "ENVIRONMENT_ID"
        RCContour.initialize(configuration: configuration)
        let rcContourVC = RCContour.getLaunchScreen()
        let navigationController = UINavigationController(rootViewController: rcContourVC)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: false)
    }
    
    @IBAction func sdkButtonClicked(_ sender: UIButton) {
        openSDK()
    }
}

