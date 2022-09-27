//
//  Extention + UIPickerView.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 27.09.2022.
//

import UIKit
/// Extention + UIPickerViewn (UIPickerViewDataSource, UIPickerViewDelegate)
extension StartViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return appArray.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return appArray[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch appArray[row] {
        case "Share":
            present(activityViewController, animated: true, completion: nil)
            shareTextField.text = "Сработал Share"
        case "Alert Controller":
            createAlert(titel: "Alert", message: "Сработал Alert Controller", preferredStyle: .alert)
            shareTextField.text = "Сработал Alert Controller"
        case "Alert Controller Sheet":
            createAlert(titel: "Alert", message: "Сработал Alert Controller", preferredStyle: .actionSheet)
            shareTextField.text = "Сработал Alert Controller Sheet"
        case "TextField":
            shareTextField.text = "Сработал TextField"
        case "Switch":
            shareSwitch.setOn(false, animated: true)
            shareTextField.text = "Сработал Switch"
        default:
            break
        }
    }
}
