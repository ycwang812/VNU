import Foundation

// 該筆旅館資料類別
class HotelSingle {
    
    var name:String!
    var tel:String!
    var display_addr:String!
    var poi_addr:String!
    
    init(json: [String: Any]) {
        self.name = json["name"] as! String
        self.tel = json["tel"] as! String
        self.display_addr = json["display_addr"] as! String
        self.poi_addr = json["poi_addr"] as! String
    }
    
}
