//
//  FullScreenView.swift
//  ClassWork24_BegiK
//
//  Created by M1 on 09.05.2024.
//

import UIKit

class FullScreenView: UIViewController {
    //MARK: Properties
    var viewModel: FullScreenViewModel
    
    var selectedIndex: Int = 0
    
    var selectedData: [Photos] = []
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    //MARK: Lifecycle
    init(viewModel: FullScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: Functions
    func setupUI() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        collectionView.register(FullScreenViewCustomCell.self, forCellWithReuseIdentifier: FullScreenViewCustomCell.identifier)
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}

//MARK: Extensions
extension FullScreenView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        selectedData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FullScreenViewCustomCell", for: indexPath) as? FullScreenViewCustomCell else {
            fatalError("Failed to dequeue MainPageViewCustomCell")
        }
        let selectedPhoto = selectedData[indexPath.item]
            
            // Load the image for the selected photo
            viewModel.loadImage { imageData in
                DispatchQueue.main.async {
                    if let imageData = imageData {
                        customCell.photoImageView.image = UIImage(data: imageData)
                    } else {
                        print("Failed to load image data.")
                    }
                }
            }
        
        return customCell
    }


}



extension FullScreenView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
    }
    
}

extension FullScreenView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
}
