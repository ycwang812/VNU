//
//  ViewController.swift
//  DatePicker
//
//  Created by Brian Wang on 2018/5/31.
//  Copyright © 2018年 Brian Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var labelMsg: UILabel!
    
    var dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        datePicker.datePickerMode = UIDatePickerMode.dateAndTime
        datePicker.locale = Locale(identifier: "zh_TW")
        datePicker.date = Date()
        dateFormatter.dateFormat = "西元y年M月d日 hh：mm：ss"
        labelMsg.text = dateFormatter.string(from: datePicker.date)
    }
    
    @IBAction func dateChange(_ sender: UIDatePicker) {
        labelMsg.text = dateFormatter.string(from: datePicker.date)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

