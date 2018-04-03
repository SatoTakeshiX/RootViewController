//
//  Router.swift
//  RootViewController
//
//  Created by satoutakeshi on 2018/04/01.
//  Copyright © 2018年 Personal Factory. All rights reserved.
//

import UIKit
final class Router {
    enum Locate {
        case login
        case main
        case camera
        case setting
    }
    let rootViewController = RootViewController()
    func route(to locate: Locate, from viewController: UIViewController) {
        switch locate {
        case .login:
            rootViewController.showLoginScreen()
            break
        case .main:
            rootViewController.showMain()
        case .camera:
            rootViewController.showCameraScreen()
            break 
        case .setting:
            rootViewController.showSettingScreen()
            break
        }
    }
}
