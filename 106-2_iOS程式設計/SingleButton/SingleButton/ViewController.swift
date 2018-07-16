import UIKit

class ViewController: UIViewController {
    @IBOutlet var textFieldName: UITextField! //連結姓名輸入欄位
    @IBOutlet var labelMsg: UILabel! //連結訊息欄位
    
    //建立按鈕 Touch Up Inside 事件
    @IBAction func sureClick(sender: UIButton) {
        if textFieldName.text != "" {
            labelMsg.text = (textFieldName.text)! + "，歡迎光臨！"
        } else {
            labelMsg.text = "必須輸入姓名！"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

