//
//  GradientView.swift
//  LoginApp
//
//  Created by Ярослав Кочкин on 17.09.2023.
//

import Foundation
import UIKit

class GradientView: UIView {
    
    private let gradientLauer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLauer.frame = bounds
    }
    
    private func setupGradient() {
        self.layer.addSublayer(gradientLauer)
        gradientLauer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
    }
}
