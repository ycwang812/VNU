//
//  ViewController.swift
//  MulitButton
//
//  Created by mojado on 2017/3/8.
//  Copyright © 2017年 VNU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTel: UILabel!
    @IBOutlet weak var labelMsg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func sureClick(sender: UIButton) {
        if labelTel.text?.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) == 10 {
            labelMsg.text = "撥打電話：" + labelTel.text!
        } else {
            labelMsg.text = "必須輸入１０個數字！"
        }
    }
    
    @IBAction func clearClick(sender: UIButton) {
        labelTel.text = ""
    }
    
    @IBAction func numberClick(sender: UIButton) {
        labelTel.text = labelTel.text! + sender.currentTitle!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

