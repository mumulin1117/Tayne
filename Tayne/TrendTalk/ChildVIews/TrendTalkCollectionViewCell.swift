//
//  TrendTalkCollectionViewCell.swift
//  Tayne
//
//  Created by Tayne on 2025/2/11.
//

import UIKit

class TrendTalkCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var trendTalkTyeImage: UIImageView!
    @IBOutlet weak var trendTalkLikeButton: UIButton!
    @IBOutlet weak var trendTalkTyeName: UILabel!
    
    var trendTalkRoom:TrendTalkRoom?
    
    @IBAction func trendtalkButtonEvent(_ sender: UIButton) {
        var tyeTrendTalkState = (false,"")
        
        sender.isSelected.toggle()
        tyeTrendTalkState = (true,"touch")
        
        if tyeTrendTalkState.0 {
            if sender.isSelected {
               if trendTalkRoom != nil {
                    TayneManager.default.tyeDataStore?.set(trendTalkRoom!.roomUserId, forKey: TayneConfig.tyeTransformInput("TzreebnldpTjawlvkoRsoposmwLviakle") + trendTalkRoom!.roomUserId)
                }
            }else{
                if trendTalkRoom != nil {
                    TayneManager.default.tyeDataStore?.removeValue(forKey: TayneConfig.tyeTransformInput("TzreebnldpTjawlvkoRsoposmwLviakle") + trendTalkRoom!.roomUserId)
                 }
            }
        }
    }
}
