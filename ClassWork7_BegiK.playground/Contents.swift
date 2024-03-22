import Foundation

//შექმენით Enum-ი სახელით WeekDay შესაბამისი ქეისებით. დაწერეთ ფუნქცია რომელიც იღებს ამ ენამის ტიპს და ბეჭდავს გადაწოდებული დღე სამუშაოა თუ დასვენების.
enum WeekDay {
    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}

func workingDay (inputDay: WeekDay) {
    if inputDay == WeekDay.Saturday || inputDay == WeekDay.Saturday {
        print("დასვენების")
    } else {
        print("სამუშაო")
    }
}
workingDay(inputDay: WeekDay.Monday)

//შექმენით Enum-ი სახელად GialaSquad, რომელიც აღწერს გია სურამელაშვილის ფანკლუბის წევრების დონეებს ქეისებით : “TsigroviManto”, “MoshishvlebuliMkerdi”, “TuGapatio”. შექმენით ფროფერთი GialaSquad-ში, რომელსაც ექნება ინფორმაცია თუ რა ღირს თითოეული დონე თვეში (დონეები დალაგებულია ძვირიდან იაფისაკენ). დაუმატეთ მეთოდი რომელიც დაბეჭდავს თითოეული დონის ფასს
enum GialaSquad: Int {
    case TsigroviManto = 90
    case MoshishvlebuliMkerdi = 69
    case TuGapatio = 50
    static func eachPrice () {
        print("Tsigrovi Manto-ს ფასი არის: \(GialaSquad.TsigroviManto.rawValue)")
        print("Moshishvlebuli Mkerdi-ს ფასი არის: \(GialaSquad.MoshishvlebuliMkerdi.rawValue)")
        print("Tu Gapatio-ს გასი არის: \(GialaSquad.TuGapatio.rawValue)")
    }
}
GialaSquad.eachPrice()

//შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.
enum Weather {
    case Sunny(celsius: Int = 35)
    case Cloudy(celsius: Int = 25)
    case Rainy(celsius: Int = 10)
    case Snowy(celsius: Int = 1)
}

func recommendDress (input: Weather) {
    switch input {
    case .Sunny(_) :
        print ("ჩაიცვლი შორტები")
    case .Cloudy(_) :
        print ("შარვალი ჩაიცვი")
    case .Rainy(_) :
        print ("პალტო მოიცვი")
    case .Snowy(_) :
        print ("ორი პალტო და ხელთათმანები ჩაიცვი")
    }
}
recommendDress (input: Weather.Sunny(celsius: 35))

//შექმენით struct-ი Kanye, ფროფერთებით: album, releaseYear. ამის შემდეგ შექმენით array-ი Kanye-ს ტიპის, ჩაამატეთ რამოდენიმე Kanye-ს ობიექტი, და შეავსეთ მასივი კანიეებით. დაწერეთ ფუნქცია, რომელიც მიიღებს ამ კანიეების მასივს და წელს. ფუნქციამ უნდა დაგვიბრუნოს ყველა ალბომი რომელიც გამოშვებულია გადაწოდებული წლის შემდეგ და დაბეჭდოს ისინი.
    
struct Kanye {
    var album: String
    let releaseYear: Int
}
    
var kanye: [Kanye] = []
kanye.append(Kanye(album: "Late Registration", releaseYear: 2005))
kanye.append(Kanye(album: "Graduation", releaseYear: 2007))
kanye.append(Kanye(album: "Watch The Throne", releaseYear: 2011))
kanye.append(Kanye(album: "The Life of Pablo", releaseYear: 2016))

func kanyeAlbums(inputArray: [Kanye], inputDate: Int) {
    let albumsAfterInputDate = kanye.filter { kanye in
        kanye.releaseYear > inputDate
    }
    for albums in albumsAfterInputDate {
        print (albums.album)
    }
}
kanyeAlbums (inputArray: kanye, inputDate: 2007)
    
//შექმენით String-ის ტიპის lazy property wrapper სახელად, cachedData. ინიციალიზება გაუკეთეთ ქლოჟერით რომელიც აბრუნებს სტრინგს მნიშვნელობით “lazy ინიციალიზებულია”. მიწვდით ამ ფროფერთის და დაბეჭდეთ მისი მნიშვნელობა
@propertyWrapper
struct lazyPropertyWrapper {
    var wrappedValue: String
    lazy var cachedData: String = {
        return "lazy ინიციალიზებულია"
    }()
}

var myPropertyWrapper = lazyPropertyWrapper(wrappedValue: "")

let stringClosure: (String) -> String = { _ in
    var value = myPropertyWrapper
    return value.cachedData
}

print (stringClosure(""))

//Optional
//შექმენით Enum სახელად TarotCard და განსაზღვრეთ მასში 12 კარტის ქეისი.
//
//შექმენით სტატიკური მეთოდი TarotCard-ში რომელიც დააბრუნებს კარტს შერჩევითად
//
//შექმენით მეთოდი TarotCard-ში რომელიც დააბრუნებს კარტის აღწერას string-ის სახით
//
//შექმენით სტრუქტურა სახელად TarotReading. გაუწერეთ ფროფერთიები წარსული, აწმყო და მომავალი. გაუკეთეთ ინიციალიზაცია ამ ფროპერთიებს რათა მათ მიიღონ შერჩევითი ტაროს კარტის აღწერის მნიშვნელობა.
//
//შექმენით მეთოდი TarotReading-ში, რომელიც დაბეჭდავს ამ სამ არჩეულ ტაროს კარტს.

enum TarotCard {
    case Star
    case Empress
    case Tower
    case HangedMan
    case Chariot
    case Moon
    case Hierophant
    case Devil
    case Lovers
    case WheelOfFortune
    case Fool
    case Magician
    static func selectCard (inputCase: TarotCard) -> Any? {
        return inputCase
    }
    func descriptionOfCard (inputCard: TarotCard) -> String {
        switch inputCard {
        case .Star:
            "წარმოადგენს იმედს, შთაგონებას და სულიერ ხელმძღვანელობას. ეს ნიშნავს განახლებას, ოპტიმიზმს და მომავლის რწმენას."
        case .Empress:
            "განასახიერებს აღზრდას, სიუხვეს და დედობრივ ინსტინქტებს. ის წარმოადგენს ნაყოფიერებას, კრეატიულობას და ჰარმონიას ურთიერთობებში."
        case .Tower:
            "ნიშნავს უეცარ ცვლილებას, ქაოსს და განადგურებას. ის წარმოადგენს აჯანყებას, გამოცხადებას და ძველი სტრუქტურების ნგრევას ახალი წამოწყებისთვის."
        case .HangedMan:
            "წარმოადგენს მსხვერპლს, დანებებას და გაშვებას. ეს ნიშნავს შეჩერების, ახალი პერსპექტივების მოპოვებისა და თვითრეფლექსიის პერიოდს."
        case .Chariot:
            "ანასახიერებს ნებისყოფას, მონდომებას და გამარჯვებას. ის წარმოადგენს საკუთარ ცხოვრებაზე კონტროლის აღებას, მიზნების მიღწევას და დაბრკოლებების გადალახვას ფოკუსირებისა და სწრაფვის გზით."
        case .Moon:
            "აღნიშნავს ინტუიციას, ილუზიას და ქვეცნობიერ აზრებს. ის წარმოადგენს გაურკვევლობას, დაბნეულობას და აუცილებლობას, ენდოთ საკუთარ ინსტინქტებს უცნობისკენ ნავიგაციის დროს."
        case .Hierophant:
            "წარმოადგენს იმედს, შთაგონებას და სულიერ ხელმძღვანელობას. ეს ნიშნავს განახლებას, ოპტიმიზმს და მომავლის რწმენას."
        case .Devil:
            "განასახიერებს ცდუნებას, მონობასა და მატერიალიზმს. ის წარმოადგენს ადამიანის ბუნების ბნელ ასპექტებს, დამოკიდებულებას და შემზღუდველი რწმენებისა და ჩვევებისგან თავის დაღწევის აუცილებლობას."
        case .Lovers:
            "აღნიშნავს პარტნიორობას, არჩევანს და ჰარმონიას. ის წარმოადგენს სიყვარულს, მიზიდულობას და გადაწყვეტილების მიღების აუცილებლობას ღირებულებებზე და სხვებთან კავშირებზე დაყრდნობით."
        case .WheelOfFortune:
            "წარმოადგენს ბედს, ციკლებს და მოულოდნელ ცვლილებებს. ეს ნიშნავს იღბალს, შესაძლებლობებს და ცხოვრებისეული მოგზაურობის აღმავლობასა და ვარდნას, გვახსენებს, რომ ცვლილება გარდაუვალია."
        case .Fool:
            "განასახიერებს უდანაშაულობას, სპონტანურობას და ახალ წამოწყებებს. ეს წარმოადგენს რწმენის ნახტომს, თავგადასავლების მიღებას და სამყაროს ხელმძღვანელობისადმი ნდობას."
        case .Magician:
            "აღნიშნავს გამოვლინებას, ძალას და პოტენციალს. ის წარმოადგენს კრეატიულობას, უნარს და უნარს, იდეები რეალობად გარდაქმნას ორიენტირებული განზრახვისა და მოქმედების გზით."
        }
    }
}

struct TarotReading {
    var past: String
    var present: String
    var future: String
    
    init(past: String, present: String, future: String) {
        self.past = past
        self.present = present
        self.future = future
    }
}
