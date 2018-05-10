//
//  ViewController.swift
//  ProgramButton
//
//  Created by Brian Wang on 2018/5/10.
//  Copyright © 2018年 Brian Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var labelTel:UILabel = UILabel()
    var labelMsg:UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        labelTel.frame = CGRect(x: 100, y: 80, width: 200, height: 30)
        labelTel.text = ""
        labelMsg.font = UIFont(name: "system", size: 24.0)
        labelTel.textColor = UIColor.white
        labelTel.textAlignment = NSTextAlignment.center
        labelTel.backgroundColor = UIColor.black
        
        view.addSubview(labelTel)

        labelMsg.frame = CGRect(x: 100, y: 320, width: 200, height: 30)
        labelMsg.text = ""
        labelMsg.font = UIFont(name: "system", size: 22.0)
        labelMsg.textColor = UIColor.red
        labelMsg.font.withSize(100)
        
        view.addSubview(labelMsg)
        
        for i in 0...11 {
            let x:Int = 90 + (i % 4) * 60
            let y:Int = 150 + (i / 4) * 50
            
            let btn:UIButton = UIButton(type: UIButtonType.system) as UIButton
            btn.frame = CGRect(x: x, y: y, width: 40, height: 40)
            btn.setTitleColor(UIColor.blue, for: UIControlState())
            btn.titleLabel?.font = UIFont(name: "system", size: 22.0)
            btn.backgroundColor = UIColor.yellow
            
            if i == 10 {
                btn.setTitle("清除", for: UIControlState())
                btn.addTarget(self, action: #selector(ViewController.clearClick(_:)), for: UIControlEvents.touchUpInside)
            } else if i == 11 {
                btn.setTitle("確定", for: UIControlState())
                btn.addTarget(self, action: #selector(ViewController.sureClick(_:)), for: UIControlEvents.touchUpInside)
            } else {
                btn.setTitle("\(i)", for: UIControlState())
                btn.addTarget(self, action: #selector(ViewController.numberClick(_:)), for: UIControlEvents.touchUpInside)
            }
            
            view.addSubview(btn)
        }
    }
    
    @IBAction func numberClick(_ sender: UIButton) {
        labelTel.text = labelTel.text! + sender.currentTitle!
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

