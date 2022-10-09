//
//  Extension+UITableView.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 05.10.2022.
//

import UIKit
/// Расширение для UITableView и установка констреинт
extension StopwatchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lapTimes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellText = Constants.cellText
        let space = Constants.space
        
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifire, for: indexPath)
        cell.textLabel?.text =
        "\(cellText)\(indexPath.row + 1)\(space)\(lapTimes[indexPath.row])"
        
        cell.backgroundColor = .systemMint
        cell.textLabel?.textColor = .black
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60.0
    }
    
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
