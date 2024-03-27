import Foundation

//შექმენით ენამი Gender სადაც იქნება 2 გენდერი (გენდერზე არ გამომეკიდოთ, თუ გინდათ მეტი ჩაამატეთ)
enum Gender {
    case Male
    case Female
}

//შექმენით Protocol სახელად SuperBeing. გაუწერეთ მას ფროფერთები - name: String, strength: Int, speed: Int, weakness: String, gender: Gender
protocol SuperBeing {
    var name: String { get }
    var strength: Int { get }
    var speed: Int { get }
    var weakness: String { get }
    var gender: Gender { get }
}

//SuperBeing-ის strength-სა და speed-ს მიეცით default მნიშვნელობა
extension SuperBeing {
    var strength: Int {
        return 999
    }
    var speed: Int {
        return 9999
    }
}

//შექმენით კლასები Superhero და SuperVillain, დაუქონფორმეთ SuperBeing-ს.
//გაუწერეთ Superhero კლასს დამატებითი პარამეტრები outfitColor: String, equipment: String, vehicle: String
//გაუწერეთ Superhero კლასს მეთოდი - rescue, რომელიც პარამეტრად მიიღებს დაზარალებულის სახელს და დაბეჭდავს -
//“‘სუპერგმირის სახელი’ არ შეუშინდა სახიფათო სიტუაციას და ‘დაზარალებულის სახელი’ გადაარჩინა სიკვდილს” (მაგ: “ბეტმენი” არ შეუშინდა სახიფათო სიტუაციას და “გელა” გადაარჩინა სიკვდილს).
//გაუწერეთ Superhero კლასს მეთოდი - combat, რომელიც პარამეტრად მიიღებს Supervillain-ს და დაბეჭდავს -
//“‘სუპერგმირის სახელი’ შეერკინა და დაამარცხა ‘ბოროტმოქმედის სახელი’” (მაგ: “ბეტმენი” შეერკინა და დაამარცხა “ჯოკერი”)
//გაუწერეთ SuperVillain კლასს დამატებითი პარამეტრები evilScheme: String, obsession: String, rivalry: String
//გაუწერეთ SuperVillain კლასს მეთოდი - attack - რომელიც პარამეტრად მიიღებს Superhero-ს და დაბეჭდავს -
//“ბოროტმ. სახელი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “სუპერგმირის სახელი” მის შეჩერებას თუ შეძლებს” (მაგ: “ჯოკერი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “ბეტმენი” მის შეჩერებას თუ შეძლებს)
//გაუწერეთ SuperVillain კლასს მეთოდი experimentation - რომელიც პარამეტრად მიიღებს სტრინგს (subject) და დაბეჭდავს -
//“‘ბოროტმოქმედის სახელი’ ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად ‘მსხვერპლის სახელი’ აღმოჩნდა” (მაგ: “ჯოკერი” ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად “გელა” აღმოჩნდა)
class Superhero: SuperBeing {
    var name: String
    var weakness: String
    var gender: Gender
    var strength: Int
    var speed: Int
    var outfitColor: String
    var equipment: String
    var vehicle: String
    
    init(name: String, weakness: String, gender: Gender, strength: Int, speed: Int, outfitColor: String, equipment: String, vehicle: String) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
        self.strength = strength
        self.speed = speed
        self.outfitColor = outfitColor
        self.equipment = equipment
        self.vehicle = vehicle
    }
    
    func rescue(inputName: String) {
        print ("\(name) არ შეუშინდა სახიფათო სიტუაციას და \(inputName) გადაარჩინა სიკვდილს")
    }
    
    func combat(inputVillain: SuperVillain) {
        print ("\(name) შეერკინა და დაამარცხა \(inputVillain.name)")
    }
}

class SuperVillain: SuperBeing {
    var name: String
    var strength: Int
    var speed: Int
    var weakness: String
    var gender: Gender
    var evilScheme: String
    var obsession: String
    var rivalry: String
    
    init(name: String, strength: Int, speed: Int, weakness: String, gender: Gender, evilScheme: String, obsession: String, rivalry: String) {
        self.name = name
        self.strength = strength
        self.speed = speed
        self.weakness = weakness
        self.gender = gender
        self.evilScheme = evilScheme
        self.obsession = obsession
        self.rivalry = rivalry
    }
    
    func attack(inputHero: Superhero) {
        print ("\(name) გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა \(inputHero.name) მის შეჩერებას თუ შეძლებს”")
    }
    
    func experimentation(inputName: String) {
        print ("\(name) ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად \(inputName) აღმოჩნდა")
    }
}

//შექმენით მინიმუმ 5-5 ობიექტი თითოეული SuperBeing-ის დაქონფირმებული კლასებიდან
var khvichaKvaratskelia = Superhero(name: "Khvicha Kvaratskelia", weakness: "Defence", gender: Gender.Male, strength: 1000, speed: 999, outfitColor: "Red&White", equipment: "Ball", vehicle: "Mercedes GTR")
var giorgiMamardashvili = Superhero(name: "Giorgi Mamardashvili", weakness: "Dribling", gender: Gender.Male, strength: 1000, speed: 999, outfitColor: "Red&White", equipment: "Ball", vehicle: "Tesla Cybertruck")
var giorgiChakvetadze = Superhero(name: "Giorgi Chakvetadze", weakness: "Defence", gender: Gender.Male, strength: 1000, speed: 999, outfitColor: "Red&White", equipment: "Ball", vehicle: "Chevrolet Corvette")
var buduZivzivadze = Superhero(name: "Budu Zivzivadze", weakness: "Defence", gender: Gender.Male, strength: 2000, speed: 1129, outfitColor: "Red&White", equipment: "Ball", vehicle: "Mercedes Benz S Class")
var zurikoDavitashvili = Superhero(name: "Zuriko Davitashvili", weakness: "Defence", gender: Gender.Male, strength: 1000, speed: 999, outfitColor: "Red&White", equipment: "Ball", vehicle: "Chevrolet Camaro")

var sokhumskiMakho = SuperVillain(name: "Sokhumski Makho", strength: 100, speed: 500, weakness: "Narkata", gender: Gender.Male, evilScheme: "F*ck Girls", obsession: "сиски", rivalry: "Cops")
var shotaDarbaidze = SuperVillain(name: "Shota Darbaidze", strength: 10, speed: 20, weakness: "Money", gender: Gender.Male, evilScheme: "To be only beggar", obsession: "Guuleeebiiii", rivalry: "Other beggars")
var vladimirPutin = SuperVillain(name: "Vladimir Putin", strength: 0, speed: 0, weakness: "Fear", gender: Gender.Male, evilScheme: "Destroy Neighbors", obsession: "Wars and Bombs", rivalry: "Zelensky")
var ramzanKadirov = SuperVillain(name: "Ramzan Kadirov", strength: -100, speed: -500, weakness: "Wresling", gender: Gender.Male, evilScheme: "To be Chief of Caucasus", obsession: "DON DON DON", rivalry: "Zelensky")
var joker = SuperVillain(name: "Joker", strength: 1000, speed: 5000, weakness: "Ego", gender: Gender.Male, evilScheme: "Destroy Everybody", obsession: "Smile", rivalry: "Batman")

//Optional
func compareSwiftness<T: SuperBeing>(firstHero: T, secondHero: T) -> String {
    if firstHero.speed > secondHero.speed {
        return "\(firstHero.name) უფრო სწრაფია ვიდრე \(secondHero.name)"
    } else if firstHero.speed < secondHero.speed {
        return "\(secondHero.name) უფრო სწრაფია ვიდრე  \(firstHero.name)"
    } else {
        return "\(secondHero.name) და \(firstHero.name) თანაბარი სისწაფის არიან"
    }
}

print(compareSwiftness(firstHero: sokhumskiMakho, secondHero: shotaDarbaidze))
