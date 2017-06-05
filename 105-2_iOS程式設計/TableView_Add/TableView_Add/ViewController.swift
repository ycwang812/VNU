import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var labelBall: UILabel!
    @IBOutlet weak var textBall: UITextField!
    @IBOutlet weak var myTableView: UITableView!
    
    // 建立 NSMutableArray 型別陣列
    var balls:NSMutableArray = ["籃球","足球","棒球","其他"]
    
    // 新增資料
    @IBAction func insert(_ sender: UIButton) {
        balls.add(textBall.text!)
        myTableView.reloadData()
    }
    
    // 設定滑動後顯示紅色刪除按鈕
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle{
        return UITableViewCellEditingStyle.delete
    }
    
    // 按下刪除按鈕，刪除該儲存格資料
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        // 刪除陣列資料
        balls.removeObject(at: indexPath.row)
        // 刪除該儲存格資料
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    // UISwitch 切換
    @IBAction func valueChanged(_ sender: UISwitch) {
        if sender.isOn  {
            self.myTableView.isEditing = true
        }else{
            self.myTableView.isEditing = false
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
        cell.textLabel!.text = balls.object(at: indexPath.row) as! NSString as String
        return cell
    }
    
    // 點選儲存格的處理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let choice:AnyObject = balls[indexPath.row] as AnyObject
        labelBall.text = "最喜歡的球類：\(choice)"
    }
    
    // 允許拖曳
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool{
        return true
    }
    
    // 移動資料
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath){
        balls.exchangeObject(at: sourceIndexPath.row, withObjectAt: destinationIndexPath.row)
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

