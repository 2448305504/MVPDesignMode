import UIKit

struct User {
    
    var name: String = ""
    var age: Int = 0
    var addr: String = ""
    var gender: Int = 0 // 0-男 1-女
    
    init(dict: Dictionary<String, Any>) {
        self.name = dict["name"] as! String
        self.age = dict["age"] as! Int
        self.addr = dict["addr"] as! String
        self.gender = dict["gender"] as! Int
    }
    
    static func user(with dict: Dictionary<String, Any>) -> User {
        return User(dict: dict)
    }
}
    
