//
//  ViewController.swift
//  LoginApp
//
//  Created by Ярослав Кочкин on 04.11.2022.
//

import UIKit

class LoginViewController: UIViewController {

// MARK: - @IBOutlets
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var helpNameButton: UIButton!
    @IBOutlet weak var helpPasswordButton: UIButton!
    
    private let userName = "User"
    private let userPassword = "1234"
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if loginTextField.text == userName &&
            passwordTextField.text == userPassword {
            guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
            welcomeVC.welcomeUser = userName
        }
        else {
            showAlert(withTitle: "Упс!", andMessage: "Неверное имя или пароль, ну есть же подсказки ;)")
        }
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    
// MARK: - @IBActions
    
    @IBAction func helpAction(_ sender: UIButton) {
        if sender == helpNameButton {
            showAlert(withTitle: "Help Login", andMessage: userName)
        }
        else {
            showAlert(withTitle: "Help Password", andMessage: userPassword)
        }
    }
    
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
}


// MARK: - UIAlertController

extension LoginViewController {
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
