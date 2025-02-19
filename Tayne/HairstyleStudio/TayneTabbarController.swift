//
//  TayneTabbarController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/10.
//

import UIKit
import RTRootNavigationController
import RxSwift
import RxCocoa

class TayneTabbarController: UITabBarController {
    
    var tyeTintColor:UIColor?
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        var tyeBottomSpace = 0
        let notchTayneScreen: Bool = {
            if #available(iOS 15.0, *) {
                guard let tayneScence = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                      let tyeCurrentWindow = tayneScence.windows.first else {
                    return false
                }
                return tyeCurrentWindow.safeAreaInsets.bottom > 0
            }
        }()
        
        
        tyeBottomSpace = notchTayneScreen ? -20 : 0
        
        if tyeBottomSpace <= 0 {
            if let tabBarItems = tabBar.items {
                for item in tabBarItems {
                    item.title = nil
                    item.imageInsets = UIEdgeInsets(top: notchTayneScreen ? 20 : 0, left: 0, bottom: notchTayneScreen ? -20 : 0, right: 0)
                }
            }
        }
        tyeBottomSpace = -20
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let tyeStyleQuestVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withClass: TyeStyleQuestViewController.self) {
            let tyeStyleQuestVC_nav = RTRootNavigationController(rootViewController: tyeStyleQuestVC)
            tyeStyleQuestVC_nav.tabBarItem.image = UIImage(named: "tabbarFirst")!.withRenderingMode(.alwaysOriginal)
            tyeStyleQuestVC_nav.tabBarItem.selectedImage = UIImage(named: "tabbarFirst_s")!.withRenderingMode(.alwaysOriginal)
            self.addChild(tyeStyleQuestVC_nav)
        }
        
        
        if let tyeTrendTalkVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withClass: TyeTrendTalkViewController.self) {
            let tyeTrendTalkVC_nav = RTRootNavigationController(rootViewController: tyeTrendTalkVC)
            tyeTrendTalkVC_nav.tabBarItem.image = UIImage(named: "tabbarSecond")!.withRenderingMode(.alwaysOriginal)
            tyeTrendTalkVC_nav.tabBarItem.selectedImage = UIImage(named: "tabbarSecond_s")!.withRenderingMode(.alwaysOriginal)
            self.addChild(tyeTrendTalkVC_nav)
        }
        
        let tyeChicChroniclesVC_nav = RTRootNavigationController(rootViewController: TyeChicChroniclesViewController(nibName: "TyeChicChroniclesViewController", bundle: nil))
        tyeChicChroniclesVC_nav.tabBarItem.image = UIImage(named: "tabbarThree")!.withRenderingMode(.alwaysOriginal)
        tyeChicChroniclesVC_nav.tabBarItem.selectedImage = UIImage(named: "tabbarThree_s")!.withRenderingMode(.alwaysOriginal)
        self.addChild(tyeChicChroniclesVC_nav)
        
        self.delegate = self
        tyeTintColor = UIColor.init(hexString: "#000000")
        if let tyeTintColor = tyeTintColor {
            tabBar.backgroundColor = tyeTintColor
        }
        
        tabBar.layerCornerRadius = 30
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        tabBar.layer.masksToBounds = true
        
        
        NotificationCenter.default.rx
            .notification(NSNotification.Name(TayneConfig.tyeTransformInput("goohttojCneenttkewr")))
            .subscribe(onNext: { _ in
                self.selectedIndex = 2
            })
            .disposed(by: rx.disposeBag)
    }
    
}

extension TayneTabbarController:UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if tyeTintColor != nil {
            UIView.setAnimationsEnabled(false)
        }
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if tyeTintColor != nil {
            UIView.setAnimationsEnabled(true)
            
            if let index = viewControllers?.firstIndex(of: viewController),
               let tabBarItemView = tabBar.subviews[safe: index + 1] {
                animateTabBarItem(tabBarItemView)
            }
        }
    }
    
    private func animateTabBarItem(_ itemView: UIView) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        animation.values = [0, -5, 0, -3, 0]
        animation.duration = 0.3
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        itemView.layer.add(animation, forKey: "bounce")
    }
}

