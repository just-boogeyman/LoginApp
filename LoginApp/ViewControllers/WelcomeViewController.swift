//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Ярослав Кочкин on 14.09.2023.
//

import Foundation
import UIKit


final class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLable: UILabel!
    
    var name: String!
    
    override func viewDidLoad() {
        configure()
    }
    
    @IBAction func cancelAction() {
        dismiss(animated: true)
    }
}


extension WelcomeViewController {
    private func configure() {
        guard let fullName = welcomeLable.text else { return }
        welcomeLable.text = fullName + name
    }
}
