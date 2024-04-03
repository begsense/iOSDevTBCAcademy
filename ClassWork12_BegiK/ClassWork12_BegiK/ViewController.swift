//
//  ViewController.swift
//  ClassWork12_BegiK
//
//  Created by M1 on 03.04.2024.
//

import UIKit

//iPhone 15 Pro ზე გავტესტე

class ViewController: UIViewController {
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var isSwitch: UISwitch!
    @IBOutlet weak var input1: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var input2: UITextField!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        calculateResult ()
    }
    
    @IBAction func SwitchAction(_ sender: UISwitch) {
        if !sender.isOn {
            header.text = "უმცირესი საერთო ჯერადი"
            button.backgroundColor = UIColor.lightGray
        } else {
            header.text = "უდიდესი საერთო გამყოფი"
            button.backgroundColor = UIColor.blue
        }
        calculateResult ()
    }
    
    func calculateResult() {
        guard let text1 = input1.text, let number1 = Int(text1),
              let text2 = input2.text, let number2 = Int(text2) else {
            result.text = "არ გაქვთ ორი რიცხვი შეყვანილი"
            input1.backgroundColor = UIColor.red
            input2.backgroundColor = UIColor.red
            return
        }
        
        input1.backgroundColor = UIColor.white
        input2.backgroundColor = UIColor.white

        if isSwitch.isOn {
            let usg = calcUSG(number1: number1, number2: number2)
            result.text = "უსგ: \(usg)"
        } else {
            let usj = calcUSJ(number1: number1, number2: number2)
            result.text = "უსჯ: \(usj)"
        }
        
        
    }
    
    func calcUSG(number1: Int, number2: Int) -> Int {
        var a = number1
        var b = number2
        while b != 0 {
            let someVar = b
            b = a % b
            a = someVar
        }
        return abs(a)
    }

    func calcUSJ(number1: Int, number2: Int) -> Int {
        return abs (number1*number2) / calcUSG(number1: number1, number2: number2)
    }
    
}

