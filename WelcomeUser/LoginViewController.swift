//
//  ViewController.swift
//  WelcomeUser
//
//  Created by Александр Панин on 14.12.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var userPasswordField: UITextField!
    
    private let userNameCorrect = "user"
    private let userPasswodCorrect = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameField.delegate = self
        userPasswordField.delegate = self
        
        userPasswordField.enablesReturnKeyAutomatically = true
        userPasswordField.isSecureTextEntry = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as! WelcomeViewController
        welcomeVC.userName = userNameField.text ?? ""
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
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
        
        userNameField.becomeFirstResponder()
        userPasswordField.resignFirstResponder()
        
        performSegue(withIdentifier: "goWelcome", sender: nil)
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

// MARK: - private methods and functions

extension LoginViewController {
    
    // MARK: - error message
    
    private func showAlert(title: String, message: String, field: UITextField ) {
        let alertView = UIAlertController (title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in
            field.text = ""
        }
        alertView.addAction(okAction)
        present(alertView, animated: true)
    }
    
    // MARK: - navigating through text fields
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .next {
            userNameField.resignFirstResponder()
            userPasswordField.becomeFirstResponder()
        } else if textField.text != "" {
            userPasswordField.enablesReturnKeyAutomatically = false
            userPasswordField.resignFirstResponder()
            logInButton()
        }
        return true
    }
    
        // MARK: - name and password verification
    
    private func verificationUser (name: String, password: String, c)
}



