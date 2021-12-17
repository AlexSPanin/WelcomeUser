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
    
    private let correctUser = (name: "user", password: "123")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameField.delegate = self
        userPasswordField.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as! WelcomeViewController
        welcomeVC.userName.name = correctUser.name
    }
   
    @IBAction func logInButton() {
        guard verificationUser(name: userNameField.text, password: userPasswordField.text, correct: correctUser) else { return }
    }
    @IBAction func userNameButton(_ sender: UIButton) {
        showAlert(title: "Your User Name is", message: correctUser.name, field: userNameField)
    }
    @IBAction func passwordButton(_ sender: UIButton) {
        showAlert(title: "Your Password is", message: correctUser.password, field: userPasswordField)
    }
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        userNameField.text = ""
        userPasswordField.text = ""
    }
}
// MARK: - private methods and functions

extension LoginViewController {
    
    // MARK: - name and password verification
    
    private func verificationUser (name: String?, password: String?, correct: (name: String, password: String)) -> Bool {
        guard name != "" && name == correct.name else {
            showAlert(title: "User Name or Password is incorrect !!!", message: "Please enter your User Name and Password", field: userPasswordField)
            return false
        }
        guard password != "" && password == correct.password else {
            showAlert(title: "User Name or Password is incorrect !!!", message: "Please enter your User Name and Password", field: userPasswordField)
            return false
        }
        return true
    }
   
    // MARK: - Alert controller
    
    private func showAlert(title: String, message: String, field: UITextField ) {
        let alertView = UIAlertController (title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in
            field.text = ""
        }
        alertView.addAction(okAction)
        self.present(alertView, animated: true)
    }    
}

// MARK: - Text controler

extension LoginViewController:  UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userNameField {
            userNameField.resignFirstResponder()
            userPasswordField.becomeFirstResponder()
        } else {
            if verificationUser(name: userNameField.text, password: userPasswordField.text, correct: correctUser) {
                performSegue(withIdentifier: "goWelcome", sender: nil)
            }
        }
        return true
    }
}
        
//
//
//
//        if verificationUser(name: userNameField.text, password: userPasswordField.text, correct: correctUser) {
//            if textField == userPasswordField {
//                performSegue(withIdentifier: "goWelcome", sender: nil)
//            }
//        }
//
//
//            verificationUser(name: <#T##String?#>, password: <#T##String?#>, correct: <#T##(name: String, password: String)#>)
//
//
//
//
//        if textField.returnKeyType == .next && verificationUser(name: <#T##String?#>, password: <#T##String?#>, correct: <#T##(name: String, password: String)#>)(name: userNameField.text, correct: correctUser.name) {
//            userNameField.resignFirstResponder()
//            userPasswordField.becomeFirstResponder()
//        } else if textField.text != "" && verificationPassword(password: userPasswordField.text, correct: correctUser.password) {
//            userPasswordField.resignFirstResponder()
//            logInButton()
//        }
//        return true
//    }
//}
//
//
//
//
//performSegue(withIdentifier: "goWelcome", sender: nil)
