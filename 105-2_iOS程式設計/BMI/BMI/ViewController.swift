//
//  ViewController.swift
//  BMI
//
//  Created by mojado on 2017/4/12.
//  Copyright © 2017年 VNU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var height: UITextField!
    
    @IBOutlet weak var weight: UITextField!
    
    @IBOutlet weak var sex: UISegmentedControl!
    
    @IBOutlet weak var respond: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func calculatorBMI(sender: UIButton) {
        if (height.text!.isEmpty) {
            respond.text = "請輸入身高"
            return
        }
        
        if (weight.text!.isEmpty) {
            respond.text = "請輸入體重"
            return
        }
        
        
        let h = Double(height.text!)
        let w = Double(weight.text!)
        let bmi  = w! / (h! * h!)
        
        var max: Double!
        var min: Double!
        
        switch sex.selectedSegmentIndex {
        case 0:
            max = 25
            min = 20
            break
        case 1:
            max = 22
            min = 18
            break
        default:
            break
        }
        
        if bmi > max {
            respond.text = "BMI結果：" + String(format:"%.2f", bmi) + " 您該少吃些，並多多運動"
        } else if bmi < min {
            respond.text = "BMI結果：" + String(format:"%.2f", bmi) + " 您該多吃點"
        } else {
            respond.text = "BMI結果：" + String(format:"%.2f", bmi) + " 體型很棒喔"
        }
    }
    
    @IBAction func clear(sender: UIButton) {
        height.text = ""
        weight.text = ""
        sex.selectedSegmentIndex = 0
        respond.text = "BMI結果："
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

