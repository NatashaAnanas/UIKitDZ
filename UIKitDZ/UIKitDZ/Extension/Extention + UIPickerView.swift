//
//  Extension + UIPickerView.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 24.09.2022.
//

import UIKit
// Extention + UIPickerView.swift
extension AddPersonViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return 100
        case 1:
            return gender.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return String(row)
        case 1:
            return gender[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            self.ageTextField.text = String(row)
        case 1:
            self.genderTextField.text = gender[row]
        default:
            break
        }
    }
}
