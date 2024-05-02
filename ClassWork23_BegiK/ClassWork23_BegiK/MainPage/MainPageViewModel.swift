//
//  MainPageViewModel.swift
//  ClassWork23_BegiK
//
//  Created by M1 on 02.05.2024.
//

import Foundation
import NetworkService

class MainPageViewModel {
    //MARK: Properties
    
    var catsFacts: [Facts] = [] {
        didSet {
            dataUpdated?()
        }
    }
    let urlString = "https://catfact.ninja/facts"
    var networkService = NetworkService()
    var numberOfFacts: Int {
        catsFacts.count
    }
    var dataUpdated: (() -> Void)?
    
    //MARK: Lifecycle:
    
    func didLoad() {
        getData()
    }
    
    //MARK: Functions
    
    private func getData() {
        networkService.getData(urlString: urlString) { (result: Result<FactsResponse, Error>) in
            switch result {
            case .success(let success):
                self.catsFacts = success.data
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
}
