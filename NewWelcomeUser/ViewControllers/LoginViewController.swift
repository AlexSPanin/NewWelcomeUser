//
//  ViewController.swift
//  NewWelcomeUser
//
//  Created by Александр Панин on 18.12.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var userPasswordField: UITextField!
    
    private let personUser = Person.getPerson()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameField.delegate = self
        userPasswordField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let myViewControllers = tabBarController.viewControllers!
        
        for viewController in myViewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.personUser = personUser
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutUserVC = navigationVC.topViewController as! AboutMeViewController
                aboutUserVC.aboutPerson = personUser
            }
        }
    }
    
    @IBAction func logInButton() {
        guard verificationUser(name: userNameField.text, password: userPasswordField.text, correct: personUser) else { return }
    }
    @IBAction func userNameButton(_ sender: UIButton) {
        showAlert(title: "Your User Name is", message: personUser.person.userName, field: userNameField)
    }
    @IBAction func passwordButton(_ sender: UIButton) {
        showAlert(title: "Your Password is", message: personUser.person.userPassword, field: userPasswordField)
    }
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        userNameField.text = ""
        userPasswordField.text = ""
    }
}
// MARK: - private methods and functions

extension LoginViewController {
    
    // MARK: - name and password verification
    
    private func verificationUser (name: String?, password: String?, correct: Person) -> Bool {
        guard name != "" && name == correct.person.userName else {
            showAlert(title: "User Name or Password is incorrect !!!", message: "Please enter your User Name and Password", field: userPasswordField)
            return false
        }
        guard password != "" && password == correct.person.userPassword else {
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
// MARK: - Text controller

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
            if verificationUser(name: userNameField.text, password: userPasswordField.text, correct: personUser) {
                performSegue(withIdentifier: "goWelcome", sender: nil)
            }
        }
        return true
    }
}


