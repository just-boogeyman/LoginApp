//
//  ViewController.swift
//  LoginApp
//
//  Created by Ярослав Кочкин on 14.09.2023.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    private let user = User.getUserData()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        viewControllers.forEach { viewControllers in
            if let welcomeVC = viewControllers as? WelcomeViewController {
                welcomeVC.name = user.login
            } else if let navigationVC = viewControllers as? UINavigationController {
                guard let personeVC = navigationVC.topViewController as? PersoneViewController else { return }
                personeVC.persone = user.person
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    //MARK: IBActions
    @IBAction func fotgorPasswodrLogin(_ sender: UIButton) {
        sender.tag == 1
        ? showAlert(withTitle: "Я подскажу)", andMessage: "Попробуй \(user.login)")
        : showAlert(withTitle: "Я подскажу)", andMessage: "Попробуй \(user.password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func loginAction() {
        if !getPermission() {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, create login and password"
            )
            return
        }
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
}


// MARK: - Private Metods
private extension LoginViewController {
    func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func getPermission() -> Bool {
        userNameTF.text == user.login && passwordTF.text == user.password
    }
}
