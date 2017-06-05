//
//  ViewController.swift
//  ProgramButton
//
//  Created by mojado on 2017/3/29.
//  Copyright © 2017年 VNU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTel: UILabel!
    @IBOutlet weak var labelMsg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for i in 0 ..< 12 {
            let x:Int = 90 + (i % 4) * 65
            let y:Int = 160 + (i / 4) * 65
            
            let buttonNumber:UIButton = UIButton(type: UIButtonType.System) as UIButton
            buttonNumber.frame = CGRect(x: x, y: y, width: 50, height: 50)
            buttonNumber.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            buttonNumber.backgroundColor = UIColor.blackColor()
            buttonNumber.titleLabel?.font = UIFont(name: "System", size: 22.0)
            
            if i == 10 {
                buttonNumber.setTitle("清除", forState: UIControlState.Normal)
                buttonNumber.addTarget(self, action: #selector(ViewController.clearClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            } else if i == 11 {
                buttonNumber.setTitle("確定", forState: UIControlState.Normal)
                buttonNumber.addTarget(self, action: #selector(ViewController.sureClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            } else {
                buttonNumber.setTitle("\(i)", forState: UIControlState.Normal)
                buttonNumber.addTarget(self, action: #selector(ViewController.numberClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            }
            
            view.addSubview(buttonNumber)
        }
    }
    
    func numberClick(sender:UIButton) {
        labelTel.text = labelTel.text! + sender.currentTitle!
    }
    
    func clearClick(sender:UIButton) {
        labelTel.text = ""
    }
    
    func sureClick(sender:UIButton) {
        if labelTel.text?.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) == 10 {
            labelMsg.text = "撥打電話：" + labelTel.text!
        } else {
            labelMsg.text = "必須輸入１０個數字！"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

