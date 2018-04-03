//
//  TabViewController.swift
//  RootViewController
//
//  Created by satoutakeshi on 2018/04/01.
//  Copyright © 2018年 Personal Factory. All rights reserved.
//

import UIKit

class EmptyViewControlelr: UIViewController{}

class TabViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        view.backgroundColor = UIColor.blue
        
        let main = MainViewController()
        main.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        let empty = EmptyViewControlelr()
        empty.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 2)
        
        let setting = SettingViewController()
        setting.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 3)
        
        setViewControllers([main, empty, setting], animated: true)
    }
    
    func selectMain() {
        self.selectedIndex = 0
    }
    
    func selectSetting() {
        self.selectedIndex = 2
    }
    
    static func instantiate() -> TabViewController {
        guard let top = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? TabViewController else {
            fatalError("not set top tab view ")
        }
        return top
    }
    
    // MARK: UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        switch viewController {
        case is EmptyViewControlelr:
            AppDelegate.shared.router.route(to: .camera, from: self)
        default:
            break
        }
    }
}

