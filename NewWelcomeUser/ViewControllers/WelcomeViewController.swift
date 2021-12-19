//
//  WelcomeViewController.swift
//  NewWelcomeUser
//
//  Created by Александр Панин on 18.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    var personUser: Person?
    
    private let startColor = UIColor(
        displayP3Red: 0.5,
        green: 0.0,
        blue: 0.0,
        alpha: 0.5)
    private let finishColor = UIColor(
        displayP3Red: 0.1,
        green: 0.0,
        blue: 0.0,
        alpha: 0.2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradient(preview: view, startColor: startColor, finishColor: finishColor)
        welcomeLabel.numberOfLines = 3
        welcomeLabel.text = "Welcome, \u{000D}" + setLastFirstName(personUser) + "!\u{000D} \u{1F44B}"
        tabBarController?.tabBar.items?[1].title = setLastFirstName(personUser)
    }
}
// MARK: - private methods and functions

extension WelcomeViewController {
    
    private func setGradient(preview: UIView, startColor: UIColor, finishColor: UIColor) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [startColor.cgColor, finishColor.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = preview.layer.frame
        preview.layer.insertSublayer(gradient, at: 0)
    }
    private func setLastFirstName(_ person: Person?) -> String {
        String(person?.person.lastName ?? "") + " " + String(person?.person.firstName ?? "")
    }
}
