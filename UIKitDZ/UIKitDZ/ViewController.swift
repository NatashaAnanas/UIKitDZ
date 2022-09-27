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
    @IBOutlet weak var appPicker: UIPickerView!
    
    
    let appArray = ["Share", "Alert Controller" ]
    
    var activityViewController = UIActivityViewController(activityItems: ["Apps"], applicationActivities: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func shareButtonAction(_ sender: Any) {
        
        print("Тут")
        
        self.present(activityViewController, animated: true, completion: nil)
    }
}
