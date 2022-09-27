//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 21.09.2022.
//

import UIKit
/// StartViewController - начальный контроллер
class StartViewController: UIViewController {
    
    @IBOutlet weak var shareSwitch: UISwitch!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var shareTextField: UITextField!
    
    let appArray = ["Share", "Alert Controller", "Alert Controller Sheet", "TextField", "Switch"]

    private var appPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.tag = 0
        return picker
    }()
    
    var activityViewController = UIActivityViewController(activityItems: ["Apps"], applicationActivities: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
        
        present(activityViewController, animated: true, completion: nil)
    }
    
    public func createAlert(titel: String, message: String, preferredStyle: UIAlertController.Style) {
        
        let alertController = UIAlertController(title: titel,
                                                message: message,
                                                preferredStyle: preferredStyle)
        
        let alertAction = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(alertAction)
        
        present(alertController, animated: true)
        
    }
    
    private func createUI() {
        
        appPicker.delegate = self
        appPicker.dataSource = self
        
        appPicker.frame = CGRect(x: 0, y: 250, width: 300, height: 150)
        appPicker.center.x = view.center.x
        view.addSubview(appPicker)
    }
}
