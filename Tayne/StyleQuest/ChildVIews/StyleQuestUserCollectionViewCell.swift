//
//  StyleQuestUserCollectionViewCell.swift
//  Tayne
//
//  Created by Tayne on 2025/2/10.
//

import UIKit
import SwifterSwift

class StyleQuestUserCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var styleQuestUserImage: UIImageView!
}

class TyeUserCollectionViewCell: UICollectionViewCell {
    
    let tyeUserImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        tyeUserImage.layerCornerRadius = 18
        tyeUserImage.layerBorderColor = UIColor.init(hexString: "#5CFA4E")
        tyeUserImage.layerBorderWidth = 2
        
        self.contentView.addSubview(tyeUserImage)
        tyeUserImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

