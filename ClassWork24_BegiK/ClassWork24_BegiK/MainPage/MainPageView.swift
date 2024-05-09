//
//  MainPageView.swift
//  ClassWork24_BegiK
//
//  Created by M1 on 09.05.2024.
//

import UIKit

class MainPageView: UIViewController {
    
    //MARK: Properties:
    var viewModel: MainPageViewModel
    
    let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumLineSpacing = 1
        collectionViewLayout.minimumInteritemSpacing = 1
        collectionViewLayout.itemSize = CGSize(width: 130, height: 135)
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 135, height: 135), collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    //MARK: Lifecycle:
    init(viewModel: MainPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.didLoad()
        reloadData()
    }
    
    //MARK: Functions
    func setupUI() {
        self.title = "გალერეა"
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MainPageViewCustomCell.self, forCellWithReuseIdentifier: "MainPageViewCustomCell")
        view.addSubview(collectionView)
        collectionView.backgroundColor = .none
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func reloadData() {
        viewModel.dataUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
}

    //MARK: Extensions
extension MainPageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfPhotos
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainPageViewCustomCell", for: indexPath) as? MainPageViewCustomCell else {
            fatalError("Failed to dequeue MainPageViewCustomCell")
        }
        viewModel.imageData(at: indexPath) { imageData in
            DispatchQueue.main.async {
                customCell.photoImageView.image = UIImage(data: imageData ?? Data())
            }
        }
        return customCell
    }
    
    
}

extension MainPageView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedPhoto = viewModel.photosArray[indexPath.item]
        let fullScreenViewModel = FullScreenViewModel(selectedPhoto: selectedPhoto)
        let fullScreenView = FullScreenView(viewModel: fullScreenViewModel)
        fullScreenView.selectedIndex = indexPath.row
        fullScreenView.selectedData = viewModel.photosArray
        navigationController?.pushViewController(fullScreenView, animated: false)
    }
}
