//
//  ViewController.swift
//  RCContourExampleiOS
//
//  Created by kapil teotia on 28/03/25.
//

import UIKit
import RC_Contour_SDK
class ViewController: UIViewController {
    
    @IBOutlet weak var environmentTypeTextField: UITextField!
    @IBOutlet weak var tokenTypeTextField: UITextField!
    @IBOutlet weak var environmentIdTextField: UITextField!
    @IBOutlet weak var clientIdTextField: UITextField!
    var configuration = Configuration()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func openSDK() {
        configuration.clientId = clientIdTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        configuration.token = tokenTypeTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        configuration.environmentId = environmentIdTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        configuration.isLocationEnabled = false
        setEnvironmentType()
        RCContour.initialize(configuration: configuration)
        let rcContourVC = RCContour.getLaunchScreen()
        let navigationController = UINavigationController(rootViewController: rcContourVC)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: false)
    }
    
    @IBAction func sdkButtonClicked(_ sender: UIButton) {
        openSDK()
    }
    func setEnvironmentType() {
        switch environmentTypeTextField.text {
        case "qa":
            configuration.environmentType = .qa
        case "dev":
            configuration.environmentType = .dev
        case "uat":
            configuration.environmentType = .uat
        case "ppe":
            configuration.environmentType = .ppe
        default:
            break
        }
    }
}

extension ViewController: UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Dismiss the keyboard
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
