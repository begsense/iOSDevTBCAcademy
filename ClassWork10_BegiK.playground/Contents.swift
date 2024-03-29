import Foundation

//შექმენით ციკლური რეფერენცები და გაწყვიტეთ
//აუცილებელია ქლოჟერების გამოყენება
//აუცილებელია value და რეფერენს ტიების გამოყენება (კლასები, სტრუქტურები, ენამები და პროტოკოლები)
//აუცილებელია გამოიყენოთ strong, weak & unowned რეფერენსები ერთხელ მაინც
//დაიჭირეთ self ქლოჟერებში
//გატესტეთ მიღებული შედეგები ინსტანსების შექმნით და დაპრინტვით

class Profession {
    var name: String
    var history: String
    var established: Int
    weak var people: Person?
    
    init(name: String, history: String, established: Int, people: Person? = nil) {
        self.name = name
        self.history = history
        self.established = established
        self.people = people
    }
    
    deinit {
        print ("დეინიცირებულია \(name)")
    }
    
    func printProfessionName (closure: () -> Void) {
        print ("Prof name is \(name)")
    }
}

class Person {
    var name: String
    var birthYear: Int
    var fathersName: String
    var profession: Profession?
    
    init(name: String, birthYear: Int, fathersName: String, profession: Profession? = nil) {
        self.name = name
        self.birthYear = birthYear
        self.fathersName = fathersName
        self.profession = profession
    }
    
    deinit {
        print ("დეინიცირებულია \(name)")
    }
    
    func personsProfession() {
        profession?.printProfessionName { [weak self] in
            if let self = self {
                print("\(self.name) ს პროფესია არის")
            }
        }
    }
}

var footballer: Profession? = Profession(name: "football", history: "English game", established: 1863)
footballer = nil //ერთი რეფერენსი იყო და განილდა. მეორე რეფერენსი რომ გვქონოდა გარდა footballer ისა არ განილდებოდა
var footballer2: Profession? = Profession(name: "football", history: "English game", established: 1863)
var dima: Person? = Person(name: "დიმა", birthYear: 1993, fathersName: "ნოდარი")
footballer2?.people = dima
dima = nil // არ მოხხდა პერსონის დეინიციალიზაცია რადგან ყავდა ორი მიმთითებელი. ერთი footballer2.people  და მერე თავად dima
footballer2?.people = nil // პერსონ ობიექტზე მეორე მიმთითებელიც წავშალე და წაიშალა მეხსიერებიდან
footballer2 = nil // გავანილოთ ყველაფერი.
var basketballer: Profession? = Profession(name: "basketball", history: "US Game", established: 1986)
var gurami: Person? = Person(name: "Gurami", birthYear: 1969, fathersName: "Koka")
basketballer?.people = gurami
gurami?.profession = basketballer
//შევქმენი სტრონგ რეფერენსები და ორივე ობიექტს აქვს ორი მიმთითებელი . 
//დავამატე weak keyword და gurami?.profession = basketballer რეფერენსი აღარ მექნება strong
gurami = nil // Person კლასისგან შექმნილი ობიექტი გურამი დეინიცილებულია. რადგან აღარ ყავს 2 მიმთითებელი, ერთი გავანილეთ და მეორე არ იყო სტრონგ მიმთითებელი.

//ვცადოთ იგივე არარეფერენს ტიპზე მაგალითად სტრაქტზე
// არ გვამატებიებს მეორე კლასის ტიპს 79 და 98 ხაზზე. ვერ შეიქმნება ციკლი რადგან რეფერენს არ კეთდება სტრაქტში.
//
//struct Profession2 {
//    var name: String
//    var history: String
//    var established: Int
//    weak var people: Person2?
//    
//    init(name: String, history: String, established: Int, people: Person2? = nil) {
//        self.name = name
//        self.history = history
//        self.established = established
//        self.people = people
//    }
//    
//    
//    func printProfessionName (closure: () -> Void) {
//        print ("Prof name is \(name)")
//    }
//}
//
//struct Person2 {
//    var name: String
//    var birthYear: Int
//    var fathersName: String
//    var profession: Profession2?
//    
//    init(name: String, birthYear: Int, fathersName: String, profession: Profession2? = nil) {
//        self.name = name
//        self.birthYear = birthYear
//        self.fathersName = fathersName
//        self.profession = profession
//    }
//    
//   
//    
//    func personsProfession() {
//        profession?.printProfessionName {
//            print("\(self.name) ს პროფესია არის")
//        }
//    }
//}

//ვცადოთ ენამის შექმნა, ცვლადში გამოყენება და შემდეგ განილება (არ გამოვა)
enum Gender {
    case Male, Female
}

var Rolandi = Gender.Male
//Rolandi = nil ერორია
