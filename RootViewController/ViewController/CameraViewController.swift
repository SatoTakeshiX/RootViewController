//
//  CameraViewController.swift
//  RootViewController
//
//  Created by satoutakeshi on 2018/04/01.
//  Copyright © 2018年 Personal Factory. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.brown
    }
    static func instantiate() -> CameraViewController {
        guard let camera = UIStoryboard(name: "Camera", bundle: nil).instantiateInitialViewController() as? CameraViewController else {
            fatalError("not set top camera screen")
        }
        return camera
    }
    @IBAction func dismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        AppDelegate.shared.router.route(to: .main, from: self)
    }
}
