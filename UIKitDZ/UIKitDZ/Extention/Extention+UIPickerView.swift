//
//  Extention+UIPickerView.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 02.10.2022.
//

import UIKit

extension TimerViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return hour.count
        case 1:
            return  minute.count
        case 2:
            return  second.count
        default:
            break
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    attributedTitleForRow row: Int,
                    forComponent component: Int) -> NSAttributedString? {
        
        var titel = ""
        
        switch component {
        case 0:
            titel = String(hour[row])
        case 1:
            titel = String(minute[row])
        case 2:
            titel = String(second[row])
        default:
            break
        }
        
        let attributedString = NSAttributedString(string: titel,
                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return attributedString
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//
//        print(component)
//        switch component {
//        case 0:
//            return String(hour[row])
//        case 1:
//            return  String(minute[row])
//        case 2:
//            return  String(second[row])
//        default:
//            break
//        }
//        return ""
//    }
}
