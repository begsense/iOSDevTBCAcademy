//
//  MainPageViewModel.swift
//  ClassWork22_BegiK
//
//  Created by M1 on 26.04.2024.
//

import Foundation

protocol MainPageViewModelDelegate: AnyObject {
    func didUpdateCountries(filteredCountriesParr: [MainPageModel.country])
}

class MainPageViewModel {

    //MARK: Properties:
    weak var delegate: MainPageViewModelDelegate?
    var countriesData: [MainPageModel.country] = []
    var filteredCountriesData: [MainPageModel.country] = []
        
    //MARK: Lifecycle
    func didLoad() {
        getCountries()
    }
    
    //MARK: Child Functions
    func getCountries() {
        getCountriesData()
    }
    
    func filterCountries(by searchText: String) {
        if searchText.isEmpty {
            filteredCountriesData = countriesData
        } else {
            filteredCountriesData = countriesData.filter { $0.name.common.lowercased().contains(searchText.lowercased()) }
        }
        delegate?.didUpdateCountries(filteredCountriesParr: filteredCountriesData)
    }
    
    //MARK: Private Functions

    private func getCountriesData() {
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
                let responseData = try decoder.decode([MainPageModel.country].self, from: data)
                self.countriesData = responseData
                self.filteredCountriesData = responseData
                    self.delegate?.didUpdateCountries(filteredCountriesParr: self.filteredCountriesData)
                
            } catch {
                print("Error decoding response data: \(error)")
            }
        }
        
        task.resume()
    }
    
}

