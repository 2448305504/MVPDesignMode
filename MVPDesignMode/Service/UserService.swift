//
//  UserService.swift
//  MVPDesignMode
//
//  Created by 林文俊 on 2021/8/13.
//

import UIKit

struct UserService {
    
    func requestDatas(success: @escaping ([User])->(), failure: ()->()) {
        let result = [
            ["name": "tom",
             "age": 25,
             "addr": "GuangZhou",
             "gender": 0],
            ["name": "Jerry",
             "age": 22,
             "addr": "Hangzhou",
             "gender": 1],
            ["name": "Lucy",
             "age": 18,
             "addr": "Didu",
             "gender": 1],
        ]
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now()+2.0) {
            var users: [User] = []
            _ = result.map { data in
                let user = User.user(with: data)
                users.append(user)
            }
            DispatchQueue.main.async {
                success(users)
            }
        }
    }
    
}
