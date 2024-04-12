//
//  StudentData.swift
//  ClassWork16_BegiK
//
//  Created by M1 on 12.04.2024.
//

import UIKit
enum Gender {
    case male, female
}

struct StudentData {
    var fullName: String
    var age: Int
    var gender: Gender
    var hobby: String
    var avatar: UIImageView
}

var students = [
    StudentData(fullName: "Nodar Ghachava", age: 28, gender: .male, hobby: "hiking in the caucasus mountains", avatar: UIImageView(image: UIImage(named: "maleavatar"))),
    StudentData(fullName: "Elene Donadze", age: 21, gender: .female, hobby: "collecting vintage georgian jewelry", avatar: UIImageView(image: UIImage(named: "femaleavatar"))),
    StudentData(fullName: "Temuri Chitashvili", age: 26, gender: .male, hobby: "developing open source software", avatar: UIImageView(image: UIImage(named: "maleavatar"))),
    StudentData(fullName: "Irina Datoshvili", age: 24, gender: .female, hobby: "practicing aerial silk dancing", avatar: UIImageView(image: UIImage(named: "femaleavatar"))),
    StudentData(fullName: "Tornike Elkanishvili", age: 27, gender: .male, hobby: "playing classical guitar", avatar: UIImageView(image: UIImage(named: "maleavatar"))),
    StudentData(fullName: "Ana Ioramashvili", age: 22, gender: .female, hobby: "writing short fantasy stories", avatar: UIImageView(image: UIImage(named: "femaleavatar"))),
    StudentData(fullName: "Nini Bardavelidze", age: 23, gender: .female, hobby: "studying marine biology", avatar: UIImageView(image: UIImage(named: "femaleavatar"))),
    StudentData(fullName: "Barbare Tepnadze", age: 25, gender: .female, hobby: "exploring minimalist baking", avatar: UIImageView(image: UIImage(named: "femaleavatar"))),
    StudentData(fullName: "Mariam Sreseli", age: 20, gender: .female, hobby: "learning new languages", avatar: UIImageView(image: UIImage(named: "femaleavatar"))),
    StudentData(fullName: "Valeri Mekhashishvili", age: 30, gender: .male, hobby: "competitive chess playing", avatar: UIImageView(image: UIImage(named: "maleavatar"))),
    StudentData(fullName: "Zuka Papuashvili", age: 24, gender: .male, hobby: "restoring classic cars", avatar: UIImageView(image: UIImage(named: "maleavatar"))),
    StudentData(fullName: "Nutsa Beriashvili", age: 24, gender: .female, hobby: "curating modern art exhibitions", avatar: UIImageView(image: UIImage(named: "femaleavatar"))),
    StudentData(fullName: "Luka Kharatishvili", age: 28, gender: .male, hobby: "documentary filmmaking", avatar: UIImageView(image: UIImage(named: "maleavatar"))),
    StudentData(fullName: "Data Robakidze", age: 27, gender: .male, hobby: "urban gardening", avatar: UIImageView(image: UIImage(named: "maleavatar"))),
    StudentData(fullName: "Nika Kakhniashvili", age: 29, gender: .male, hobby: "skydiving", avatar: UIImageView(image: UIImage(named: "maleavatar"))),
    StudentData(fullName: "Sandro Gelashvili", age: 25, gender: .male, hobby: "digital music production", avatar: UIImageView(image: UIImage(named: "maleavatar"))),
    StudentData(fullName: "Ana Namgaladze", age: 21, gender: .female, hobby: "photographing street fashion", avatar: UIImageView(image: UIImage(named: "maleavatar"))),
    StudentData(fullName: "Bakar Kharabadze", age: 30, gender: .male, hobby: "mountain biking", avatar: UIImageView(image: UIImage(named: "maleavatar"))),
    StudentData(fullName: "Archil Menabde", age: 27, gender: .male, hobby: "crafting handmade pottery", avatar: UIImageView(image: UIImage(named: "maleavatar"))),
    StudentData(fullName: "Tamuna Kakhidze", age: 22, gender: .female, hobby: "volunteering at animal shelters", avatar: UIImageView(image: UIImage(named: "femaleavatar"))),
    StudentData(fullName: "Giorgi Michitashvili", age: 23, gender: .male, hobby: "bird watching", avatar: UIImageView(image: UIImage(named: "maleavatar"))),
    StudentData(fullName: "Salome Topuria", age: 23, gender: .female, hobby: "yoga and meditation", avatar: UIImageView(image: UIImage(named: "femaleavatar"))),
    StudentData(fullName: "Luka Gujejiani", age: 29, gender: .male, hobby: "competitive video gaming", avatar: UIImageView(image: UIImage(named: "maleavatar"))),
    StudentData(fullName: "Gega Tatulishvili", age: 26, gender: .male, hobby: "exploring virtual reality tech", avatar: UIImageView(image: UIImage(named: "maleavatar"))),
    StudentData(fullName: "Raisa Badalova", age: 24, gender: .female, hobby: "ballet dancing", avatar: UIImageView(image: UIImage(named: "femaleavatar"))),
    StudentData(fullName: "Aleksandre Saroiani", age: 28, gender: .male, hobby: "astronomy and telescope making", avatar: UIImageView(image: UIImage(named: "maleavatar"))),
    StudentData(fullName: "Akaki Titberidze", age: 26, gender: .male, hobby: "kayaking in whitewater rivers", avatar: UIImageView(image: UIImage(named: "maleavatar"))),
    StudentData(fullName: "Sandro Kupatadze", age: 27, gender: .male, hobby: "scuba diving in the black sea", avatar: UIImageView(image: UIImage(named: "maleavatar"))),
    StudentData(fullName: "Gvantsa Gvagvalia", age: 22, gender: .female, hobby: "organic gardening", avatar: UIImageView(image: UIImage(named: "femaleavatar"))),
    StudentData(fullName: "Vano Kvakhadze", age: 24, gender: .male, hobby: "studying quantum physics", avatar: UIImageView(image: UIImage(named: "maleavatar")))
]
