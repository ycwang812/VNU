import UIKit

class CustomCell: UITableViewCell {
    
    // 定義 IBOutlet
    @IBOutlet var imageName: UIImageView!
    @IBOutlet var labelName: UILabel!
    @IBOutlet var labelValue: UILabel!
    
    // 設定儲存格內容
    func setCell(_ labelName:String, labelValue:Int, imageName:String) {
        self.labelName.text = labelName
        self.labelValue.text = String(labelValue)
        self.imageName.image = UIImage(named: imageName)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
