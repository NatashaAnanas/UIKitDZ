//
//  Extention.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 22.09.2022.
//

import UIKit

extension UIButton {
    convenience init(
        titel: String,
        backgroundColor: CGColor,
        cornerRadius: CGFloat,
        borderColor: CGColor,
        borderWidth: CGFloat
    ) {
        self.init(type: .custom)
        self.setTitle(titel, for: .normal)
        self.layer.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
    
    }
}

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
