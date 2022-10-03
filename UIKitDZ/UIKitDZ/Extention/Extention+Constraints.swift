//
//  Extention+Constraints.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 03.10.2022.
//

import UIKit
/// Установка констреинт
extension StopwatchViewController {
    
    func addConstraints() {
        
        NSLayoutConstraint.activate([
            timeTableView.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 30),
            timeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            timeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            timeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        ])
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            timeLabel.widthAnchor.constraint(equalTo: view.widthAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            circleButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 100),
            circleButton.widthAnchor.constraint(equalToConstant: 110),
            circleButton.heightAnchor.constraint(equalToConstant: 110),
            circleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 100),
            startButton.widthAnchor.constraint(equalToConstant: 110),
            startButton.heightAnchor.constraint(equalToConstant: 110),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
