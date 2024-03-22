import Foundation

//1)  დაწერეთ ფუნქცია რომელიც იღებს 2 პარამეტრს(სტრინგებს), და აბრუნებს Boolean ს თუ ეს ორი სტრინგი შედგება ერთიდაიგივე ასოებისგან, რიგითობას მნიშვნელობა არ აქვს.
//დიდ და პატარა ასოებსაც ვითვალისწინებთ.
//
//მაგ:
// "abc" და "bca" დააბრუნებს true
//"Abc" და "abc" აბრუნებს false. A და a სხვადასხვად ითვლება!
// 
//2) დაწერეთ ფუნქცია რომელიც მიიღებს და დააბრუნებს სტრინგს სადაც ზედმეტ სფეისებს მოაშორებს.
// 
//მაგ:
//"a[space][space][space]b[space]b[space][space][space]c" დააბრუნებს "a[space]b[space]c"
//"[space][space][space]a" დააბრუნებს "[space]a" ანუ 1 სფეისი ყოველთვის რჩება, ამ შემთხვევაში წინაც.
//3) დაწერეთ ფუნქცია რომელიც იღებს სტრინგს(ეს სტრინგი მოიცავს ასევე ციფრებს), გაფილტრეთ/მოაშორეთ ასოები და დარჩენილი ციფრების ჯამს აბრუნებთ.
// 
//მაგ:
//“a1b2c3” აბრუნებს 6  ანუ(1+2+3)
//“asdf10b20c30” აბრუნებს 60 ს  (10 + 20 + 30) და ა შ.

//1)
func sameStrings (firstString: String, secondString: String) -> Bool {
    firstString.sorted() == secondString.sorted()
}
print ( sameStrings (firstString: "abc", secondString: "bac") )

//2)
func deleteSpaces (inputString: String) -> String {
    var changedString = ""
    var preChar: Character = " "

    for char in inputString {
        if char != " " || preChar != " " {
            changedString.append(char)
        }
        preChar = char
    }

    return changedString
}

print ( deleteSpaces (inputString: "   hhaaaa   a       a") )

//3)
//func numbersInString (newString: String) -> Int {
//    var intArray: [Int] = []
//    for numbers in newString {
//        switch numbers {
//        case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0":
//            intArray.append(numbers)
//        default:
//            print("Have you done something new?")
//        }
//    }
//}
func challenge3(string: String) -> Int {
    var currentNumber = ""
    var sum = 0
    
    for letter in string {
        let strLetter = String(letter)
        
        if Int(strLetter) != nil {
            currentNumber += strLetter
        } else {
            sum += Int(currentNumber) ?? 0
            currentNumber = ""
        }
    }
    sum += Int(currentNumber) ?? 0
    return sum
}
