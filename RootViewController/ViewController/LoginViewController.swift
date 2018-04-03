//
//  LoginViewController.swift
//  RootViewController
//
//  Created by satoutakeshi on 2018/04/01.
//  Copyright © 2018年 Personal Factory. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
    }
    @IBAction func goToNext(_ sender: UIButton) {
        AppDelegate.shared.router.route(to: .main, from: self)
    }
    static func instantiate() -> LoginViewController {
        guard let login = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController() as? LoginViewController else {
            fatalError("not set top tab view ")
        }
        return login
    }
    
}
