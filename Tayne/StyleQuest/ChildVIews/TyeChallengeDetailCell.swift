//
//  TyeChallengeDetailCell.swift
//  Tayne
//
//  Created by Tayne on 2025/2/10.
//

import UIKit
import RxGesture

class TyeChallengeDetailCell: UICollectionViewCell {

    @IBOutlet weak var tyeUserIcon: UIImageView!
    @IBOutlet weak var challengeImage: UIImageView!
    
    var tyeUserIconTaped:(() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tyeUserIcon.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else {return}
                self.tyeUserIconTaped?()
            })
            .disposed(by: rx.disposeBag)
    }
}
