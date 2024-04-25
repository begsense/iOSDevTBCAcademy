//
//  MainPageView.swift
//  ClassWork21_BegiK
//
//  Created by M1 on 25.04.2024.
//

import UIKit

class MainPageView: UIViewController, MainPageViewModelDelegate {
    
    var viewModel: MainPageViewModel!
    
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
        viewModel = MainPageViewModel(itemModel: MainPageModel(), delegate: self)
        viewModel.getCountriesData()
    }
    
    //MARK: Functions
    
    func didUpdateCountries() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func addTitle() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Countries"
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton
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

extension MainPageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.countriesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentCountry = viewModel.countriesData[indexPath.row]
        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        customCell.setFlagImage(from: currentCountry.flags.png)
        customCell.name.text = currentCountry.name.common
        return customCell
    }
    
}

extension MainPageView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        let selectedDetails = viewModel.countriesData[indexPath.row]
        let detailsVC = DetailsPageViewModel()
        detailsVC.selectedDetails = selectedDetails
        navigationController?.pushViewController(detailsVC, animated: false)
    }
}

class CustomCell: UICollectionViewCell {
    
    //MARK: Properties:
    let mainView: UIView = {
        let mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.layer.cornerRadius = 15
        mainView.layer.borderWidth = 1.5
        return mainView
    }()
    
    var flag: UIImageView = {
        let flag = UIImageView()
        flag.image = UIImage(named: "flag")
        flag.translatesAutoresizingMaskIntoConstraints = false
        flag.widthAnchor.constraint(equalToConstant: 30).isActive = true
        flag.heightAnchor.constraint(equalToConstant: 20).isActive = true
        flag.layer.cornerRadius = 15
        return flag
    }()
    
    let name: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Georgia"
        name.textColor = .black
        name.font = UIFont(name: "SF Pro", size: 14)
        return name
    }()
    
    var symbol: UIImageView = {
        let symbol = UIImageView()
        symbol.image = UIImage(named: "symbol")
        symbol.translatesAutoresizingMaskIntoConstraints = false
        return symbol
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: SetupUI
    func setupUI() {
        addSubview(mainView)
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            mainView.heightAnchor.constraint(equalToConstant: 50)
        ])
        mainView.addSubview(flag)
        mainView.addSubview(name)
        mainView.addSubview(symbol)
        NSLayoutConstraint.activate([
            flag.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 24),
            flag.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            symbol.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -24),
            symbol.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            name.trailingAnchor.constraint(equalTo: symbol.leadingAnchor, constant: -5),
            name.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            name.widthAnchor.constraint(lessThanOrEqualToConstant: 220)
        ])
    }
    
    func setFlagImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data, let image = UIImage(data: data) else {
                print("Failed to load image:", error ?? "Unknown error")
                return
            }
            
            DispatchQueue.main.async {
                self?.flag.image = image
            }
        }
        
        task.resume()
    }
    
}

//#Preview {
//    MainPageView()
//}
