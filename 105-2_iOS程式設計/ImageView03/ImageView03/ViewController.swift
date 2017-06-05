//
//  ViewController.swift
//  ImageView03
//
//  Created by mojado on 2017/4/6.
//  Copyright © 2017年 VNU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageShow: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageShow.image = UIImage(named: "img01")
    }

    @IBAction func borderClick(sender: UIButton) {
        imageShow.layer.borderColor = UIColor.redColor().CGColor
        imageShow.layer.borderWidth = 5
    }
    
    @IBAction func roundClick(sender: UIButton) {
        imageShow.layer.cornerRadius = 30
        imageShow.layer.masksToBounds = true
    }
    
    @IBAction func shadowClick(sender: UIButton) {
        imageShow.layer.shadowColor = UIColor.blueColor().CGColor
        imageShow.layer.shadowOffset = CGSizeMake(10, 10)
        imageShow.layer.shadowOpacity = 0.8
        imageShow.layer.shadowRadius = 5
    }
    
    @IBAction func normalClick(sender: UIButton) {
        imageShow.layer.borderWidth = 0
        imageShow.layer.cornerRadius = 0
        imageShow.layer.masksToBounds = false
        imageShow.layer.shadowOpacity = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

