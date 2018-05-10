//
//  ViewController.swift
//  MultiButton
//
//  Created by Brian Wang on 2018/5/3.
//  Copyright © 2018年 Brian Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelMsg: UILabel!
    
    @IBOutlet weak var labelTel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        labelTel.text = ""
        labelMsg.text = ""
    }
    
    @IBAction func numberClick(_ sender: UIButton) {
        labelTel.text = labelTel.text! + sender.currentTitle!
//        labelTel.text! += sender.currentTitle!
        
        labelMsg.text = ""
    }
    
    @IBAction func clearClick(_ sender: UIButton) {
        labelTel.text = ""
        labelMsg.text = ""
    }
    
    @IBAction func sureClick(_ sender: UIButton) {
        if labelTel.text?.lengthOfBytes(using: String.Encoding.utf8) == 10 {
            labelMsg.text = "撥打電話：" + labelTel.text!
        } else {
            labelMsg.text = "必須輸入10碼電話號碼！"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

