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
    
    private let userModel = User.getUsers()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.welcomeUser = userModel.login
            } else if let navigationVC = viewController as? UINavigationController {
                guard let profileVC = navigationVC.topViewController as? ProfileViewController else { return }
                profileVC.title = "Профиль"
                profileVC.name = userModel.person.name
                profileVC.surName = userModel.person.surname
                profileVC.livaIn = userModel.person.liveIn
                profileVC.work = userModel.person.company
            }
        }
    }
    
    
// MARK: - @IBActions
    
    @IBAction func helpAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            showAlert(withTitle: "Help Login", andMessage: userModel.login)
        case 1:
            showAlert(withTitle: "Help Password", andMessage: userModel.password)
        default:
            guard checkLoginPassword() else {
                showAlert(
                    withTitle: "Упс!",
                    andMessage: "Неверное имя или пароль, ну есть же подсказки ;)"
                )
                clearTextFields()
                return
            }
            performSegue(withIdentifier: "openWelcomVC", sender: nil)
        }
    }
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        clearTextFields()
    }
}



extension LoginViewController {
    
    // MARK: - TouchesBegan
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - UIAlertController
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    // MARK: - Private metods
    
    private func checkLoginPassword() -> Bool {
        loginTextField.text == userModel.login &&
        passwordTextField.text == userModel.password
    }
    
    private func clearTextFields() {
        loginTextField.text = nil
        passwordTextField.text = nil
    }
}
