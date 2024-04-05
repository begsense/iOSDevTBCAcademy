//
//  ViewController.swift
//  ClassWork13_BegiK
//
//  Created by M1 on 05.04.2024.
//

import UIKit

struct Coffe {
    let productName: String
    let price: Double
    
    init(productName: String, price: Double) {
        self.productName = productName
        self.price = price
    }
}

class ViewController: UIViewController {
    var count = 1
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var heart: UIImageView!
    @IBOutlet weak var reviewsCount: UILabel!
    @IBOutlet weak var buy: UIButton!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var littleSizeCoffe: UIButton!
    @IBOutlet weak var middleSizeCoffe: UIButton!
    @IBOutlet weak var bigSizeCoffe: UIButton!
    @IBOutlet weak var price: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        image.layer.cornerRadius = 12
        buy.layer.cornerRadius = 12
        littleSizeCoffe.layer.cornerRadius = 12
        middleSizeCoffe.layer.cornerRadius = 12
        bigSizeCoffe.layer.cornerRadius = 12
        let tapped = UITapGestureRecognizer(target: self, action: #selector(heartAction))
            heart.isUserInteractionEnabled = true
            heart.addGestureRecognizer(tapped)
    }
    
    @IBAction func littleSize(_ sender: UIButton) {
        sender.backgroundColor = UIColor.gray
        price.text = "4.99ლ"
        middleSizeCoffe.backgroundColor = UIColor.white
        bigSizeCoffe.backgroundColor = UIColor.white
    }
    @IBAction func middleSize(_ sender: UIButton) {
        sender.backgroundColor = UIColor.gray
        price.text = "6.99ლ"
        littleSizeCoffe.backgroundColor = UIColor.white
        bigSizeCoffe.backgroundColor = UIColor.white
    }
    @IBAction func bigSize(_ sender: UIButton) {
        sender.backgroundColor = UIColor.gray
        price.text = "8.99ლ"
        middleSizeCoffe.backgroundColor = UIColor.white
        littleSizeCoffe.backgroundColor = UIColor.white
    }
    
    @objc func heartAction() {
        heart.tintColor = UIColor.red
        rating.text = "4.9"
        reviewsCount.text = "(231)"
        count += 1
    }
    
}

