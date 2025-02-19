//
//  StyleQuestTableViewCell.swift
//  Tayne
//
//  Created by Tayne on 2025/2/10.
//

import UIKit

class StyleQuestTableViewCell: UITableViewCell {

    @IBOutlet weak var challengeTyHotButton: UIButton!
    
    
    @IBOutlet weak var challengeTyeImage: UIImageView!
    @IBOutlet weak var challengeTyeName: UILabel!
    @IBOutlet weak var challengeTyeInfoDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        challengeTyHotButton.layerCornerRadius = 27/2
        challengeTyHotButton.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
    }
    
}
