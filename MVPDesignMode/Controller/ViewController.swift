//
//  ViewController.swift
//  MVPDesignMode
//
//  Created by 林文俊 on 2021/8/13.
//

import UIKit

class ViewController: UIViewController {
    
    // Presenter
    private var presenter: Presenter!
    // View
    private var tableView: UITableView! // 列表
    private var indicatorView: UIActivityIndicatorView! // 菊花
    // data
    private var datas: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchDatas()
    }


}

// MARK: - UserViewProtocol
extension ViewController: UserViewProtocol {
    // 拿到数据源刷新
    func userViewDataSource(users: [User]) {
        datas = users
        tableView.reloadData()
    }
    
    // 显示菊花
    func showIndicator() {
        indicatorView.startAnimating()
        indicatorView.isHidden = false
    }
    
    // 隐藏菊花
    func hideIndicator() {
        indicatorView.stopAnimating()
    }
    
    // 空视图
    func showEmptyView() {
        let alertVC = UIAlertController(title: "Alert", message: "show empty view", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "确定", style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}

// MARK: - tableView代理
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")
        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: "UITableViewCell")
        }
        let user = datas[indexPath.row];
        cell?.textLabel?.text = user.name
        return cell!;
    }
}

// MARK: - 私有
extension ViewController {
    
    private func setupUI() {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self;
        tableView.delegate = self;
        view.addSubview(tableView)
        self.tableView = tableView
        
        let indicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        indicatorView.center = view.center
        indicatorView.hidesWhenStopped = true
        view.addSubview(indicatorView)
        self.indicatorView = indicatorView
    }
    
    // 获取数据
    private func fetchDatas() {
        presenter = Presenter(attach: self)
        presenter.fetchData()
    }
}
