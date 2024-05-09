//
//  FullScreenViewModel.swift
//  ClassWork24_BegiK
//
//  Created by M1 on 09.05.2024.
//

import Foundation

class FullScreenViewModel {
    //MARK: Properties
    var selectedPhoto: Photos
    
    //MARK: Lifecycle
    init(selectedPhoto: Photos) {
        self.selectedPhoto = selectedPhoto
    }
    
    //MARK: Functions
    func loadImage(photo: Photos, completion: @escaping (Data?) -> Void) {
        guard let imageUrl = URL(string: photo.urls.regular) else {
            completion(nil)
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: imageUrl) { (data, response, error) in
            guard let imageData = data, error == nil else {
                print("Error fetching image:", error?.localizedDescription ?? "Unknown error")
                completion(nil)
                return
            }
            
            completion(imageData)
        }
        task.resume()
    }
}
