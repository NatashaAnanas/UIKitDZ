//
//  VFLViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 16.10.2022.
//

import UIKit

///  Светофор через VFL 
final class VFLViewController: UIViewController {

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
        createVFL()
    }
    
    // MARK: - Private methods
    private func createUI() {
        view.backgroundColor = .magenta
        view.addSubview(blackView)
        view.addSubview(redView)
        view.addSubview(yellowView)
        view.addSubview(greenView)
    }
    
    private func createVFL() {
        let viewVFL = ["RV": redView, "YV": yellowView, "GV": greenView]
        let blackViewVFL = ["BV": blackView]
        
        let height = view.bounds.size.width / 3.3 - 10
        let topMargin = view.bounds.size.width / 2 - (height) / 2
        let top = view.bounds.size.height / 2 - height * 1.5 - 10
        
        let metrics = ["height": height,
                       "width": height,
                       "heightBlackView": height * 3 + 40,
                       "widthBlackView": height + 40,
                       "topMarginBlackView": topMargin - 20,
                       "topBlack": top - 10,
                       "topMargin": topMargin,
                       "top": top]
        
        for vieww in viewVFL.keys {
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
                                                                "H:|-(topMargin)-[\(vieww)(width)]|",
                                                               options: [],
                                                               metrics: metrics,
                                                               views: viewVFL))
        }
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
        "H:|-(topMarginBlackView)-[BV(widthBlackView)]-(topMarginBlackView)-|",
                                                           options: [],
                                                           metrics: metrics,
                                                           views: blackViewVFL))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
                                                            "V:|-(topBlack)-[BV(heightBlackView)]|",
                                                           options: [],
                                                           metrics: metrics,
                                                           views: blackViewVFL))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
                                                            "V:|-(top)-[RV(height)]-[YV(RV)]-[GV(RV)]-(top)-|",
                                                           options: [],
                                                           metrics: metrics,
                                                           views: viewVFL))
    }
}
