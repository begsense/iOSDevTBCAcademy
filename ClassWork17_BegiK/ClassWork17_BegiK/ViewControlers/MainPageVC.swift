//
//  MainVC.swift
//  ClassWork17_BegiK
//
//  Created by M1 on 14.04.2024.
//

import UIKit

class MainPageVC: UIViewController {
   
//MAKR: Properties:
    let backgroundImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "backgroundForLaunchScreen")
        image.contentMode = .scaleToFill
        return image
    }()
    
    let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumInteritemSpacing = 16
        collectionViewLayout.itemSize = CGSize(width: 156, height: 192)
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0/255, green: 117/255, blue: 255/255, alpha: 1.0)
        button.setTitle("ახალი წუწუნ ბარათის დამატება", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "FiraGO-BookItalic", size: 16)
        button.layer.cornerRadius = 15
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.widthAnchor.constraint(equalToConstant: 290).isActive = true
        return button
    }()
    
//MARK: DidLoad:
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        plusButtonAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
   
//MARK: SetupUI:
    func setupUI() {
        setupBackground()
        setupCollectionView()
        setupPlusButton()
    }
    
    func setupBackground() {
        navigationItem.hidesBackButton = true
        view.addSubview(backgroundImage)
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
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
            collectionView.heightAnchor.constraint(equalToConstant: 448)
        ])
    }
    
    func setupPlusButton() {
        view.addSubview(plusButton)
        NSLayoutConstraint.activate([
            plusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            plusButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -98)
        ])
    }
    
//MARK: Button functional
    func plusButtonAction() {
        let action = UIAction { [weak self] _ in
            self?.plusButtonNextPageGeneration()
        }
        plusButton.addAction(action, for: .touchUpInside)
    }
    
    func plusButtonNextPageGeneration() {
        let addNewCardVC = AddNewCardVC()
        self.navigationController?.pushViewController(addNewCardVC, animated: false)
    }

}

extension MainPageVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentCardIcon = cards[indexPath.row].icon
        let currentCardHeader = cards[indexPath.row].header
        let currentCardDescription = cards[indexPath.row].description
        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomCell
        customCell?.icon.image = UIImage(named: currentCardIcon ?? "icon1")
        customCell?.backgroundColor = UIColor(red: 38/255, green: 42/255, blue: 52/255, alpha: 1)
        customCell?.header.text = currentCardHeader
        customCell?.descr.text = currentCardDescription
        return customCell!
    }
    
}

extension MainPageVC: UICollectionViewDelegate {
    
}
