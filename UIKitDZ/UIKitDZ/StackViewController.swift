//
//  StackViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 16.10.2022.
//

import UIKit

/// Светофор через StackView
final class StackViewController: UIViewController {
    
    // MARK: - Visual Components
    private let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var squareStackView = UIStackView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    // MARK: - Private Methods
    private func createUI() {
        view.backgroundColor = .systemMint
        view.addSubview(blackView)
        
        createConstraintBlackView()
        createSquareStackView()
    }
    
    private func createSquareStackView() {
        
        squareStackView = UIStackView(arrangedSubviews: [greenView, yellowView, redView])
        squareStackView.translatesAutoresizingMaskIntoConstraints = false
        squareStackView.spacing = 8
        squareStackView.axis = .vertical
        squareStackView.distribution = .fillEqually
        view.addSubview(squareStackView)
        
        createConstraintSquareStackView()
    }
    
    private func  createConstraintSquareStackView() {
        
        NSLayoutConstraint.activate([
            squareStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            squareStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            squareStackView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            squareStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.68)
        ])
    }
    
    private func createConstraintBlackView() {
        
        NSLayoutConstraint.activate([
            blackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            blackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blackView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.22),
            blackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.71)
        ])
    }
}
