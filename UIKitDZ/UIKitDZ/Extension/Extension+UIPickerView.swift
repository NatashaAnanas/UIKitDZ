//
//  Extension.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 04.10.2022.
//

import UIKit
/// Расширение для UIPickerView
extension PageViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        styles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        styles[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let size = textView.font?.pointSize ?? 20
        
        textView.font = UIFont(name: styles[row], size: size)
    }
}
