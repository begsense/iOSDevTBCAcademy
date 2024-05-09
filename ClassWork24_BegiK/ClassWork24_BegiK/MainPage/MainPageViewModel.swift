//
//  MainPageViewModel.swift
//  ClassWork24_BegiK
//
//  Created by M1 on 09.05.2024.
//

import Foundation
import NetworkService

class MainPageViewModel {
    //MARK: Properties
       
    var photosArray: [Photos] = [] {
        didSet {
            dataUpdated?()
        }
    }
    
    let urlString = "https://api.unsplash.com/photos/?per_page=100&client_id=HIwMaaVjIoAcnWVTrLFehroTDLZjhpn5k0l6ke-c3w8"
    
    var numberOfPhotos: Int {
        photosArray.count
    }
    
    var dataUpdated: (() -> Void)?
    
    var imageCache: [URL: Data] = [:]
    
    
    //MARK: Lifecycle:
    
    func didLoad() {
        getData()
    }
    
    //MARK: Functions
    
    private func getData() {
        NetworkService().getData(urlString: urlString) { (result: Result<[Photos], Error>) in
            switch result {
            case .success(let success):
                self.photosArray = success
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func imageData(at indexPath: IndexPath, completion: @escaping (Data?) -> Void) {
        let photo = photosArray[indexPath.item]
        guard let url = URL(string: photo.urls.regular) else {
            completion(nil)
            return
        }
        
        if let cachedData = imageCache[url] {
            completion(cachedData)
        } else {
            loadImage(at: indexPath) { [weak self] data in
                if let data = data {
                    self?.imageCache[url] = data
                }
                completion(data)
            }
        }
    }
    
    private func loadImage(at indexPath: IndexPath, completion: @escaping (Data?) -> Void) {
            let photo = photosArray[indexPath.item]
            guard let url = URL(string: photo.urls.regular) else {
                completion(nil)
                return
            }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil else {
                    print("Error fetching image: \(error?.localizedDescription ?? "Unknown error")")
                    completion(nil)
                    return
                }
                
                completion(data)
            }.resume()
        }
}
