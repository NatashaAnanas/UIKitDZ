//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 21.09.2022.
//

import UIKit
/// ViewController
class ViewController: UIViewController {
    
    @IBOutlet weak var shareButton: UIButton!

    var appPicker: UIPickerView = {
        
        let picker = UIPickerView()
        picker.tag = 0
        return picker
    }()
    
    let appArray = ["Share", "Alert Controller", "Alert Controller Sheet"]
    
    var activityViewController = UIActivityViewController(activityItems: ["Apps"], applicationActivities: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
    }
    
    public func createAlert(titel: String, message: String, preferredStyle: UIAlertController.Style) {
        
        let alertController = UIAlertController(title: titel,
                                                message: message,
                                                preferredStyle: preferredStyle)
        
        let alertAction = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(alertAction)
        
        present(alertController, animated: true)
        
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    private func createUI() {
        
        appPicker.delegate = self
        appPicker.dataSource = self
        
        appPicker.frame = CGRect(x: 0, y: 250, width: 300, height: 150)
        appPicker.center.x = view.center.x
        view.addSubview(appPicker)
    }
}
