//
//  DetailsVC.swift
//  ClassWork19_BegiK
//
//  Created by M1 on 19.04.2024.
//

import UIKit

class DetailsVC: UIViewController {
 
//MARK: Properties:
    var selectedNews: ImediNews?
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var newsTime: UILabel = {
        let newsTime = UILabel()
        newsTime.translatesAutoresizingMaskIntoConstraints = false
        newsTime.text = ""
        newsTime.textColor = .black
        newsTime.font = UIFont(name: "Arial", size: 16)
        newsTime.numberOfLines = 0
        return newsTime
    }()
    
    var newsHeader: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.text = ""
        description.font = UIFont(name: "Arial", size: 14)
        description.textColor = .black
        description.numberOfLines = 0
        return description
    }()
  
//MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        loadImageFromJSON()
    }
    
//MARK: Funcs
    func setupUI() {
        if let selectedNews = selectedNews {
            newsTime.text = selectedNews.Time
            newsHeader.text = selectedNews.Title
        }
        view.addSubview(imageView)
        view.addSubview(newsTime)
        view.addSubview(newsHeader)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36),
            imageView.heightAnchor.constraint(equalToConstant: 190),
            newsTime.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 26),
            newsTime.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            newsHeader.topAnchor.constraint(equalTo: newsTime.bottomAnchor, constant: 26),
            newsHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            newsHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36)
        ])
    }
    
    func loadImageFromJSON() {
        guard let urlString = selectedNews?.PhotoUrl, let url = URL(string: urlString) else {
            print("Photo URL is nil")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching image: \(error)")
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }.resume()
    }
    
}
