//
//  AboutMeViewController.swift
//  LoginApp
//
//  Created by Ярослав Кочкин on 19.09.2023.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet var aboutMeLable: UILabel!
    
    var aboutMe = ""
    
    override func viewWillAppear(_ animated: Bool) {
        aboutMeLable.text = aboutMe
    }
}
