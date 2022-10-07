//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 21.09.2022.
//

import UIKit
/// Экран секундомер
final class StopwatchViewController: UIViewController {
    
    enum Constants {
        static let space = "                                                        "
        static let cellText = "Круг"
        static let start = "Старт"
        static let indentifire = "MyCell"
        static let stop = "Стоп"
        static let startTime = "00:00:00"
        static let newTime = "Сброс"
        static let defaultTime = "00"
    }
    
    // MARK: - Visual Components
    
    let startButton: UIButton = {
        
        let button = UIButton()
        button.setTitle(Constants.start, for: .normal)
        button.setTitleColor(UIColor.green, for: .normal)
        button.layer.cornerRadius = 55
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.green.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .tertiaryLabel
        return button
    }()
    
    let circleButton: UIButton = {
        
        let button = UIButton()
        button.setTitle(Constants.cellText, for: .normal)
        button.setTitleColor(UIColor.opaqueSeparator, for: .normal)
        button.layer.cornerRadius = 55
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.tertiaryLabel.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .tertiaryLabel
        button.isEnabled = false
        return button
    }()
    
    let timeTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var timeLabel: UILabel = {
        
        let label = UILabel()
        label.text = Constants.startTime
        label.font = .systemFont(ofSize: 88)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Public Properties
    
    let indentifire = Constants.indentifire
    
    var lapTime: [String] = []
    
    // MARK: - Private Properties
    
    private var timer = Timer()
    
    private var isTimerRunning = false
    
    private var counter = 0.00
    
    private var valueStart = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        addConstraints()
        createTableView()
    }
    
    // MARK: - Create tableView
    
    private func createTableView() {
        
        timeTableView.delegate = self
        timeTableView.dataSource = self
        
        timeTableView.register(UITableViewCell.self, forCellReuseIdentifier: indentifire)
        timeTableView.backgroundColor = .systemMint
    }

    // MARK: - Create startButtonAction
    
    @objc private func startButtonAction(sender: UIButton) {
        
        guard valueStart else {
            
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(runTimerAction),
                                         userInfo: nil,
                                         repeats: true)
            
            sender.setTitle(Constants.stop, for: .normal)
            sender.setTitleColor(UIColor.red, for: .normal)
            sender.layer.borderColor = UIColor.red.cgColor
            
            circleButton.isEnabled = true
            circleButton.setTitleColor(UIColor.white, for: .normal)
            circleButton.setTitle(Constants.cellText, for: .normal)
            
            valueStart = true
            
            return
        }
        
        sender.setTitle(Constants.start, for: .normal)
        sender.setTitleColor(UIColor.green, for: .normal)
        sender.layer.borderColor = UIColor.green.cgColor
        
        timer.invalidate()
        
        circleButton.isEnabled = true
        circleButton.setTitle(Constants.newTime, for: .normal)
        
        valueStart = false
    }
    
    @objc private func runTimerAction() {
        
        counter += 0.01
        timeLabel.text = "\(counter)"
        
        let flooredCounter = Int(floor(counter))
        
        let minute = (flooredCounter % 3600) / 60
        var minuteString = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"
        }
        
        let second = (flooredCounter % 3600 ) % 60
        var secondString = "\(second)"
        if second < 10 {
            secondString = "0\(second)"
        }
        
        let deciSecond = String(format: "%.2f",
                                counter).components(separatedBy: ".").last
        
        timeLabel.text = "\(minuteString):\(secondString),\(String(describing: deciSecond ?? Constants.defaultTime))"
    }
    
    @objc private func circleButtonAction(sender: UIButton) {
        
        guard valueStart else {
            timeLabel.text = Constants.startTime
            lapTime.removeAll()
            timeTableView.reloadData()
            timer.invalidate()
            counter = 0.00
            return
        }
        
        lapTime.append("\(timeLabel.text ?? Constants.defaultTime)")
        timeTableView.reloadData()
    }
    
    private func setupViews() {
        
        let viewsArray = [startButton, circleButton, timeLabel, timeTableView]
        for ui in viewsArray {
            view.addSubview(ui)
        }
        
        startButton.addTarget(self,
                              action: #selector(startButtonAction(sender:)),
                              for: .touchUpInside)
        circleButton.addTarget(self,
                               action: #selector(circleButtonAction(sender:)),
                               for: .touchUpInside)
    }
}
