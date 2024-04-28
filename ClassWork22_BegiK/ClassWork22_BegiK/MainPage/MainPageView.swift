//
//  MainPageView.swift
//  ClassWork22_BegiK
//
//  Created by M1 on 26.04.2024.
//

import UIKit
 
class MainPageView: UIViewController, UISearchBarDelegate {
    
    var viewModel = MainPageViewModel()
    let searchBar = UISearchBar()
    var countries = [MainPageModel.country]()
    
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
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        addTitle()
        setupCollectionView()
        setupSearchBar()
        viewModel.delegate = self
        viewModel.didLoad()
        checkLoginStatus()
    }
    
    //MARK: Functions
    
    func addTitle() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Countries"
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton
    }
    
    func setupSearchBar() {
        searchBar.placeholder = "Search by country"
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterCountries(by: searchText)
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
    
    func checkLoginStatus() {
        if UserDefaults.standard.bool(forKey: "firstTimeLogin") {
            let alert = UIAlertController(title: "კაი გამარჯობა", message: "კეთილი და პატიოსანი", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension MainPageView: MainPageViewModelDelegate {
    func didUpdateCountries(filteredCountriesParr: [MainPageModel.country]) {
        countries = filteredCountriesParr
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}



extension MainPageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentCountry = countries[indexPath.row]
        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        customCell.setFlagImage(from: currentCountry.flags.png)
        customCell.name.text = currentCountry.name.common
        customCell.backgroundColor = UIColor(named: "backgroundColor")
        return customCell
    }
    
}

extension MainPageView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        let selectedDetails = countries[indexPath.row]
        let detailsVC = DetailsPageView()
        detailsVC.selectedDetails = selectedDetails
        navigationController?.pushViewController(detailsVC, animated: false)
    }
}

