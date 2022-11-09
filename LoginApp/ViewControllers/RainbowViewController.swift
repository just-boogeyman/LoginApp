//
//  RainbowViewController.swift
//  LoginApp
//
//  Created by Ярослав Кочкин on 09.11.2022.
//

import UIKit

class RainbowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor.systemPink.cgColor,
            UIColor.systemBlue.cgColor,
            UIColor.systemGreen.cgColor,
            UIColor.systemYellow.cgColor,
            UIColor.systemPurple.cgColor
        ]
        view.layer.addSublayer(gradientLayer)
        
    }
}
