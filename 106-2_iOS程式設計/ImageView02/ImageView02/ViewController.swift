import UIKit

class ViewController: UIViewController {
    
    var arrayName = ["img01", "img02", "img03", "img04", "img05", "img06"] // 儲存圖片名稱
    var arrayImage:Array<UIImage> = [] // 儲存圖片
    var count:Int = 0 // 儲存圖片總數量
    
    @IBOutlet weak var imageShow: UIImageView! // ImageView元件
    
    // 開始播放
    @IBAction func startClick(sender: UIButton) {
        imageShow.startAnimating()
    }
    
    // 結束播放
    @IBAction func endClick(sender: UIButton) {
        imageShow.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageShow.image=UIImage(named: "img01") // 開始時顯示第一張
        count = arrayName.count // 取得圖片總數
        
        for i in 0..<count {
            arrayImage.append(UIImage(named: arrayName[i])!)
        }
        
        imageShow.animationImages = arrayImage // 圖片來源
        imageShow.animationDuration = NSTimeInterval(count * 2) // 每2秒播放一張
        //imageShow.animationRepeatCount = 1 // 播放次數
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

