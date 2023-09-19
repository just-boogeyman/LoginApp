//
//  PersoneViewController.swift
//  LoginApp
//
//  Created by Ярослав Кочкин on 19.09.2023.
//

import Foundation
import UIKit

class PersoneViewController: UIViewController {
    
    @IBOutlet var nameLable: UILabel!
    @IBOutlet var surnameLable: UILabel!
    @IBOutlet var mailLable: UILabel!
    @IBOutlet var telegramLable: UILabel!
    
        
    var persone: Person!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configure()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let aboutMeVC = segue.destination as? AboutMeViewController else { return }
        aboutMeVC.aboutMe = persone.aboutMe
    }
    
    private func configure() {
        guard let user = persone else { return }
        navigationItem.title = persone.name
        nameLable.text = user.name
        surnameLable.text = user.surname
        mailLable.text = user.mail
        telegramLable.text = user.telegram
    }
}
