import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageShow: UIImageView! // ImageView元件
    
    //按 框線 鈕
    @IBAction func borderClick(sender: UIButton) {
        imageShow.layer.borderColor = UIColor.redColor().CGColor // 框線顏色
        imageShow.layer.borderWidth = 5 // 框線粗細
    }
    
    // 按 圓角 鈕
    @IBAction func roundClick(sender: UIButton) {
        imageShow.layer.cornerRadius = 30 // 圓角角度
        imageShow.layer.masksToBounds = true // 圖層遮罩生效
    }
    
    // 按 陰影 鈕
    @IBAction func shadowClick(sender: UIButton) {
        imageShow.layer.shadowColor = UIColor.blueColor().CGColor // 陰影顏色
        imageShow.layer.shadowOffset = CGSizeMake(10, 10) // 陰影位移
        imageShow.layer.shadowOpacity = 0.8 // 陰影透明度
        imageShow.layer.shadowRadius = 5 // 陰影半徑
    }
    
    // 按 正常 鈕
    @IBAction func normalClick(sender: UIButton) {
        imageShow.layer.borderWidth = 0 // 移除框線
        imageShow.layer.cornerRadius = 0 // 移除圓角
        imageShow.layer.masksToBounds = false // 移除圖層遮罩
        imageShow.layer.shadowOpacity = 0 // 移除陰影
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageShow.image=UIImage(named: "img01") // 開始時顯示圖片
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

