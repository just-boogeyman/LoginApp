//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Ярослав Кочкин on 04.11.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var welcomeUser = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(welcomeUser) 👋"
    }
}
