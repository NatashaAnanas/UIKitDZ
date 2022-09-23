//
//  UILable+Extension.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 23.09.2022.
//

import UIKit

extension UILabel {
    convenience init(
        numberOfLines: Int,
        textColor: UIColor,
        font: UIFont
    ) {
        self.init()
        self.numberOfLines = numberOfLines
        self.textColor = textColor
        self.font = font
    }
}
