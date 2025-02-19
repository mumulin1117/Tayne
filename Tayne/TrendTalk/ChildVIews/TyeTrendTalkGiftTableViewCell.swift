//
//  TyeTrendTalkGiftTableViewCell.swift
//  Tayne
//
//  Created by Tayne on 2025/2/12.
//

import UIKit
import RZColorfulSwift

class TyeTrendTalkGiftTableViewCell: UITableViewCell {

    @IBOutlet weak var tyeGiftNumber: UILabel!
    @IBOutlet weak var tyeGiftImage: UIImageView!
    @IBOutlet weak var tyeGiftDescInfo: UILabel!
    @IBOutlet weak var infomationFrom: UIImageView!
    
    var talkInfomationModel:TalkInfomationModel?{
        didSet{
            guard let talkInfomationModel = talkInfomationModel else {return}
            
            tyeGiftNumber.rz.colorfulConfer { confer in
                confer.text("x")?.font(UIFont.systemFont(ofSize: 12,weight: .black))
                confer.text("\(talkInfomationModel.tyeGIftNumber)")?.font(.systemFont(ofSize: 24,weight: .black))
            }
            tyeGiftImage.image = UIImage(named: talkInfomationModel.tyeGiftName)
            if let tyeNow = TayneManager.default.tyeNow.value {
                tyeGiftDescInfo.text = "\(tyeNow.roomUserName) to \(talkInfomationModel.tyeTo)"
                infomationFrom.image = .init(named: talkInfomationModel.tyeToId)
            }
        }
    }
    
}
