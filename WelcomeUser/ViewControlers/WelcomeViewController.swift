//
//  WelcomeViewController.swift
//  WelcomeUser
//
//  Created by Александр Панин on 14.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var userName: (name: String?, password: String?)
    
    private let startColor = UIColor(
        displayP3Red: 1.0,
        green: 0.0,
        blue: 0.0,
        alpha: 0.5)
    private let finishColor = UIColor(
        displayP3Red: 0.5,
        green: 0.0,
        blue: 0.5,
        alpha: 0.5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradient(preview: view, startColor: startColor, finishColor: finishColor)
        welcomeLabel.numberOfLines = 3
        welcomeLabel.text = "Welcome \u{000D}" + String(userName.name ?? "") + "\u{000D} \u{1F44B}"
    }
}
// MARK: - private methods and functions

extension WelcomeViewController {
    
    private func setGradient(preview: UIView, startColor: UIColor, finishColor: UIColor) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [startColor.cgColor, finishColor.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.frame = preview.layer.frame
        preview.layer.insertSublayer(gradient, at: 0)
    }
}
