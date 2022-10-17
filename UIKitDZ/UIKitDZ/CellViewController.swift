//
//  CellViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 17.10.2022.
//

import UIKit

///  Радуга VFL
final class CellViewController: UIViewController {

    // MARK: - Visual Components
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
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
    
    private let blueleView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let magentaView: UIView = {
        let view = UIView()
        view.backgroundColor = .magenta
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let purpleView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        createVFL()
    }
    
    // MARK: - Private methods
    private func createUI() {
        view.backgroundColor = .black
        view.addSubview(redView)
        view.addSubview(orangeView)
        view.addSubview(yellowView)
        view.addSubview(greenView)
        view.addSubview(blueleView)
        view.addSubview(magentaView)
        view.addSubview(purpleView)
    }
    
    private func createVFL() {
        let viewVFL = ["RV": redView,
                       "OV": orangeView,
                       "YV": yellowView,
                       "GV": greenView,
                       "BV": blueleView,
                       "MV": magentaView,
                       "PV": purpleView]
        
        let height = view.bounds.size.height / 15
        let metrics = ["height": height]
        for vieww in viewVFL.keys {
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
                                                                "H:|[\(vieww)]|",
                                                               options: [],
                                                               metrics: nil,
                                                               views: viewVFL))
        }
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
        "V:|[RV(height)]-[OV(RV)]-[YV(RV)]-[GV(RV)]-[BV(RV)]-[MV(RV)]-(>=10)-|",
                                                           options: [],
                                                           metrics: metrics,
                                                           views: viewVFL))
    }
}
