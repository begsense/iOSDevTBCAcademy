//
//  DetailsPageViewModel.swift
//  ClassWork22_BegiK
//
//  Created by M1 on 28.04.2024.
//

import Foundation

class DetailsPageViewModel {
    
    //MARK: Properties:
    private var selectedDetails: MainPageModel.country?
    var commonCountryNameTitle: String {
        selectedDetails?.name.common ?? ""
    }
    
    var countryFlagName: String {
        selectedDetails?.flags.png ?? ""
    }
    
    var descriptionText: String {
        selectedDetails?.flags.alt ?? ""
    }
    
    var nativeName: String {
        selectedDetails?.name.nativeName?["kat"]?.official ?? "N/A"
    }
    
    var spellingText: String {
        selectedDetails?.name.official ?? ""
    }
    
    var capitalName: String {
        selectedDetails?.capital?.first ?? ""
    }
    
    var currencyCodes: String {
        guard let currencies = selectedDetails?.currencies else {
            return ""
        }
        
        let currencyNames = [
            currencies.mdl?.name,
            currencies.usd?.name,
            currencies.eur?.name
        ]
        
        let filteredCurrencyNames = currencyNames.compactMap { $0 }
        return filteredCurrencyNames.joined(separator: ", ")
    }
    
    var regionResult: String {
        selectedDetails?.region.rawValue ?? ""
    }
    
    var neighborCountries: String {
        guard let neighbors = selectedDetails?.borders else {
            return ""
        }
        
        return neighbors.joined(separator: ", ")
    }
    
    init(selectedDetails: MainPageModel.country? = nil) {
        self.selectedDetails = selectedDetails
    }
    
}
