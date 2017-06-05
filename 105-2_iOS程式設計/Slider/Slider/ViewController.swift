import UIKit

class ViewController: UIViewController {
    var imgWidth:CGFloat = 0 //圖片寬度
    var imgHeight:CGFloat = 0 //圖片高度
    
    @IBOutlet weak var switchPhoto: UISwitch! //Switch元件
    @IBOutlet weak var image: UIImageView! //ImageView元件
    @IBOutlet weak var sliderPhoto: UISlider! //slider元件
    @IBOutlet weak var labelMsg: UILabel! //顯示圖片大小
    
    //Switch元件On時才可改變圖形大小
    @IBAction func switchChange(_ sender: UISwitch) {
        if switchPhoto.isOn {
            sliderPhoto.isEnabled = true
        } else {
            sliderPhoto.isEnabled = false
        }
    }
    
    //拖曳Slider元件改變圖形大小
    @IBAction func sliderChange(_ sender: UISlider) {
        if switchPhoto.isOn {
            image.frame.size.width = imgWidth * CGFloat(sliderPhoto.value)
            image.frame.size.height = imgHeight * CGFloat(sliderPhoto.value)
            labelMsg.text = "大小：\(Int(sliderPhoto.value * 100))%"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgWidth = image.frame.size.width //取得圖形原始寬度
        imgHeight = image.frame.size.height //取得圖形原始高度
        sliderPhoto.frame.size.width = 280 //Slider元件寬度
        sliderPhoto.minimumValue = 0.3 //Slider元件最小值
        sliderPhoto.value = 1 //Slider元件初始值:100%
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

