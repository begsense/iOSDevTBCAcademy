//
//  MainVC.swift
//  ClassWork20_BegiK
//
//  Created by M1 on 21.04.2024.
//

import UIKit

class MainVC: UIViewController {
    
//MARK: Properties
    let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumInteritemSpacing = 16
        collectionViewLayout.itemSize = CGSize(width: 327, height: 50)
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var countriesData: [country] = []

//MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        addTitle()
        setupCollectionView()
        getCountriesData()
    }

//MARK: Functions
    
    func addTitle() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Countries"
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton
    }
    
    func getCountriesData() {
        let urlString = "https://restcountries.com/v3.1/all"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        let session = URLSession.shared

        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                print("HTTP response status code indicates error: \(httpResponse.statusCode)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let responseData = try decoder.decode(countries.self, from: data)
                self.countriesData = responseData
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch {
                print("Error decoding response data: \(error)")
            }
        }

        task.resume()
    }

    func setupCollectionView() {
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
            view.addSubview(collectionView)
            collectionView.backgroundColor = .none
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 77),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -55)
            ])
        }
    
}

extension MainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        countriesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentCountry = countriesData[indexPath.row]
        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        customCell.setFlagImage(from: currentCountry.flags.png)
        customCell.name.text = currentCountry.name.common
        return customCell
    }
    
}

extension MainVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        let selectedDetails = countriesData[indexPath.row]
        let detailsVC = DetailsVC()
        detailsVC.selectedDetails = selectedDetails
        navigationController?.pushViewController(detailsVC, animated: false)
    }
}
