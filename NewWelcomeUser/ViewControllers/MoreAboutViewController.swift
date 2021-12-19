//
//  MoreAboutViewController.swift
//  NewWelcomeUser
//
//  Created by Александр Панин on 18.12.2021.
//

import UIKit

class MoreAboutViewController: UIViewController {

    @IBOutlet weak var bornCityLabel: UILabel!
    @IBOutlet weak var liveCityLabel: UILabel!
    @IBOutlet weak var loveCityLabel: UILabel!
    @IBOutlet weak var dreanCityLabel: UILabel!
    @IBOutlet weak var wantCityLabel: UILabel!
    
    @IBOutlet weak var hobbiesPersonLabel: UILabel!
    @IBOutlet weak var sportsPersonLabel: UILabel!
    @IBOutlet weak var musicPersonLabel: UILabel!
    
    var morePerson: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCity()
        hobbiesPersonLabel.text = (morePerson?.hobby ?? "")
        sportsPersonLabel.text = (morePerson?.sport ?? "")
        musicPersonLabel.text = (morePerson?.music ?? "")
    }
}
// MARK: - City controller

extension MoreAboutViewController {
    
    private func getCity() {
        guard let cityPerson = morePerson?.destination  else {return}
        for city in cityPerson {
            switch city.type {
            case .born:
                bornCityLabel.text = city.name.rawValue
            case .life:
                liveCityLabel.text = city.name.rawValue
            case .love:
                loveCityLabel.text = city.name.rawValue
            case .dream:
                dreanCityLabel.text = city.name.rawValue
            default:
                wantCityLabel.text = city.name.rawValue
            }
        }
    }
}
