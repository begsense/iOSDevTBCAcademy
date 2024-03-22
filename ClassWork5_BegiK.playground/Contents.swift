import Foundation

//დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს String-ს და დააბრუნებს ბულიანს. ფუნქციამ უნდა შეამოწმოს მიღებული სტრინგი სარკისებურია თუ არა (სიტყვა ან წინადადება რომელიც იკითხება ერთნაირად როგორც თავიდან, ისე ბოლოდან მაგ: “ანა”, “აირევი ივერია”, “მადამ”)
func function1 (inputString: String) -> Bool {
    let reversedInputString = String(inputString.reversed())
    if inputString == reversedInputString {
        return true
    } else {
        return false
    }
}
print(function1 (inputString: "buuub") )

//დაწერეთ ფუნქცია რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.
var multipliedInt = 1
var multipliedArray: [Int] = []
func function2 (array: [Int]) -> [Int] {
    for name in 0...array.count - 1 {
        multipliedInt = array[name] * array[name]
        multipliedArray.append(multipliedInt)
    }
    return multipliedArray
}
print(function2 (array: [1, 2, 3, 4]) )

//დაწერეთ Closure რომელიც გაფილტრავს ლუწ რიცხვებს Int-ების Array-დან.
var evenArray: [Int] = []
let closure: ([Int]) -> [Int] = { (array3: [Int]) in
    for index in array3 {
        if index % 2 == 0 {
            evenArray.append(index)
        }
    }
    return evenArray
 }
print(closure([1, 2, 3, 4, 5, 6]))

//დაწერეთ ფუნქცია, რომელიც პარამეტრად იღებს Int-ების მასივს. Escaping closure-ის მეშვეობით დაბეჭდეთ მიწოდებული მასივის ჯამი 5 წამის შემდეგ. დარწმუნდით რომ closure არის escaping და გამოიძახეთ ის მას შემდეგ რაც ფუნქცია დაბრუნდება.
let startingClosure: ([Int]) -> Void = { arrayN in
    var sum = 0
    for index in arrayN {
        sum += index
    }
    print("Sum of the array is: \(sum)")
}

func sumFunction(arraySum: [Int], closureSumOfArray: @escaping ([Int]) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        closureSumOfArray(arraySum)
    }
}

sumFunction(arraySum: [1, 2, 3, 4], closureSumOfArray: startingClosure)

//შექმენით  კონტაქტების Dict სადაც key არის სახელი და value ტელეფონის ნომერი, დაამატეთ, დაბეჭდეთ/მოძებნეთ და წაშალეთ კონტაქტი
var dict = [
    "David": "599122233",
    "Levan": "591922133",
    "Donald": "597182256",
    "Giorgi": "593822233",
]
print(dict)
dict.removeValue(forKey: "Donald")
print(dict)

//დაწერეთ ფუნქცია რომელიც პარამეტრად იღებს [String: Int] ტიპის Dictionary-ს და დააბრუნებს ანბანურად დალაგებულ dictionary-ს key ელემენტების მასივს.
func dictFunction (parm: [String: Int]) -> [String] {
    var returnArray: [String] = []
    for (ind,_) in parm {
        returnArray.append(ind)
    }
    return returnArray.sorted()
}
print (dictFunction(parm: ["bbbarraaa": 12, "akiii": 13]))

//შექმენით Double-ების მასივი, შეავსეთ ის თქვენთვის სასურველი რიცხვებით.  loop-ის გამოყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ მასივში და დაბეჭდეთ.
var doublesMassive: [Double] = [33.22, 77.11, 1.22, 333.1]
var biggestNumber: Double = 0
for iii in doublesMassive {
    if iii > biggestNumber {
        biggestNumber = iii
    }
}
print (biggestNumber)

//Optional:
//მოცემულია Dictionary სადაც წარმოდგენილია ლელა წურწუმიას სიმღერებისა და მათი ხანგრძლივობა(წმ) მონაცემები:
let lelaWhatMovementIsThis: [String: Int] = [
    "ღამის “სიჩუმე გაფანტე": 235,
    "ვიხსენებ ყველაფერს თავიდან": 219,
    "სულელი წვიმა": 231,
    "ალალ მე": 231,
    "იდუმალი ღამე": 221,
    "ჩუმად ნათქვამი": 199,
    "თეთრი ქარავანი": 221,
    "ძველი ვერხვები": 193
]
//დაწერეთ ფუნქცია რომელიც გამოითვლის და დაბეჭდავს სიმღერების ჯამურ ხანგრძლივობას წუთებში და წამებში
func durationOfSongs (dict: [String: Int]) {
    var sumOfTime = 0
    for (_,value) in dict {
        sumOfTime += value
    }
    print ( "songs duration in seconds is \(sumOfTime) and in minutes is \(sumOfTime/60)" )
}
durationOfSongs (dict: lelaWhatMovementIsThis)

//დაწერეთ ფუნქცია რომელიც იპოვის და დაბეჭდავს ყველაზე ხანგრძლივი და ხანმოკლე სიმღერის სახელს.
func longAndShortSongs (dict: [String: Int]) {
    var longSong = 0
    var shortSong = 9999
    var longSongName = ""
    var shortsongName = ""
    for (key,value2) in dict {
        if value2 > longSong {
            longSong = value2
            longSongName = key
        }
        if value2 < shortSong {
            shortSong = value2
            shortsongName = key
        }
    }
    print ( "Long song is \(longSongName) and short song is \(shortsongName)" )
}
longAndShortSongs (dict: lelaWhatMovementIsThis)

//დაწერეთ ფუნქცია რომელიც გამოითვლის სიმღერების საშუალო ხანგრძლივობას
func averageDurationOfSongs (dict: [String: Int]){
    var sumOfTime2 = 0.0
    for (_,value) in dict {
        sumOfTime2 += Double(value)
    }
    print ( Double(sumOfTime2)  / Double(dict.count) )
}
averageDurationOfSongs(dict: lelaWhatMovementIsThis)

//დაწერეთ ფუნქცია რომელიც შემთხვევითად ამოარჩევს სიმღერას და დაბეჭდავს მის სახელს
func randomSongFromList(dict: [String: Int]) {
    var randomSong = dict.randomElement()
    print (randomSong?.key ?? "მონაცემები ცარიელია")
}
randomSongFromList(dict: lelaWhatMovementIsThis)
