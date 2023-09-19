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
    
    var name = ""
    
    override func viewDidLoad() {
        welcomeLable.text = "Welcome, \(name)"
    }
}
