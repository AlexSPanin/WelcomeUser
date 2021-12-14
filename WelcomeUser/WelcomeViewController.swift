//
//  WelcomeViewController.swift
//  WelcomeUser
//
//  Created by Александр Панин on 14.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = "Welcome " + userName
    }
}
