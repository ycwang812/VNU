import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var labelResult: UILabel!
    
    //  balls 字典記錄 名稱、價格、圖示名稱
    var balls:Array<Dictionary<String,String>> =
    [["name":"籃球","value":"600","imageName":"basketball"],
        ["name":"足球","value":"500","imageName":"football"],
        ["name":"棒球","value":"250","imageName":"baseball"],
        ["name":"其他","value":"350","imageName":"other"]]
    
    // aryCheck 記錄選取狀態
    var aryCheck:Array<Bool> = [false,false,false,false]
    
    // 點選儲存格的處理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        // 取得目前選取的儲存格
        let cell:UITableViewCell? = tableView.cellForRow(at: indexPath) as UITableViewCell?
        
        aryCheck[indexPath.row] = !aryCheck[indexPath.row]
        
        // 依 aryCheck 狀態設定指示器
        if aryCheck[indexPath.row]{
            cell!.accessoryType = UITableViewCellAccessoryType.checkmark
        }else{
            cell!.accessoryType = UITableViewCellAccessoryType.none
        }
        
        // 顯示選取項目
        showResult()
    }
    
    // 顯示選取項目
    func showResult(){
        labelResult.text = "選取項目:"
        
        for i in 0 ..< balls.count {
            if aryCheck[i]{
                var ball:Dictionary<String,String> = balls[i]
                labelResult.text = labelResult.text! + ball["name"]! + " "
            }
        }
    }
    
    // 設定表格的列數
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return balls.count
    }
    
    // 表格的儲存格設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        // 設定儲存格的內容
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        var ball:Dictionary<String,String> = balls[indexPath.row]
        
        cell.textLabel!.text = ball["name"] //名稱
        cell.detailTextLabel?.text = ball["value"] //價格
        cell.imageView!.image = UIImage(named:ball["imageName"]!) //圖示
        
        return cell
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
