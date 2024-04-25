//
//  DetailsPageView.swift
//  ClassWork21_BegiK
//
//  Created by M1 on 25.04.2024.
//

import UIKit

class DetailsPageViewModel {
    var countryDetails: CountryDetails?

    // Fetch country details from a service or local storage
    func fetchCountryDetails() {
        // Implement the logic to fetch details
    }

    // Handle user actions like opening a map link
    func openStreetMap() {
        openURLInSafari("https://www.openstreetmap.org/")
    }

    func openGoogleMap() {
        openURLInSafari("https://www.google.com/maps")
    }

    private func openURLInSafari(_ urlString: String) {
        // Implement opening URL
    }
}
