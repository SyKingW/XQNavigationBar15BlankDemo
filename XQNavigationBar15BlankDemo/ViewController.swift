//
//  ViewController.swift
//  NavigationDemo
//
//  Created by sinking on 2021/9/26.
//

import UIKit
import SnapKit
import MJRefresh

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView.init(frame: .zero)
    let reusableCellId = "test"
    var dataArr: Array<String> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.largeContentTitle = "Test111"
        self.navigationItem.title = "Test"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "test", style: .done, target: self, action: #selector(responseToTest))
//        self.navigationItem.largeTitleDisplayMode = .automatic
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.reusableCellId)
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        for item in 0..<100 {
            self.dataArr.append(String(item))
        }
    }
    
    @objc func responseToTest() {
        self.navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reusableCellId, for: indexPath);
        cell.textLabel?.text = self.dataArr[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(ViewController(), animated: true)
    }
    
}



