//
//  AboutMeViewController.swift
//  NewWelcomeUser
//
//  Created by Александр Панин on 18.12.2021.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet weak var firsrNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var agePersonLabel: UILabel!
    @IBOutlet weak var familePersonLabel: UILabel!
    @IBOutlet weak var aboutPersonLabel: UILabel!
    @IBOutlet weak var fotoPerson: UIImageView!
    
    @IBOutlet weak var titlePerson: UINavigationItem!
    
    var aboutPerson: Person?
   
    override func viewDidLoad() {
        super.viewDidLoad()

        firsrNameLabel.text = String(aboutPerson?.person.firstName ?? "")
        lastNameLabel.text = String(aboutPerson?.person.lastName ?? "")
        agePersonLabel.text = String(aboutPerson?.person.age ?? 0)+" год"
        familePersonLabel.text = String(aboutPerson?.family ?? "")
        aboutPersonLabel.text = String(aboutPerson?.person.about ?? "")
        fotoPerson.image = aboutPerson?.person.fotoPerson
        
        titlePerson.title = String(aboutPerson?.person.firstName ?? "") + " " + String(aboutPerson?.person.lastName ?? "")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVS = segue.destination as! MoreAboutViewController
        settingsVS.morePerson = aboutPerson
    }
}
