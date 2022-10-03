//
//  Extention+UITableView.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 03.10.2022.
//

import UIKit
/// Расширение для UITableView
extension StopwatchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lapTime.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellText = "Круг"
        let space = "                                                        "
        
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifire, for: indexPath)
        cell.textLabel?.text =
        "\(cellText)\(indexPath.row + 1)\(space)\(lapTime[indexPath.row])"
        
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60.0
    }
}
