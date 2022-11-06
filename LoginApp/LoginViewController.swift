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
        guard let login = loginTextField.text, !login.isEmpty else {
            showAlert(withTitle: "Error Login", andMessage: "Забыли логин? ну есть же подсказки ;)")
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlert(withTitle: "Error Password", andMessage: "Забыли пароль? ну есть же подсказки ;)")
            return
        }
        
        if login != userName || password != userPassword {
            showAlert(withTitle: "Упс!", andMessage: "Неверное имя или пароль, ну есть же подсказки ;)")
        } else {
            guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
            welcomeVC.welcomeUser = login
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
