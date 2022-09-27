//
//  Extention + UIPickerView.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 27.09.2022.
//

import UIKit

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
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
//
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch appArray[row] {
        case "Share":
            self.present(activityViewController, animated: true, completion: nil)
        case "Alert Controller":
            self.createAlert(titel: "Alert", message: "Сработал Alert Controller", preferredStyle: .alert)
        case "Alert Controller Sheet":
            self.createAlert(titel: "Alert", message: "Сработал Alert Controller", preferredStyle: .actionSheet)
        default:
            break
        }
    }
}
