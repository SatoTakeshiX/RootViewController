//
//  AppDelegate.swift
//  RootViewController
//
//  Created by satoutakeshi on 2018/04/01.
//  Copyright © 2018年 Personal Factory. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setup()
        return true
    }
    
    private func setup() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = router.rootViewController
        window?.makeKeyAndVisible()
        
        UIApplication.shared.shortcutItems = DeepLinkShortcut.register()
    }
    
    // MARK: Shortcuts
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        if let shortCut = DeepLinkShortcut.handleShortcut(shortcutItem) {
            let route = AppDelegate.shared.router
            switch shortCut {
            case .main:
                route.route(to: .main, from: route.rootViewController)
            case .camera:
                route.route(to: .camera, from: route.rootViewController)
            case .setting:
                route.route(to: .setting, from: route.rootViewController)
            }
        }
        completionHandler(true)
    }
}

private let _router = Router()

extension AppDelegate {
    static var shared: AppDelegate {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("not set app delegate")
        }
        return delegate
    }
    var router: Router {
        return _router
    }
}

