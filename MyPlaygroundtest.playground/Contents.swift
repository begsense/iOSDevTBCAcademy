import UIKit

/*
 
 {
    "List": [
            {
             "Title": "ანრი ოხანაშვილი „ნაცმოძრაობას“: თქვენ ხართ ჩვენი გმირი მებრძოლების მოღალატეების პარტია, ჩვენს გმირ მებრძოლებს და ჩვენს ქვეყანას ომის დაწყება დააბრალეთ. არის თუ არა ეს რუსული საქმე?",
             "Time": "18:41",
             "Url": "https://imedinews.ge/ge/politika/334130/anri-okhanashvili-natsmodzraobas-tqven-khart-chveni-gmiri-mebrdzolebis-mogalateebis-partia-chvens-gmir-mebrdzolebs-da-chvens-qvekanas-omis-datskeba-daabralet-aris-tu-ara-es-rusuli-saqme",
             "Type": 1,
             "PhotoUrl": "https://cdn.imedi.ge/new/imedinews/G/2404/01/73/67/53/XJBjnVTaXEqhqrzFla86tw/okhanashvilifb.jpg",
             "PhotoAlt": "ანრი ოხანაშვილი"
             },
            ]
 }
 */


struct ImediNews: Decodable {
    var Title: String?
    var Time: String?
    var Url: String?
    var PhotoUrl: String?
    var PhotoAlt: String?
}

struct ImediNewsList: Decodable {
    var List: [ImediNews]
}

func getImediNews() {
    let urlString = "https://imedinews.ge/api/categorysidebarnews/get"
    let urlObject = URL(string: urlString)
    let urlRequest = URLRequest(url: urlObject!)
    
    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        let newsData = try? JSONDecoder().decode(ImediNewsList.self, from: data!)
        let data = newsData?.List ?? []
        for rame in data {
            print (rame.Time ?? "")
        }
    }.resume()
}
getImediNews()
print ("kide wtd")
