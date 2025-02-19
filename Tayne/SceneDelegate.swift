//
//  SceneDelegate.swift
//  Tayne
//
//  Created by Tayne on 2025/2/10.
//

import UIKit
import IQKeyboardManagerSwift
import RTRootNavigationController

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        tayneKeyboradSetting()
        
        if let tyeLoginId = UserDefaults.standard.string(forKey: "tyeLoginId") {
            
            if tyeLoginId != "tyeLoginId" {
                let _ = TayneManager.default
                let tayneTabbarVC = TayneTabbarController()
                window?.rootViewController = tayneTabbarVC
            }
            
        }else{
            if let tayneLoginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withClass: TayneLoginViewController.self) {
                if window != nil {
                    window!.rootViewController = RTRootNavigationController(rootViewController: tayneLoginVC)
                }
            }
        }
        
        window?.makeKeyAndVisible()
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
}



extension SceneDelegate {
    
    private func tayneKeyboradSetting(){
        TayneManager.tyeCheckCompleteTransactions()
        
        IQKeyboardManager.shared.isEnabled = true
        if IQKeyboardManager.shared.isEnabled == true {
            IQKeyboardManager.shared.resignOnTouchOutside = true
        }
    }
}
