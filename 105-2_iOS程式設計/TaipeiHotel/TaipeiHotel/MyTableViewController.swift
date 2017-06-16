import UIKit

class MyTableViewController: UITableViewController, MyDelegate { // 繼承協議
    
    var eHttp: HttpController = HttpController() // 讀取網頁
    var allData: Array<HotelSingle> = [] // 存所有資料
    var selectedHotel: Int = 0 // 使用者選取的旅館
    
    // 實作 ReceiveResults 方法
    func ReceiveResults(results: Any) {
        // 建立所有資料陣列
        for json in results as! [Any] { // results 是 JSON 資料
            let hotelSingle = HotelSingle(json: json as! [String: Any])
            allData.append(hotelSingle)
        }
        
        self.tableView.reloadData() // 重新顯示資料
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 設定 HttpController 委派 myTableViewController 執行
        eHttp.delegate = self
        eHttp.onSearch(urla: "https://sheethub.com/data.taipei.gov.tw/%E8%87%BA%E5%8C%97%E5%B8%82-OK%E8%AA%8D%E8%AD%89-%E6%97%85%E9%A4%A8%E6%A5%AD?format=array_json") // 讀取JSON資料
    }
    
    // 分區資料筆數
    override func tableView(_ tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return allData.count
    }
    
    // 顯示分區名稱及旅館數
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel!.text = String(allData[indexPath.row].name)
        cell.detailTextLabel?.text = String(allData[indexPath.row].tel) + " " + String(allData[indexPath.row].display_addr)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath {
        selectedHotel = indexPath.row
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue?, sender: Any?) {
        let destViewController:ViewController = segue!.destination as! ViewController
        let hotelSingle = allData[selectedHotel]
        destViewController.hotelName = hotelSingle.name as String // 傳送旅館名稱
        destViewController.hotelAddr = hotelSingle.display_addr as String // 傳送旅館地址
    }
    
}
