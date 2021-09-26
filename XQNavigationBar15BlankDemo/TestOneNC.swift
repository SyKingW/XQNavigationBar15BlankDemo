//
//  TestNC.swift
//  NavigationDemo
//
//  Created by sinking on 2021/9/26.
//

import UIKit

/// 不使用大标题
class TestOneNC: UINavigationController {
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        print(#function);
        self.xq_init()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print(#function);
        self.xq_init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print(#function);
        self.xq_init()
    }
    
    func xq_init() {
        print(#function);
        self.navigationBar.prefersLargeTitles = false
        self.navigationBar.barTintColor = .red;
        self.navigationBar.tintColor = .green
        
        let appearance = UINavigationBarAppearance.init()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.red
        appearance.shadowImage = UIImage.init()
        appearance.shadowColor = UIColor.clear
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function);
    }
    
}
