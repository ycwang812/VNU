//
//  ViewController.swift
//  ImageView01
//
//  Created by Brian Wang on 2018/5/17.
//  Copyright © 2018年 Brian Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageShow: UIImageView!
    
    var arrayImage = ["img01", "img02", "img03", "img04", "img05", "img06"]
    var p:Int = 0
    var count:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageShow.image = UIImage(named: arrayImage[p])
        count = arrayImage.count
    }

    @IBAction func prevClick(_ sender: UIButton) {
        p -= 1
        
        if p < 0 {
            p = count - 1
        }
        
        imageShow.image = UIImage(named: arrayImage[p])
    }
    
    @IBAction func nextClick(_ sender: UIButton) {
        p += 1
        
        if p == count {
            p = 0
        }
        
        imageShow.image = UIImage(named: arrayImage[p])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

