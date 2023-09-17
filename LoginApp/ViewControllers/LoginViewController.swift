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
    
    private let name = "user"
    private let password = "1234"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.name = name
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    //MARK: IBActions
    @IBAction func userNameAction() {
        showAlert(
            withTitle: "Я подскажу :)",
            andMessage: "Попробуй, \(name)"
        )
    }
    
    @IBAction func passwordAction() {
        showAlert(
            withTitle: "Я подскажу :)",
            andMessage: "Попробуй, \(password)"
        )
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else { return }
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func loginAction() {
        if !getPermission() {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, create login and password"
            )
        }
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
        userNameTF.text == name && passwordTF.text == password
    }
}
