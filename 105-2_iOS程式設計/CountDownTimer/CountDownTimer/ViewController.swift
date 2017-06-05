import UIKit

class ViewController: UIViewController {
    var timer:Timer? //定時執行變數
    var countTime:Int = 0 //倒數總秒數
    var countSec:Int = 0 //倒數時間的秒數部分
    
    @IBOutlet weak var buttonStart: UIButton! //開始鈕
    @IBOutlet weak var buttonStop: UIButton! //結束鈕
    @IBOutlet weak var datePicker: UIDatePicker! //DatePicker元件
    @IBOutlet weak var stepper: UIStepper! //Stepper元件
    @IBOutlet weak var labelSecond: UILabel! //顯示秒數
    @IBOutlet weak var labelMsg: UILabel! //顯示訊息
    @IBOutlet weak var labelZero: UILabel! //顯示 0分鐘
    
    @IBAction func stepperClick(_ sender: UIStepper) {
        labelSecond.text = "\(Int(stepper.value))" //顯示秒數
    }
    
    //按 倒數計時 鈕
    @IBAction func startClick(_ sender: UIButton) {
        labelZero.isHidden = true //不顯示 0分鐘
        buttonStop.isEnabled = true //停止 鈕有作用
        buttonStart.isEnabled = false //倒數計時 鈕無作用
        labelMsg.text = "" //清除訊息
        datePicker.isEnabled = false //不可選取時間
        stepper.isEnabled = false //不可設定秒數
        countSec = Int(stepper.value) //取得秒數部分
        countTime = Int(datePicker.countDownDuration) + countSec //計算總秒數
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true) //啟動定時執行
    }
    
    //定時執行函數
    func countDown() {
        countSec -= 1 //秒數部分減1
        countTime -= 1 //總秒數減1
        if countSec == -1 { //如果秒數部分需重置
            if countTime <= 0 { //時間到
                labelMsg.text = "時間到！" //顯示訊息
                stop() //停止計時
            } else { //重置秒數
                countSec = 59 //秒數部分設為59
                labelSecond.text = "\(countSec)"
                datePicker.countDownDuration = TimeInterval(countTime) //重置分鐘數
                if countTime < 60 { //如果在1分鐘內
                    labelZero.isHidden = false //顯示 0分鐘
                }
            }
        } else {
            labelSecond.text = "\(countSec)"
        }
    }
    
    //按 停止 鈕
    @IBAction func stopClick(_ sender: UIButton) {
        stop()
    }
    
    //停止計時
    func stop() {
        buttonStop.isEnabled = false //停止 鈕無作用
        buttonStart.isEnabled = true //倒數計時 鈕有作用
        labelZero.isHidden = true //不顯示 0分鐘
        datePicker.isEnabled = true //可選取時間
        stepper.isEnabled = true //可設定秒數
        stepper.value = 0 //設定秒數為0
        labelSecond.text = "0" //顯示0秒
        timer!.invalidate() //停止定時執行
        timer = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.datePickerMode = UIDatePickerMode.countDownTimer //倒數計時模式
        stepper.minimumValue = 0 //秒數設定最小值為 0
        stepper.maximumValue = 59 //秒數設定最大值為 59
        stepper.value = 0 //設定秒數為0
        labelSecond.text = "0" //顯示0秒
        buttonStop.isEnabled = false //停止 鈕無作用
        labelZero.isHidden = true //不顯示 0分鐘
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

