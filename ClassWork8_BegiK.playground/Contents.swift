import Foundation
//
//შევქმნათ Class Book.
//Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.
//Designated Init.
//Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.
//Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.
class Book {
    let bookID: Int
    var title: String
    var author: String
    var isBorrowed: Bool
    
    init(bookID: Int, title: String, author: String, isBorrowed: Bool) {
        self.bookID = bookID
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    
    func BorrowBook () {
        self.isBorrowed = true
        print("წიგნი წაღებულია")
    }
    
    func unBorrowBook () {
        self.isBorrowed = false
        print("წიგნი დაბრუნებულია")
    }
}

//var test = Book(bookID: 22, title: "r", author: "22", isBorrowed: true)
//test.unBorrowBook()

//შევქმნათ Class Owner
//
//Properties: ownerId(უნიკალური იდენტიფიკატორი Int), String name, Books Array სახელით borrowedBooks.
//Designated Init.
//Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან.
//Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი.
class Owner {
    let ownerId: Int
    var name: String
    var borrowedBooks: [Book]
    
    init(ownerId: Int, name: String, borrowedBooks: [Book]) {
        self.ownerId = ownerId
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
    
    func canBorrowBook (book: Book) {
        borrowedBooks.append(book)
    }
    
    func returnBorrowedBook (book: Book) {
        for (i,value) in borrowedBooks.enumerated() {
            if value.bookID == book.bookID {
                borrowedBooks.remove(at: i)
            }
        }
    }
}

//
//შევქმნათ Class Library
//
//Properties: Books Array, Owners Array.
//Designated Init.
//Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით.
//Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს.
//Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს.
//Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს.
//Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს.
//Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ.
//Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.
class Library {
    var books = [Book]()
    var owners = [Owner]()
    
    init(books: [Book] = [Book](), owners: [Owner] = [Owner]()) {
        self.books = books
        self.owners = owners
    }
    
    func addBook (book: Book) {
        books.append(book)
    }
    
    func addOwner (owner: Owner) {
        owners.append(owner)
    }
    
    func availableBooks () -> [Book] {
        var availableBooks: [Book] = []
        for book in books {
            if book.isBorrowed == false {
                availableBooks.append(book)
            }
        }
        return availableBooks
    }
    
    func borrowedBooks () -> [Book] {
        var borrowedBooks: [Book] = []
        for book in books {
            if book.isBorrowed {
                borrowedBooks.append(book)
            }
        }
        return borrowedBooks
    }
    
    func checkOwnerByID (inputId: Int) -> Bool {
        var IsOwnerFoundByID = false
        for owner in owners {
            if owner.ownerId == inputId {
                IsOwnerFoundByID = true
                break
            }
        }
        return IsOwnerFoundByID
    }
    
    func borrowedBookByID (inputId: Int) -> String {
        var isOwnerFound = false
        var isBookBorrowed = ""
        for owner in owners {
            if owner.ownerId == inputId {
                isOwnerFound = true
                break
            }
        }
        if isOwnerFound {
            for book in books {
                if book.isBorrowed {
                    isBookBorrowed = "Owner-მა წაიღო \(book.title) წიგნი"
                    break
                }
            }
        }
        return isBookBorrowed
    }
    
    func borrowAvailableBook (inputId: Int, book: [Book]) -> Bool {
        var isBookAvailable = false
        if checkOwnerByID(inputId: inputId) {
            for val in book {
                if val.isBorrowed == false {
                    isBookAvailable = true
                    val.isBorrowed = true
                }
            }
        }
        return isBookAvailable
    }
}

//
//გავაკეთოთ ბიბლიოთეკის სიმულაცია.
//
//შევქმნათ რამოდენიმე წიგნი და რამოდენიმე Owner-ი, შევქმნათ ბიბლიოთეკა.
//დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში
//წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.
//დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.
//
var theAlchemist = Book(bookID: 1, title: "theAlchemist", author: "PauloCoelho", isBorrowed: false)
var harryPotter = Book(bookID: 2, title: "HarryPotter", author: "JRawling", isBorrowed: false)
var theHobbit = Book(bookID: 3, title: "TheHobbit", author: "JTolkien", isBorrowed: false)
var donaldTrump = Owner(ownerId: 1, name: "DonaldTrump", borrowedBooks: [] )
var sisonaDarchia = Owner(ownerId: 2, name: "SisonaDarchia", borrowedBooks: [] )
var vladimirPutin = Owner(ownerId: 3, name: "VladimirPutin", borrowedBooks: [] )
var library = Library()
library.addBook(book: theAlchemist)
library.addBook(book: harryPotter)
library.addBook(book: theHobbit)
library.addOwner(owner: donaldTrump)
library.addOwner(owner: sisonaDarchia)
library.addOwner(owner: vladimirPutin)

library.borrowAvailableBook(inputId: 1, book: [theAlchemist])
library.borrowAvailableBook(inputId: 1, book: [theHobbit])
donaldTrump.returnBorrowedBook(book: theHobbit)


var borrowedBooksArray = library.borrowedBooks()
var borrowedBooksDetails = borrowedBooksArray.map { "წაღებული წიგნ(ებ)ია: \($0.title) ავტორია: \($0.author)" }
for book in borrowedBooksDetails {
    print(book)
}

var availableBooks = library.availableBooks()
var availableBooksDetails = availableBooks.map { "ხელმისაწვდომი წიგნ(ებ)ია: \($0.title) ავტორია: \($0.author)" }
for book in availableBooksDetails {
    print(book)
}

var borrowedBookByID = library.borrowedBookByID(inputId: 1)
var borrowedBookByIDDetails = availableBooks.map { "მითითებული წაღებული წიგნ(ებ)ია: \($0.title) ავტორია: \($0.author)" }
for book in borrowedBookByIDDetails {
    print(book)
}
