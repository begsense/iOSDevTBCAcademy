
//while ციკლის გამოყენებით, 1-დან 20-მდე დაბეჭდეთ ყველა კენტი რიცხვის ნამრავლი.
var number = 1
var multiplied = 1
while number < 20 {
    if number % 2 == 1 {
        multiplied *= number
    }
    number += 1
}
print (multiplied)

//შექმენით String ტიპის ცვლადი და ციკლის გამოყენებით შემოაბრუნეთ ის, მაგ: თუ გვაქვს “Test” უნდა მივიღოთ “tseT”
var string = "Begi"
var changedString = ""
for rotate in string {
    changedString = "\(rotate)" + "\(changedString)"
}
print(changedString)

//while loop-ისა და switch statement-ის გამოყენებით შექმენით უსასრულო შუქნიშანი, რომელიც ბეჭდავს შემდეგნაირად. "🔴->🌕->🟢->🔴->🌕..."
var num = 1
while num < 4 {
    switch num {
    case 1:
        print ("🔴")
    case 2:
        print ("🌕")
    case 3:
        print ("🟢")
    default:
        print ("error")
    }
    num += 1
    if num == 4 {
        num = 1
    }
}

//Taylor Swift-ის კონცერტის ბილეთები იყიდება, თუმცა რაოდენობა ძალიან შეზღუდულია. While loop-ის მეშვეობით შექმენით ბილეთების გაყიდვის სიმულაცია და ყოველ გაყიდულ ბილეთზე დაბეჭდეთ “ბილეთი გაყიდულია, დარჩენილია მხოლოდ X რაოდენობა”, მანამ სანამ ბილეთების რაოდენობა მიაღწევს 0-ს, რის შემდეგაც ბეჭდავთ - “ყველა ბილეთი გაყიდულია გელოდებით კონცერტზე”
var amountOfTickets = 3
while amountOfTickets > 0 {
    print("ბილეთი გაყიდულია")
    amountOfTickets -= 1
    if amountOfTickets == 0 {
        print("ყველა ბილეთი გაყიდულია გელოდებით კონცერტზე")
    } else {
        print("დარჩენილია" + " \(amountOfTickets)" + " ბილეთი")
    }
}

//შექმენით array, შეავსეთ ისინი ელემენტებით. შეამოწმეთ და დაბეჭდეთ: "array-ში ყველა ელემენტი განსხვავებულია" ან "array შეიცავს მსგავს ელემენტებს"  (array-ს ტიპს არაქვს მნიშვნელობა.)
var array = [1, 2, 3, 5, 66]
var hasSameSymbol = false
for a in 0..<array.count {
    for b in a+1..<array.count {
        if array[a] == array[b] {
            hasSameSymbol = true
        }
    }
}
if hasSameSymbol {
    print("array შეიცავს მსგავს ელემენტებს")
} else {
    print("array-ს ტიპს არაქვს მნიშვნელობა.")
}

//დაწერეთ ქლოჟერი რომელიც გამოითვლის ორი რიცხვის სხვაობას და დააბრუნებს მიღებულ მნიშვნელობას
let closure: (Int, Int) -> Int = { (a, b) in
    return a - b
}
print (closure(10,5))

//დაწერეთ ფუნქცია, რომელსაც გადააწვდით String ტიპის პარამეტრს. დაითვალეთ ამ პარამეტრში თანხმოვნების რაოდენობა და დაბეჭდეთ ის.
func countConsonants(inputString: String) -> Int {
    var consonants = "bcdfghjklmnpqrstvwxyz"
    var consonantCount = 0
    
    for char in inputString {
        if consonants.contains(char) {
            consonantCount += 1
        }
    }
    
    return consonantCount
}
let inputStr = "begikopaliani"
print(countConsonants(inputString: inputStr))

//Oprtional:
//შექმენით ორი Int-ების array, შეავსეთ პირველი array 8, 4, 9, 9, 0, 2, და მეორე array 1, 0, 9, 2, 3, 7, 0, 1 ამ რიცხვებით. გააერთიანეთ ეს ორი array ერთ დასორტილ array-ში, ანუ შედეგი უნდა მიიღოთ ასეთი: 0, 0, 0, 1, 1, 2, 2, 3, 4, 7, 8, 9, 9, არ გამოიყენოთ sorted() ან რაიმე სხვა უკვე არსებული მეთოდი swift-იდან. დაბეჭდეთ მიღებული დასორტილი array.
var arrayA = [1, 2, 3, 4, 5]
var arrayB = [4, 5, 6, 7, 8]
var resultAllArray: [Int] = []
for name in arrayA {
    resultAllArray.append(name)
}
for name2 in arrayB {
    resultAllArray.append(name2)
}
print (resultAllArray)

//დაწერეთ ფუნქცია, რომელსაც გადააწვდით int ტიპის პარამეტრს. გამოითვალეთ ამ პარამეტრის ფაქტორიალი და დაბეჭდეთ
var resultFactorial = 1
func factorial(inputIntt: Int) -> Int {
    for nname in 1...inputIntt {
        resultFactorial *= nname
    }
    return resultFactorial
}

print(factorial(inputIntt: 4))

//შექმენით Int-ების array, შეავსეთ ის 0-იდან 10-ის ჩათვლით რიცხვებით. loop-ის  გამოყენებით დაშალეთ ეს array 2 array-იდ. ერთში გადაიტანეთ კენტი რიცხვები, მეორეში კი ლუწი რიცხვები, დაბეჭდეთ ორივე მიღებული array.
var newArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
var evenNumbers: [Int] = []
var oddNumbers: [Int] = []
for nnname in newArray {
    if nnname % 2 == 0 {
        evenNumbers.append(nnname)
    } else {
        oddNumbers.append(nnname)
    }
}
print("ლუწები: \(evenNumbers)")
print("კენტები: \(oddNumbers)")
