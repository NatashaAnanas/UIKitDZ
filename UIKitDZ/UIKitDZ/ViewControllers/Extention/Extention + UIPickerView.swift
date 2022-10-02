//
//  Extention + UIPickerView.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 30.09.2022.
//

import UIKit
/// Расширение для UIPickerView
extension PageOneViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return colors.count
        case 1:
            return nums.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return colors[row].0
        case 1:
            return nums[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            return myLabel.textColor = colors[row].1
        case 1:
            return myLabel.numberOfLines = Int(nums[row]) ?? 0
        default:
            break
        }
    }
}
