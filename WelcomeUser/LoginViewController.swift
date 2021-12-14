//
//  ViewController.swift
//  WelcomeUser
//
//  Created by Александр Панин on 14.12.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var userPasswordField: UITextField!
    
    private let userNameCorrect = "Alex"
    private let userPasswodCorrect = "123"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as! WelcomeViewController
        welcomeVC.userName = userNameField.text ?? ""
    }

    @IBAction func logInButton() {
        
        guard userNameField.text != "" else {
            showAlert(title: "User Name is Empty", message: "Please enter your User Name", field: userNameField)
            return
        }
        guard userNameField.text == userNameCorrect else {
            showAlert(title: "User Name is incorrect", message: "Forgot Your User Name?", field: userNameField)
            return
        }
         guard userPasswordField.text != "" else {
            showAlert(title: "Password is Empty", message: "Please enter your Password", field: userPasswordField)
             return
        }
        guard userPasswordField.text == userPasswodCorrect else {
            showAlert(title: "Password is incorrect", message: "Forgot Your Password?", field: userPasswordField)
            return
        }
    }
   
    @IBAction func userNameButton(_ sender: UIButton) {
        showAlert(title: "Your User Name is", message: userNameCorrect, field: userNameField)
    }
    @IBAction func passwordButton(_ sender: UIButton) {
        showAlert(title: "Your Password is", message: userPasswodCorrect, field: userPasswordField)
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: LoginViewController) {
      userNameField.text = ""
      userPasswordField.text = ""
    }
}
    
    // MARK: - Private Methods
    
    extension LoginViewController {
        private func showAlert(title: String, message: String, field: UITextField ) {
            let alert = UIAlertController (title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) {_ in
                field.text = ""
            }
            alert.addAction(okAction)
            present(alert, animated: true)
        }
    }
    


