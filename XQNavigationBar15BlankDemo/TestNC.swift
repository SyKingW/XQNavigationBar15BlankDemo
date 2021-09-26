//
//  TestNC.swift
//  NavigationDemo
//
//  Created by sinking on 2021/9/26.
//

import UIKit

/// 使用大标题
class TestNC: UINavigationController {
    
    var appearance_test: UINavigationBarAppearance?
    
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
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.barTintColor = .red;
        self.navigationBar.isTranslucent = true
        self.navigationBar.tintColor = .green
        
        let appearance = UINavigationBarAppearance.init()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.red
        appearance.shadowImage = UIImage.init()
        appearance.shadowColor = UIColor.clear
        self.appearance_test = appearance
        // wxq 静止样式
        self.navigationBar.standardAppearance = appearance
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function);
    }
    
    func xq_scrollEdgeAppearance(_ appearance: UINavigationBarAppearance?) {
        // wxq 滚动样式
        self.navigationBar.scrollEdgeAppearance = appearance
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        print(#function, self.viewControllers);
        if self.viewControllers.count >= 1 {
            viewController.hidesBottomBarWhenPushed = true;
            viewController.navigationItem.largeTitleDisplayMode = .never;
        }
        
        // wxq 第一次设置即可
        if self.viewControllers.count == 1 {
            self.xq_scrollEdgeAppearance(self.appearance_test)
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        print(#function, self.viewControllers);
        self.xq_scrollEdgeAppearance(nil)
        return super.popToRootViewController(animated: animated)
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        print(#function, self.viewControllers);
        if self.viewControllers.count <= 2 {
            self.xq_scrollEdgeAppearance(nil)
        }
        return super.popViewController(animated: animated)
    }

}
