//
//  SplashViewController.swift
//  RootViewController
//
//  Created by satoutakeshi on 2018/04/01.
//  Copyright © 2018年 Personal Factory. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        onViewDidload()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onViewDidload() {
        if UserDefaults.standard.bool(forKey: "IS_LOGIN") {
            //メイン画面を表示
            assert(Thread.isMainThread)
            AppDelegate.shared.router.route(to: .main, from: self)
        } else {
            UserDefaults.standard.set(true, forKey: "IS_LOGIN")
            //ログイン画面を表示
            AppDelegate.shared.router.route(to: .login, from: self)
        }
    }
}
