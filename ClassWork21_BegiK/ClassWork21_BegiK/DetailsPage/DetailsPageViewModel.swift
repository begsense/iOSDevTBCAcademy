////
////  DetailsPageViewModel.swift
////  ClassWork21_BegiK
////
////  Created by M1 on 25.04.2024.
////
//
//import UIKit
//
//protocol DetailsPageViewModelDelegate: AnyObject {
//    func imageLoad(_ countryFlag: UIImage)
//}
//
//class DetailsPageViewModel {
//    
//    var selectedDetails: MainPageModel.country?
//    var viewDetails = DetailsPageView()
//    
//    func viewDidLoad() {
//        loadImageFromJSON()
//    }
//    
//    private func loadImageFromJSON() {
//        guard let urlString = selectedDetails?.flags.png, let url = URL(string: urlString) else {
//            print("Photo URL is nil")
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            if let error = error {
//                print("Error fetching image: \(error)")
//                return
//            }
//            
//            if let data = data, let image = UIImage(data: data) {
//                DispatchQueue.main.async {
//                    self.viewDetails.countryFlag.image = image
//                }
//            }
//        }.resume()
//    }
//}
