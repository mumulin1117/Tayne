//
//  TressTalesCollectionViewCell.swift
//  Tayne
//
//  Created by Tayne on 2025/2/11.
//

import UIKit

class TressTalesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tressTalesImage: UIImageView!
    @IBOutlet weak var tressTalesName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tressTalesImage.layerBorderWidth = 1
        self.tressTalesName.layerBorderColor = .white
        
        self.layerCornerRadius = 33
        self.backgroundColor = UIColor.white.withAlphaComponent(0.3)
    }
    
}
