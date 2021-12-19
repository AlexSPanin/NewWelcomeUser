//
//  PersonAbout.swift
//  NewWelcomeUser
//
//  Created by Александр Панин on 18.12.2021.
//

import UIKit

struct Person {
    let person: PersonData
    let destination: [City]
    let hobby: String
    let sport: String
    let music: String
    let family: String
    
    static func getPerson() -> Person {
        Person(
            person: PersonData.getPersonData(),
            destination: City.getCity(
                born: .sverdlovsk,
                life: .moscow,
                love: .malta,
                dream: .paris,
                want: .rome
            ),
            hobby: RelationHobbies.getRelationHobbies(typeHobbies: .hobbies),
            sport: RelationHobbies.getRelationHobbies(typeHobbies: .sports),
            music: RelationHobbies.getRelationHobbies(typeHobbies: .genre),
            family: Family.getFamily(
                gender: .male,
                married: .yes
            )
        )
    }
}

// MARK: - About me status

struct PersonData {
    let userName: String
    let userPassword: String
    let firstName: String
    let lastName: String
    let age: Int
    let about: String
    let fotoPerson: UIImage
    
    static func getPersonData() -> PersonData {
            PersonData(
            userName: "Alex",
            userPassword: "123",
            firstName: "Александр",
            lastName: "Панин",
            age: 51,
            about: "Приехал в 1987 году учиться в Москву, закончил МГТУ им Баумана в 1993 году. Инженер Оптик. Четверо детей старшего зовут Марк 30 лет, младшему Захару 8 лет. В юнности программировал Фортран, Бейсик, Фортч, Ассемблер, Паскаль. Даже года 2 на это жил. Потом разный бизнес от торговли бытовой техники до алкоголя. Наигрался, хочу вернуться к истокам, которые нравяться. Любовь к Apple с конца 90х, еще помню iPod с диском и трэквилом.Из хобби дайвинг, видео съемка",
            fotoPerson: UIImage(named: "PersonFoto") ?? .add
            )
        
    }
}

// MARK: - Music, Hobby, Sport status

struct RelationHobbies {

    static func getRelationHobbies(typeHobbies: TypeHobbies) -> String {
        let hobbies = Hobby.getHobby()
        var favorite = "Мои любимые \(typeHobbies.rawValue):"
        var negative = "Мои не любимые:"
        var neutral = "Нейтрально отношение:"
   
        for item in hobbies {
            if item.typeHobby == typeHobbies {
                switch item.relation {
                case .favorite:
                    favorite += "\n\(item.name.rawValue)"
                case .negative:
                    negative += "\n\(item.name.rawValue)"
                default:
                    neutral += "\n\(item.name.rawValue)"
                }
            }
        }
        return "\(favorite)\n\(negative)\n\(neutral)"
    }
}

struct Hobby {
    let typeHobby: TypeHobbies
    let relation: Favorite
    let name: Hobbies
    
    static func getHobby() -> [Hobby] {
        [
            Hobby(typeHobby: .sports, relation: .favorite, name: .hockey),
            Hobby(typeHobby: .sports, relation: .favorite, name: .soccer),
            Hobby(typeHobby: .sports, relation: .neutral, name: .swimming),
            Hobby(typeHobby: .sports, relation: .neutral, name: .motoSport),
            Hobby(typeHobby: .sports, relation: .negative, name: .ski),
            Hobby(typeHobby: .sports, relation: .negative, name: .running),
            
            Hobby(typeHobby: .genre, relation: .favorite, name: .rock),
            Hobby(typeHobby: .genre, relation: .favorite, name: .hardrock),
            Hobby(typeHobby: .genre, relation: .neutral, name: .blues),
            Hobby(typeHobby: .genre, relation: .neutral, name: .classic),
            Hobby(typeHobby: .genre, relation: .negative, name: .hiphop),
            Hobby(typeHobby: .genre, relation: .negative, name: .jazz),
            
            Hobby(typeHobby: .hobbies, relation: .favorite, name: .audiocassett),
            Hobby(typeHobby: .hobbies, relation: .favorite, name: .vinyl),
            Hobby(typeHobby: .hobbies, relation: .favorite, name: .diving),
            Hobby(typeHobby: .hobbies, relation: .neutral, name: .mark),
            Hobby(typeHobby: .hobbies, relation: .negative, name: .book),
            Hobby(typeHobby: .hobbies, relation: .negative, name: .auto),
        ]
    }
}
 
enum TypeHobbies: String {
    case sports = "виды спорта"
    case hobbies = "увлечения"
    case genre = "жанры музыки"
}
enum Favorite: String {
    case favorite = "любимые"
    case negative = "не нравяться"
    case neutral = "нейтральные"
}
enum Hobbies: String {
    case auto = "Автомобили"
    case moto = "Мотоциклы"
    case diving = "дайвинг"
    case vinyl = "Виниловые пластинки"
    case book = "Книги"
    case tourism = "Туризм"
    case chess = "Шахматы"
    case mark = "Филателия"
    case audiocassett = "Аудиокассеты"
    case soccer = "Футбол"
    case running = "Бег"
    case bicycle = "Велосипед"
    case hockey = "Хоккей"
    case ski = "Лыжи"
    case motoSport = "Мотогонки"
    case autoSport = "Автогонки"
    case swimming = "Плаванье"
    case rock = "Рок"
    case jazz = "Джаз"
    case opera = "Опера"
    case classic = "Классика"
    case metal = "Металл"
    case hiphop = "Хип-Хоп"
    case blues = "Блюз"
    case hardrock = "Хард Рок"
    case rocknroll = "Рок-н-ролл"
}

// MARK: - City status

struct City {
    let type: TypeCity
    let name: NameCity
    
    static func getCity(
        born: NameCity,
        life: NameCity,
        love: NameCity,
        dream: NameCity,
        want: NameCity) ->  [City] {
            [
                City(type: .born, name: born),
                City(type: .life, name: life),
                City(type: .love, name: love),
                City(type: .dream, name: dream),
                City(type: .want, name: want)
            ]
        }
}
enum TypeCity {
    case born, life, love, dream, want
}
enum NameCity: String {
    case moscow = "Москва"
    case omsk = "Омск"
    case sverdlovsk = "Свердловск"
    case washington = "Вашингтон"
    case paris = "Париж"
    case rome = "Рим"
    case beijing = "Пекин"
    case malta = "Мальта"
}

// MARK: - marital status

struct Family {
    let gender: Gender
    let married: Status
    let aboutMarried: String
    
    static func getFamily (gender: Gender, married: Status) -> String {
        switch gender {
        case .male where married == .no:
            return "не женат"
        case .male where married == .yes:
            return "женат"
        case .female where married == .no:
            return "не замужем"
        default:
            return "замужем"
        }
    }
}
enum Gender {
    case male, female
}
enum Status {
    case yes, no
}
