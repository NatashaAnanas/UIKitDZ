//
//  AncorViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 16.10.2022.
//

import UIKit

/// Светофор через Ancor
final class AncorViewController: UIViewController {
    
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
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        createAncors()
    }
    
    // MARK: - Private Methods
    private func createUI() {
        view.backgroundColor = .orange
        
        view.addSubview(blackView)
        view.addSubview(yellowView)
        view.addSubview(greenView)
        view.addSubview(redView)
    }
    
    private func createAncors() {
        createAncorYellowView()
        createAncorBlackView()
        createAncorGreenView()
        createAncorRedView()
    }
    
    private func createAncorBlackView() {
        blackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        blackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.68).isActive = true
        blackView.widthAnchor.constraint(equalTo: yellowView.widthAnchor, constant: 20).isActive = true
    }
    
    private func createAncorYellowView() {
        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        yellowView.heightAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
    }
    
    private func createAncorRedView() {
        redView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
        redView.centerYAnchor.anchorWithOffset(to: yellowView.centerYAnchor)
            .constraint(equalTo: yellowView.heightAnchor, multiplier: 1.1).isActive = true
        redView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
        redView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
    }
    
    private func createAncorGreenView() {
        greenView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
        greenView.centerYAnchor.anchorWithOffset(to: yellowView.centerYAnchor)
            .constraint(equalTo: yellowView.heightAnchor, multiplier: -1.1).isActive = true
        greenView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
        greenView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
    }
}
