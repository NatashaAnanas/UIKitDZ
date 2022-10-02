//
//  StopwatchViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 02.10.2022.
//

import UIKit
/// Секундомер
class StopwatchViewController: UIViewController {
    
    var valueStart = false
    let indentifire = "MyCell"
    var lapTimeArray: [String] = []
    var timer = Timer()
    var isTimerRunning = false
    var counter = 0.00
    
    private var timeLabel: UILabel = {
        
        let label = UILabel()
        label.text = "00:00.00"
        label.font = .systemFont(ofSize: 88)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var startButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Старт", for: .normal)
        button.setTitleColor(UIColor.green, for: .normal)
        button.layer.cornerRadius = 55
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.green.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .tertiaryLabel
       
        return button
    }()
    
    private var circleButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Круг", for: .normal)
        button.setTitleColor(UIColor.opaqueSeparator, for: .normal)
        button.layer.cornerRadius = 55
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.tertiaryLabel.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .tertiaryLabel
        button.isEnabled = false
       
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
    
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        addConstraints()
        setupDelegate()
        createTable()
        startButton.addTarget(self, action: #selector(startButtonAction(sender:)), for: .touchUpInside)
        circleButton.addTarget(self, action: #selector(circleButtonAction(sender:)), for: .touchUpInside)

    }
    
    // MARK: - Create startButtonAction
    
    @objc func startButtonAction (sender: UIButton) {
        print(lapTimeArray)
        if valueStart == false {
            
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(runTimer),
                                         userInfo: nil,
                                         repeats: true)
            
            sender.setTitle("Стоп", for: .normal)
            sender.setTitleColor(UIColor.red, for: .normal)
            sender.layer.borderColor = UIColor.red.cgColor
            
            circleButton.isEnabled = true
            circleButton.setTitleColor(UIColor.white, for: .normal)
            circleButton.setTitle("Круг", for: .normal)
            valueStart = true
            
        } else if valueStart == true {
            sender.setTitle("Старт", for: .normal)
            sender.setTitleColor(UIColor.green, for: .normal)
            sender.layer.borderColor = UIColor.green.cgColor
            
            timer.invalidate()
            
            circleButton.isEnabled = true
            circleButton.setTitle("Сброс", for: .normal)
            
            valueStart = false
        }
        
    }
    
    @objc func runTimer () {
        
        counter += 0.01
        timeLabel.text = "\(counter)"
        
        let flooredCounter = Int(floor(counter))
        
//        let deciSecond = String(format: "%02d", )
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
        
        timeLabel.text = "\(minuteString):\(secondString),\(String(describing: deciSecond ?? "00"))"
    }
    
    // MARK: - Create circleButtonAction
    @objc func circleButtonAction (sender: UIButton) {
        
        // кнопка сброс
        if valueStart == false {
            print(valueStart)
        timeLabel.text = "00:00.00"
            lapTimeArray.removeAll()
            self.tableView.reloadData()
            self.timer.invalidate()
        counter = 0.00
            
        } else {
            lapTimeArray.append("\(timeLabel.text ?? "hi")")
            tableView.reloadData()
            
        }
        
    }
    // MARK: - setup Delegate
    private func setupDelegate () {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - create tableView
    
    func createTable () {
      
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: indentifire)
        tableView.backgroundColor = .black

    }
    // MARK: - setup Views
    
    private func setupViews() {

        view.backgroundColor = .black
        let viewsArray = [startButton, circleButton, timeLabel, tableView]
        for UI in viewsArray {
            self.view.addSubview(UI)
        }
    }
}

// MARK: - Set Constraints
extension StopwatchViewController {
    
    private func addConstraints () {
        
        NSLayoutConstraint.activate([
           tableView.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 30),
           tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
           tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
           tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
     
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

// MARK: - UITableViewDataSource

extension StopwatchViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        return lapTimeArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//        let cell = tableView.dequeueReusableCell(withIdentifier: self.indentifire)
        let cellText = "Круг"
        let space = "                                                        "
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.indentifire, for: indexPath)
        cell.textLabel?.text =
        "\(cellText) \(indexPath.row + 1)\(space)\(lapTimeArray[indexPath.row])"
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white
    
//        let cellTimeLabel = UILabel()
//        cellTimeLabel.text = "\(lapTimeArray[indexPath.row])"
//        cellTimeLabel.textColor = .white
//        cellTimeLabel.frame = CGRect(x: 320, y: 10, width: 100, height: 40)
//        cell.addSubview(cellTimeLabel)
    
        return cell
    }
}
extension StopwatchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60.0
    }
}
