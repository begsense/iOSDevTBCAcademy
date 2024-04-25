//
//  DetailsPageView.swift
//  ClassWork21_BegiK
//
//  Created by M1 on 25.04.2024.
//

import UIKit

class DetailsPageViewModel {
    
    var view = DetailsPageView()
    var selectedDetails = DetailsPageView().selectedDetails
    
    func updateDetailsFromAPI() {
        if let nativeName = selectedDetails?.name.nativeName?["kat"]?.official {
            view.nativeNameResult.text = nativeName
        } else {
            view.nativeNameResult.text = "N/A"
        }
        
        if let altSpellings = selectedDetails!.altSpellings.first, altSpellings != selectedDetails!.name.official {
            view.spellingResult.text = altSpellings
        }
        
        view.capitalResult.text = selectedDetails?.capital?.first ?? ""
        
        if let currencies = selectedDetails?.currencies {
            let currencyCodes = [currencies.mdl?.name, currencies.usd?.name, currencies.eur?.name]
            let filteredCurrencyCodes = currencyCodes.compactMap { $0 }
            view.currencyResult.text = filteredCurrencyCodes.joined(separator: ", ")
        }
        
        view.regionResult.text = selectedDetails!.region.rawValue
        
        if let neighbors = selectedDetails?.borders {
            view.neighborsResult.text = neighbors.joined(separator: ", ")
        }
    }
    
    func loadImageFromJSON() {
        guard let urlString = selectedDetails?.flags.png, let url = URL(string: urlString) else {
            print("Photo URL is nil")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching image: \(error)")
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.view.countryFlag.image = image
                }
            }
        }.resume()
    }
    
}
