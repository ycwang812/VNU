import UIKit

class ViewController: UIViewController {
    var timer:Timer? //計時器
    var count:Int = 0 //計數
    
    @IBOutlet weak var progress: UIProgressView! //ProgressView元件
    @IBOutlet weak var labelMsg: UILabel! //顯示進度
    @IBOutlet weak var buttonStart: UIButton! //開始鈕
    
    //按 開始 鈕
    @IBAction func startClick(_ sender: UIButton) {
        buttonStart.isEnabled = false //讓 開始 鈕失效
        count = 0 //計數歸零
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.showProgress), userInfo: nil, repeats: true) //啟動計時器
    }
    
    //定時執行函數
    func showProgress() {
        progress.progress = Float(count) / 100 //設定進度
        labelMsg.text = "進度： \(count)%" //顯示進度
        count += 1 //進度加1
        if count > 100 { //若進度大於100就結束
            timer!.invalidate() //停止計時器
            timer = nil
            buttonStart.isEnabled = true //讓 開始 鈕有作用
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progress.frame.size.width = 280 //ProgressView元件寛度
        progress.progressTintColor = UIColor.red //進度顏色
        progress.trackTintColor = UIColor.green
        progress.progress = 0 //起始值為0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

