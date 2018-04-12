import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let labelTest:UILabel = UILabel() //建立元件
        labelTest.frame = CGRect(x: 60, y: 80, width: 240, height: 40) //設定位置及大小
        labelTest.text = "這是程式碼建立的元件" //設定顯示文字
        labelTest.textColor = UIColor.redColor() //文字為紅色
        view.addSubview(labelTest) //加入介面
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

