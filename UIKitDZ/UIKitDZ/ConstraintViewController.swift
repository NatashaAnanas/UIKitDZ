//
//  NewViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 14.10.2022.
//

import UIKit

/// Светофор через Constraints
final class ConstraintViewController: UIViewController {
    
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
        createConstraints()
    }
    
    // MARK: - Private Methods
    private func createUI() {
        view.backgroundColor = .magenta
        
        view.addSubview(blackView)
        view.addSubview(yellowView)
        view.addSubview(greenView)
        view.addSubview(redView)
    }
    
    private func createConstraints() {
        createConstraintsYellowView()
        createConstraintsBlackView()
        createConstraintsGreenView()
        createConstraintsRedView()
    }
    
    private func createConstraintsBlackView() {
        
        NSLayoutConstraint.init(item: blackView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: blackView,
                                attribute: .centerY,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerY,
                                multiplier: 1,
                                constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: blackView,
                                attribute: .height,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .height,
                                multiplier: 0.68,
                                constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: blackView,
                                attribute: .width,
                                relatedBy: .equal,
                                toItem: yellowView,
                                attribute: .width,
                                multiplier: 1,
                                constant: 20).isActive = true
    }
    
    private func createConstraintsYellowView() {
        
        NSLayoutConstraint.init(item: yellowView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: yellowView,
                                attribute: .centerY,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerY,
                                multiplier: 1,
                                constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: yellowView,
                                attribute: .width,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .height,
                                multiplier: 0.2,
                                constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: yellowView,
                                attribute: .height,
                                relatedBy: .equal,
                                toItem: yellowView,
                                attribute: .width,
                                multiplier: 1,
                                constant: 0).isActive = true
    }
    
    private func createConstraintsGreenView() {
        
        NSLayoutConstraint.init(item: greenView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: yellowView,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: greenView,
                                attribute: .centerY,
                                relatedBy: .equal,
                                toItem: yellowView,
                                attribute: .centerY,
                                multiplier: 0.55,
                                constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: greenView,
                                attribute: .width,
                                relatedBy: .equal,
                                toItem: yellowView,
                                attribute: .width,
                                multiplier: 1,
                                constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: greenView,
                                attribute: .height,
                                relatedBy: .equal,
                                toItem: yellowView,
                                attribute: .height,
                                multiplier: 1,
                                constant: 0).isActive = true
    }
    
    private func createConstraintsRedView() {
        
        NSLayoutConstraint.init(item: redView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: yellowView,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: redView,
                                attribute: .centerY,
                                relatedBy: .equal,
                                toItem: yellowView,
                                attribute: .centerY,
                                multiplier: 1.45,
                                constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: redView,
                                attribute: .width,
                                relatedBy: .equal,
                                toItem: yellowView,
                                attribute: .width,
                                multiplier: 1,
                                constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: redView,
                                attribute: .height,
                                relatedBy: .equal,
                                toItem: yellowView,
                                attribute: .height,
                                multiplier: 1,
                                constant: 0).isActive = true
    }
}
