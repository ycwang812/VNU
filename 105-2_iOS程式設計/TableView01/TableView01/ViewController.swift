import UIKit

class ViewController: UIViewController,UITableViewDataSource{
    var balls:Array<String> = ["籃球","足球","棒球","其他"]
    
    // 設定表格只有一個區段
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 設定表格的列數
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return balls.count
    }
    
    // 表格的儲存格設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        // 設定儲存格的內容
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel!.text = balls[indexPath.row]
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
