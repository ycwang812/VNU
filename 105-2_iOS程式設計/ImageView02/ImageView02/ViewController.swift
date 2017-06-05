//
//  ViewController.swift
//  ImageView02
//
//  Created by mojado on 2017/4/5.
//  Copyright © 2017年 VNU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var arrayName = ["img01", "img02", "img03", "img04", "img05", "img06"]
    var arrayImage:Array<UIImage> = []
    var count:Int = 0

    @IBOutlet weak var imageShow: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageShow.image = UIImage(named: "img01")
        count = arrayName.count
        
        for var i = 0; i < count; i++ {
            arrayImage.append(UIImage(named: arrayName[i])!)
        }
        
        imageShow.animationImages = arrayImage
        imageShow.animationDuration = NSTimeInterval(count * 2)
//        imageShow.animationRepeatCount = 0
    }

    @IBAction func startClick(sender: UIButton) {
        imageShow.startAnimating()
    }
    
    
    @IBAction func endClick(sender: UIButton) {
        imageShow.stopAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

