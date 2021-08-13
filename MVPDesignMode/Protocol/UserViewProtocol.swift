//
//  UserViewProtocol.swift
//  MVPDesignMode
//
//  Created by 林文俊 on 2021/8/13.
//

import UIKit
/**
 * UserViewProtocol 协议定义了一下方法，这些方法是让presenter对view层发送的命令
 */
protocol UserViewProtocol {
    
    /** 获取数据源 */ 
    func userViewDataSource(users: [User])
    
    /** 显示菊花 */
    func showIndicator()
    
    /** 隐藏菊花 */
    func hideIndicator()
    
    /** 空数据视图 */
    func showEmptyView()
    
}


