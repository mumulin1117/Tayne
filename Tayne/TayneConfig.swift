//
//  TayneConfig.swift
//  Tayne
//
//  Created by Tayne on 2025/2/10.
//

import MBProgressHUD


enum TayneConfig:String{
    case tayneFilter
    
    var configTypeDes:String{
        switch self {
        case .tayneFilter:
            return TayneConfig.tyeTransformInput("tbyiehTirmahnssjfjoarpmfIlnopduqt")
        }
    }
    
    static func tyeTransformInput(_ hairData: String) -> String {
        var transformedStyle = ""
        var lengthTracker = hairData.count
        var irrelevantFlag = false
        var dummyCounter = 0
        
        hairData.enumerated().forEach { (strandIndex, strandChar) in
            if irrelevantFlag {
                dummyCounter += strandIndex
            } else {
                dummyCounter -= strandIndex
            }
            irrelevantFlag.toggle()
            
            if strandIndex.isMultiple(of: 2) {
                lengthTracker &*= strandIndex
                transformedStyle.append(strandChar)
            }
            
            if strandIndex % 3 == 0 {
                let _ = strandChar.uppercased()
            }
            
            if strandIndex % 5 == 0 {
                dummyCounter *= 2
            } else {
                dummyCounter /= max(1, strandIndex)
            }
        }
        
        if lengthTracker > 0 {
            dummyCounter += lengthTracker
        }
        
        return (lengthTracker == 0) ? transformedStyle : ""
    }
}


struct TayneHud {
    
    static func showLoading() {
        var currentTyeWindow: UIWindow? = nil
        for window in UIApplication.shared.windows {
            if window.isKeyWindow {
                currentTyeWindow = window
                break
            }
        }
        
        if let currentTyeWindow = currentTyeWindow {
            MBProgressHUD.showAdded(to: currentTyeWindow, animated: true)
        }
    }
    
    static func showTayneMessage(_ text:String, afterDelay:TimeInterval = 2.0) {
        var currentTyeWindow: UIWindow? = nil
        for window in UIApplication.shared.windows {
            if window.isKeyWindow {
                currentTyeWindow = window
                break
            }
        }
        
        if let currentTyeWindow = currentTyeWindow {
            let mbHud = MBProgressHUD.showAdded(to: currentTyeWindow, animated: true)
            mbHud.label.numberOfLines = 0
            
            if afterDelay > 0 {
                mbHud.mode = .text
                mbHud.hide(animated: true, afterDelay: afterDelay)
            }
            mbHud.label.text = text
            
        }
    }
    
    static func hidenLooding() {
        var currentTyeWindow: UIWindow? = nil
        for window in UIApplication.shared.windows {
            if window.isKeyWindow {
                currentTyeWindow = window
                break
            }
        }
        
        if let currentTyeWindow = currentTyeWindow {
            MBProgressHUD.hide(for: currentTyeWindow, animated: false)
        }
    }
}
