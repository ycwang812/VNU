import Foundation

class HttpController {
    
    // 建立委派物件
    var delegate:MyDelegate? = nil
    
    // 讀取網頁資料類別
    func onSearch(urla:String) {
        
        let url:URL = URL(string: urla)!
        let session = URLSession.shared
        
        // 讀取網頁資料
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            // 將 response(URLResponse 型別) 轉換為 HTTPURLResponse 型別
            let httpResponse = response as? HTTPURLResponse
            
            // 讀取成功
            if httpResponse?.statusCode == 200 {
                // 將 data 轉換為 Array 型別
                let json = try! JSONSerialization.jsonObject(with: data!, options: []) as! [Any]
                // 成功讀取網頁資料後執行委派
                self.delegate?.ReceiveResults(results: json)
            }
        })
        
        task.resume()
    }
}


