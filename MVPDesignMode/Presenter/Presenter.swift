//
//  Presenter.swift
//  MVPDesignMode
//
//  Created by 林文俊 on 2021/8/13.
//

import UIKit

class Presenter: NSObject {
    // 用于处理数据来源
    private let service = UserService()
    // 保存VC。用于做更新操作
    private let attachView: UserViewProtocol!
    
    init(attach view: UserViewProtocol) {
        self.attachView = view
    }
    
    // 调用service获取数据
    func fetchData() {
        // 启动菊花
        attachView.showIndicator()
        // 获取数据
        service.requestDatas { [unowned self] (users) in
            self.attachView.hideIndicator()
            if users.isEmpty {
                // 显示空视图
                self.attachView.showEmptyView()
            }
            // 得到新数据后进行刷新UI
            self.attachView.userViewDataSource(users: users)
        } failure: {
            // 请求错误
        }
    }
    
}
