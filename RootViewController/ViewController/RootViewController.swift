//
//  RootViewController.swift
//  RootViewController
//
//  Created by satoutakeshi on 2018/04/01.
//  Copyright © 2018年 Personal Factory. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    private var current: UIViewController
    init() {
        //起動時は必ずスプラッシュ画面を表示
        current = SplashViewController()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        addChildViewController(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParentViewController: self)
    }
    private func replaceCurrent(for new: UIViewController) {
        current.willMove(toParentViewController: nil)
        current.view.removeFromSuperview()
        current.removeFromParentViewController()
        current = new
    }
    private func animateFadeTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
        current.willMove(toParentViewController: nil)
        
        addChildViewController(new)
        current.view.frame = new.view.bounds
        transition(from: current, to: new, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseOut], animations: {[weak self] in
            self?.view.addSubview(new.view)
        }) {[weak self] completed in
            self?.current.removeFromParentViewController()
            self?.current.view.removeFromSuperview()
            new.didMove(toParentViewController: self)
            self?.current = new
            completion?()
            
        }
    }
    
    // MARK: アプリで行う具体的な遷移
    func showLoginScreen() {
        let new = LoginViewController.instantiate()
        addChildViewController(new)
        new.view.frame = view.bounds
        view.addSubview(new.view)
        new.didMove(toParentViewController: self)
        replaceCurrent(for: new)
    }
    
    func showMain() {
        switch current {
        case let tab as TabViewController:
            tab.selectMain()
        default:
            let tab = TabViewController.instantiate()
            animateFadeTransition(to: tab)
//            addChildViewController(tab)
//            tab.view.frame = view.bounds
//            view.addSubview(tab.view)
//            tab.didMove(toParentViewController: self)
//            replaceCurrent(for: tab)
        }
    }
    
    func showCameraScreen() {
        let camera = CameraViewController.instantiate()
        let navigation = UINavigationController(rootViewController: camera)
        current.present(navigation, animated: true, completion: nil)
    }
    
    func showSettingScreen() {
        switch current {
        case let tab as TabViewController:
            tab.selectSetting()
        default:
            let tab = TabViewController.instantiate()
            animateFadeTransition(to: tab)
            tab.selectSetting()
        }
    }
    
}
