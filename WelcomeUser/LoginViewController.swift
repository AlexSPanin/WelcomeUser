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
    
    private let correctUser = (name: "user", password: "123")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameField.delegate = self
        userPasswordField.delegate = self
        
        userPasswordField.enablesReturnKeyAutomatically = true
        userPasswordField.isSecureTextEntry = true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as! WelcomeViewController
        welcomeVC.userName.name = userNameField.text ?? ""
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @IBAction func logInButton() {
        guard verificationName(name: userNameField.text, correct: correctUser.name) else { return }
        
        userNameField.resignFirstResponder()
        userPasswordField.becomeFirstResponder()
        userPasswordField.enablesReturnKeyAutomatically = true
       
        guard verificationPassword(password: userPasswordField.text, correct: correctUser.password) else { return }
        
        userNameField.becomeFirstResponder()
        userPasswordField.resignFirstResponder()
        performSegue(withIdentifier: "goWelcome", sender: nil)
    }
    @IBAction func userNameButton(_ sender: UIButton) {
        showAlert(title: "Your User Name is", message: correctUser.name, field: userNameField)
    }
    @IBAction func passwordButton(_ sender: UIButton) {
        showAlert(title: "Your Password is", message: correctUser.password, field: userPasswordField)
    }
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: LoginViewController) {
        userNameField.text = ""
        userPasswordField.text = ""
    }
}
// MARK: - private methods and functions

extension LoginViewController {
    
    // MARK: - navigating through text fields
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .next && verificationName(name: userNameField.text, correct: correctUser.name) {
            userNameField.resignFirstResponder()
            userPasswordField.becomeFirstResponder()
            userPasswordField.enablesReturnKeyAutomatically = true
        } else if textField.text != "" && verificationPassword(password: userPasswordField.text, correct: correctUser.password) {
            userPasswordField.enablesReturnKeyAutomatically = false
            userPasswordField.resignFirstResponder()
            logInButton()
        }
        return true
    }
    
    // MARK: - name and password verification
    
    private func verificationName (name: String?, correct: String) -> Bool {
        guard name != "" else {
            showAlert(title: "User Name is Empty", message: "Please enter your User Name", field: userNameField)
            return false
        }
        guard name == correct else {
            showAlert(title: "User Name is incorrect", message: "Forgot Your User Name?", field: userNameField)
            return false
        }
        return true
    }
    private func verificationPassword (password: String?, correct: String) -> Bool {
        guard password != "" else {
            showAlert(title: "Password is Empty", message: "Please enter your Password", field: userPasswordField)
            return false
        }
        guard password == correct else {
            showAlert(title: "Password is incorrect", message: "Forgot Your Password?", field: userPasswordField)
            return false
        }
        return true
    }
    // MARK: - error message
    
    private func showAlert(title: String, message: String, field: UITextField ) {
        let alertView = UIAlertController (title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in
            field.text = ""
        }
        alertView.addAction(okAction)
        self.present(alertView, animated: true)
    }    
}



