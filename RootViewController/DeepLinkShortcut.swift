//
//  DeepLinkShortcut.swift
//  RootViewController
//
//  Created by satoutakeshi on 2018/04/01.
//  Copyright © 2018年 Personal Factory. All rights reserved.
//

import UIKit
struct DeepLinkShortcut {
    enum ItemType: String {
        case main
        case camera
        case setting
    }
    
    static func register() -> [UIApplicationShortcutItem] {
        let mainShortcutItem = UIApplicationShortcutItem(type: ItemType.main.rawValue, localizedTitle: "メイン画面")
        let cameraShortcutItem = UIApplicationShortcutItem(type: ItemType.camera.rawValue, localizedTitle: "カメラ画面")
        let settingShortcutItem =  UIApplicationShortcutItem(type: ItemType.setting.rawValue, localizedTitle: "設定画面")
        return [mainShortcutItem, cameraShortcutItem, settingShortcutItem]
    }
    
    static func handleShortcut(_ shortcut: UIApplicationShortcutItem) -> ItemType? {
        return ItemType(rawValue: shortcut.type)
    }
}
