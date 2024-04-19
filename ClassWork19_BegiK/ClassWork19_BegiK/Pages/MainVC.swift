//
//  MainVC.swift
//  ClassWork19_BegiK
//
//  Created by M1 on 19.04.2024.
//

import UIKit

class MainVC: UIViewController {
    
//MARK: Properties:
    var newsArray = [ImediNews]()
    
    let newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

//MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        addTitle()
        setupTableView()
        getImediNews()
    }

//MARK: Funcs
    func addTitle() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Fake News"
    }
    
    func setupTableView() {
        view.addSubview(newsTableView)
        newsTableView.register(CustomCellForTableView.self, forCellReuseIdentifier: "CustomCellForTableView")
        newsTableView.dataSource = self
        newsTableView.delegate = self
        newsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
        newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35).isActive = true
    }
 
    func getImediNews() {
        let urlString = "https://imedinews.ge/api/categorysidebarnews/get"
        let urlObject = URL(string: urlString)
        let urlRequest = URLRequest(url: urlObject!)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let responseData = data else {
                print("No data received")
                return
            }
            
            do {
                let newsData = try JSONDecoder().decode(ImediNewsList.self, from: responseData)
                let newData = newsData.List
                self.newsArray = newData
                DispatchQueue.main.async {
                    self.newsTableView.reloadData()
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }

    
}

//MARK: Extensions
extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentNews = newsArray[indexPath.row]
        let customCell = tableView.dequeueReusableCell(withIdentifier: "CustomCellForTableView", for: indexPath) as? CustomCellForTableView
        if let imageURLString = currentNews.PhotoUrl, let imageURL = URL(string: imageURLString) {
            URLSession.shared.dataTask(with: imageURL) { data, response, error in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        customCell?.backgroundView = UIImageView(image: image)
                        customCell?.backgroundView?.contentMode = .scaleAspectFill
                    }
                }
            }.resume()
        }
        // ეს ფოტოც უხდებოდა :დ სანამ ჯსონიდან დავსეტავდი ეგ მქონდა
//        customCell?.backgroundView = UIImageView(image: UIImage(named: "newsback"))
//        customCell?.backgroundView?.contentMode = .scaleAspectFill
        customCell?.newsTime.text = currentNews.Time
        customCell?.newsHeader.text = currentNews.Title
        return customCell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}

extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let selectedNews = newsArray[indexPath.row]
        let detailsVC = DetailsVC()
        detailsVC.selectedNews = selectedNews
        navigationController?.pushViewController(detailsVC, animated: false)
    }
}

//#Preview {
//    MainVC()
//}
