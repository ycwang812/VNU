import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var labelBall: UILabel!
    var arrBalls:Array<Ball> = []
    
    // 設定表格的列數
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrBalls.count
    }
    
    // 表格的儲存格設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 以 CustomCell 做為 cell 類別
        let cell:CustomCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.yellow
        } else {
            cell.backgroundColor = UIColor.orange
        }
        
        // 加入項目內容
        let ball = arrBalls[indexPath.row]
        cell.setCell(ball.name, labelValue:ball.value, imageName:ball.imageName)
        
        return cell
    }
    
    func setupBalls() {
        let ball1 = Ball(name: "籃球", value: 600, imageName: "basketball")
        let ball2 = Ball(name: "足球", value: 500, imageName: "football")
        let ball3 = Ball(name: "棒球", value: 250, imageName: "baseball")
        let ball4 = Ball(name: "其他", value: 350, imageName: "other")
        
        arrBalls.append(ball1)
        arrBalls.append(ball2)
        arrBalls.append(ball3)
        arrBalls.append(ball4)
    }
    
    // 點選儲存格的處理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let choice:String = arrBalls[indexPath.row].name
        labelBall.text = "最喜歡的球類：\(choice)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupBalls()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
