//
//  DetailsVC.swift
//  ClassWork20_BegiK
//
//  Created by M1 on 21.04.2024.
//

import UIKit
import SafariServices

extension UILabel {
    func createHighLabel(text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textColor = .black
        label.font = UIFont(name: "SF Pro", size: 16)
        label.heightAnchor.constraint(equalToConstant: 19).isActive = true
        return label
    }
}

extension UILabel {
    func createLowLabel(text: String, lines: Int) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textColor = .black
        label.font = UIFont(name: "SF Pro", size: 14)
        label.numberOfLines = lines
        return label
    }
}

class DetailsVC: UIViewController {
 
//MARK: Properties:
    var selectedDetails: country?
    
    let topView: UIView = {
        let topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        return topView
    }()
    
    var countryName: UILabel = {
        let countryName = UILabel()
        countryName.translatesAutoresizingMaskIntoConstraints = false
        countryName.text = "Georgia"
        countryName.textColor = .black
        countryName.font = UIFont(name: "SF Pro", size: 17)
        return countryName
    }()
    
    var aboutCountry = UILabel().createHighLabel(text: "About the flag:")
    
    var descriptionCountry = UILabel().createLowLabel(text: "description", lines: 0)
    
    var countryFlag: UIImageView = {
        let countryFlag = UIImageView()
        countryFlag.image = UIImage(named: "flag")
        countryFlag.translatesAutoresizingMaskIntoConstraints = false
        countryFlag.heightAnchor.constraint(equalToConstant: 228).isActive = true
        countryFlag.layer.shadowColor = UIColor.black.cgColor
        countryFlag.layer.shadowOpacity = 0.5
        countryFlag.layer.shadowOffset = CGSize(width: 0, height: 2)
        countryFlag.layer.shadowRadius = 4
        countryFlag.clipsToBounds = false
        countryFlag.layer.masksToBounds = false
        countryFlag.layer.cornerRadius = 15
        return countryFlag
    }()
    
    let topViewBottomLine: UIView = {
        let topViewBottomLine = UIView()
        topViewBottomLine.translatesAutoresizingMaskIntoConstraints = false
        topViewBottomLine.heightAnchor.constraint(equalToConstant: 1.5).isActive = true
        topViewBottomLine.backgroundColor = .black
        return topViewBottomLine
    }()
    
    let middleView: UIView = {
        let middleView = UIView()
        middleView.translatesAutoresizingMaskIntoConstraints = false
        middleView.heightAnchor.constraint(equalToConstant: 235).isActive = true
        return middleView
    }()
    
    var basicInfo = UILabel().createHighLabel(text: "Basic Information:")
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var nativeName = UILabel().createLowLabel(text: "Native name:", lines: 1)
    
    var nativeNameResult = UILabel().createLowLabel(text: "საქართველო", lines: 1)
    
    var spelling = UILabel().createLowLabel(text: "Spelling:", lines: 1)
    
    var spellingResult = UILabel().createLowLabel(text: "Sakartvelo", lines: 1)
    
    var capital = UILabel().createLowLabel(text: "Capital:", lines: 1)
    
    var capitalResult = UILabel().createLowLabel(text: "Tbilisi", lines: 1)
    
    var currency = UILabel().createLowLabel(text: "Currency:", lines: 1)
    
    var currencyResult = UILabel().createLowLabel(text: "Lari", lines: 1)
    
    var region = UILabel().createLowLabel(text: "Region:", lines: 1)
    
    var regionResult = UILabel().createLowLabel(text: "Europe", lines: 1)
    
    var neighbors = UILabel().createLowLabel(text: "Neighbors:", lines: 1)
    
    var neighborsResult = UILabel().createLowLabel(text: "ARM, AZE, TUR", lines: 1)
    
    let middleViewBottomLine: UIView = {
        let middleViewBottomLine = UIView()
        middleViewBottomLine.translatesAutoresizingMaskIntoConstraints = false
        middleViewBottomLine.heightAnchor.constraint(equalToConstant: 1.5).isActive = true
        middleViewBottomLine.backgroundColor = .black
        return middleViewBottomLine
    }()
    
    let bottomView: UIView = {
        let bottomView = UIView()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        return bottomView
    }()
    
    var usefulLinks = UILabel().createHighLabel(text: "Useful links:")
    
    let linksView: UIView = {
        let linksView = UIView()
        linksView.translatesAutoresizingMaskIntoConstraints = false
        linksView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        linksView.widthAnchor.constraint(equalToConstant: 187).isActive = true
        return linksView
    }()
    
    let link1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25
        return button
    }()
    
    let link1Img: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "link1")
        image.widthAnchor.constraint(equalToConstant: 31).isActive = true
        image.heightAnchor.constraint(equalToConstant: 31).isActive = true
        return image
    }()
    
    let link2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25
        return button
    }()
    
    let link2Img: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "link2")
        image.widthAnchor.constraint(equalToConstant: 31).isActive = true
        image.heightAnchor.constraint(equalToConstant: 31).isActive = true
        return image
    }()
    
  
//MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
//MARK: Funcs
    
    func setupUI() {
        setupTopView()
        loadImageFromJSON()
        updateDetailsFromAPI()
        setupMiddleView()
        setupBottomView()
        setupButtonActions()
    }
    
    func setupTopView() {
        if let selectedDetails = selectedDetails {
            countryName.text = selectedDetails.name.common
            countryFlag.image = UIImage(named: selectedDetails.flags.png)
            descriptionCountry.text = selectedDetails.flags.alt
        }
        view.addSubview(topView)
        topView.addSubview(countryName)
        topView.addSubview(countryFlag)
        topView.addSubview(aboutCountry)
        topView.addSubview(descriptionCountry)
        topView.addSubview(topViewBottomLine)
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            topView.heightAnchor.constraint(equalToConstant: 421),
            countryName.topAnchor.constraint(equalTo: topView.topAnchor, constant: 0),
            countryName.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            countryFlag.topAnchor.constraint(equalTo: countryName.topAnchor, constant: 29),
            countryFlag.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 0),
            countryFlag.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 0),
            aboutCountry.topAnchor.constraint(equalTo: countryFlag.bottomAnchor, constant: 25),
            aboutCountry.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            descriptionCountry.topAnchor.constraint(equalTo: aboutCountry.bottomAnchor, constant: 15),
            descriptionCountry.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            descriptionCountry.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -2),
            descriptionCountry.heightAnchor.constraint(lessThanOrEqualToConstant: 85),
            topViewBottomLine.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0),
            topViewBottomLine.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 8),
            topViewBottomLine.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -8)
        ])
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
                    self.countryFlag.image = image
                }
            }
        }.resume()
    }
    
    func setupMiddleView() {
        view.addSubview(middleView)
        middleView.addSubview(basicInfo)
        middleView.addSubview(scrollView)
        middleView.addSubview(middleViewBottomLine)
        NSLayoutConstraint.activate([
            middleView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            middleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            middleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            basicInfo.topAnchor.constraint(equalTo: middleView.topAnchor, constant: 24),
            basicInfo.leadingAnchor.constraint(equalTo: middleView.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: basicInfo.bottomAnchor, constant: 15),
            scrollView.leadingAnchor.constraint(equalTo: middleView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: middleView.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 143),
            middleViewBottomLine.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 20),
            middleViewBottomLine.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 8),
            middleViewBottomLine.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -8)
            
        ])
        setupScrollView()
    }
    
    func updateDetailsFromAPI() {
        if let nativeName = selectedDetails?.name.nativeName?["kat"]?.common {
            nativeNameResult.text = nativeName
        } else {
            nativeNameResult.text = "ვერ ვქენი"
        }
        
        if let altSpellings = selectedDetails!.altSpellings.first, altSpellings != selectedDetails!.name.official {
            spellingResult.text = altSpellings
        }
        
        capitalResult.text = selectedDetails?.capital?.first ?? ""
        
        if let currencies = selectedDetails?.currencies {
            let currencyCodes = [currencies.mdl?.name, currencies.usd?.name, currencies.eur?.name]
            let filteredCurrencyCodes = currencyCodes.compactMap { $0 }
            currencyResult.text = filteredCurrencyCodes.joined(separator: ", ")
        }
        
        regionResult.text = selectedDetails!.region.rawValue
        
        if let neighbors = selectedDetails?.borders {
            neighborsResult.text = neighbors.joined(separator: ", ")
        }
    }
    
    func setupScrollView() {
        scrollView.addSubview(nativeName)
        scrollView.addSubview(nativeNameResult)
        scrollView.addSubview(spelling)
        scrollView.addSubview(spellingResult)
        scrollView.addSubview(capital)
        scrollView.addSubview(capitalResult)
        scrollView.addSubview(currency)
        scrollView.addSubview(currencyResult)
        scrollView.addSubview(region)
        scrollView.addSubview(regionResult)
        scrollView.addSubview(neighbors)
        scrollView.addSubview(neighborsResult)
        
        NSLayoutConstraint.activate([
            nativeName.topAnchor.constraint(equalTo: scrollView.topAnchor),
            nativeName.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            nativeNameResult.trailingAnchor.constraint(equalTo: middleView.trailingAnchor),
            nativeNameResult.widthAnchor.constraint(lessThanOrEqualToConstant: 165),
            spelling.topAnchor.constraint(equalTo: nativeName.bottomAnchor, constant: 15),
            spelling.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            spellingResult.trailingAnchor.constraint(equalTo: middleView.trailingAnchor),
            spellingResult.widthAnchor.constraint(lessThanOrEqualToConstant: 165),
            spellingResult.topAnchor.constraint(equalTo: nativeNameResult.bottomAnchor, constant: 15),
            capital.topAnchor.constraint(equalTo: spelling.bottomAnchor, constant: 15),
            capital.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            capitalResult.trailingAnchor.constraint(equalTo: middleView.trailingAnchor),
            capitalResult.widthAnchor.constraint(lessThanOrEqualToConstant: 165),
            capitalResult.topAnchor.constraint(equalTo: spellingResult.bottomAnchor, constant: 15),
            currency.topAnchor.constraint(equalTo: capital.bottomAnchor, constant: 15),
            currency.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            currencyResult.trailingAnchor.constraint(equalTo: middleView.trailingAnchor),
            currencyResult.widthAnchor.constraint(lessThanOrEqualToConstant: 165),
            currencyResult.topAnchor.constraint(equalTo: capitalResult.bottomAnchor, constant: 15),
            region.topAnchor.constraint(equalTo: currency.bottomAnchor, constant: 15),
            region.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            regionResult.trailingAnchor.constraint(equalTo: middleView.trailingAnchor),
            regionResult.widthAnchor.constraint(lessThanOrEqualToConstant: 165),
            regionResult.topAnchor.constraint(equalTo: currencyResult.bottomAnchor, constant: 15),
            neighbors.topAnchor.constraint(equalTo: region.bottomAnchor, constant: 15),
            neighbors.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            neighborsResult.trailingAnchor.constraint(equalTo: middleView.trailingAnchor),
            neighborsResult.widthAnchor.constraint(lessThanOrEqualToConstant: 165),
            neighborsResult.topAnchor.constraint(equalTo: regionResult.bottomAnchor, constant: 15),
            neighbors.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            neighborsResult.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.addSubview(usefulLinks)
        bottomView.addSubview(linksView)
        linksView.addSubview(link1)
        linksView.addSubview(link2)
        link1.addSubview(link1Img)
        link2.addSubview(link2Img)
        
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: middleView.bottomAnchor, constant: 0),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            bottomView.heightAnchor.constraint(equalToConstant: 120),
            usefulLinks.topAnchor.constraint(equalTo: bottomView.topAnchor),
            usefulLinks.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            linksView.topAnchor.constraint(equalTo: usefulLinks.bottomAnchor, constant: 0),
            linksView.centerXAnchor.constraint(equalTo: middleView.centerXAnchor),
            link1.leadingAnchor.constraint(equalTo: linksView.leadingAnchor),
            link1.centerYAnchor.constraint(equalTo: linksView.centerYAnchor),
            link2.trailingAnchor.constraint(equalTo: linksView.trailingAnchor),
            link2.centerYAnchor.constraint(equalTo: linksView.centerYAnchor),
            link1Img.centerYAnchor.constraint(equalTo: link1.centerYAnchor),
            link1Img.centerXAnchor.constraint(equalTo: link1.centerXAnchor),
            link2Img.centerYAnchor.constraint(equalTo: link2.centerYAnchor),
            link2Img.centerXAnchor.constraint(equalTo: link2.centerXAnchor)
        ])
    }
    
    func setupButtonActions() {
        link1.addAction(UIAction { [weak self] _ in
            self?.openStreetMap()
        }, for: .touchUpInside)
        
        link2.addAction(UIAction { [weak self] _ in
            self?.openGoogleMap()
        }, for: .touchUpInside)
    }
    
    func openStreetMap() {
        openURLInSafari("https://www.openstreetmap.org/")
    }
    
    func openGoogleMap() {
        openURLInSafari("https://www.google.com/maps")
    }
    
    func openURLInSafari(_ urlString: String) {
        if let url = URL(string: urlString) {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        } else {
            print("Invalid URL: \(urlString)")
        }
    }
    
}
