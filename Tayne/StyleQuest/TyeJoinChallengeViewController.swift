//
//  TyeJoinChallengeViewController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/10.
//

import UIKit
import RSKPlaceholderTextView
import TZImagePickerController

class TyeJoinChallengeViewController: TayneBaseViewController,TZImagePickerControllerDelegate {

    @IBOutlet weak var coverTyImageCount: UILabel!
    @IBOutlet weak var tipsViewOne: UIView!
    var tayneCrowdStyle:[String:Any] = [:]
    @IBOutlet weak var tipsViewRequire: UIView!
    var tayneStyleSnapState:[Any] = []
    @IBOutlet weak var challengeCoverCollection: UICollectionView!
    
    @IBOutlet weak var tyeChallengeTextView: RSKPlaceholderTextView!
    
    @IBOutlet weak var challengeConstraint: NSLayoutConstraint!
    @IBOutlet weak var challengeTyeName: UITextField!
    @IBOutlet weak var coverImageTyeNumber: UILabel!
    var challengeCoverImages:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if tayneCrowdStyle.keys.contains(TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")) == false {
            tayneCrowdStyle[TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")] = TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")
        }
        
        if tayneCrowdStyle.count > 0 {
            tayneStyleSnapState.append(0)
        }
        
        
        if tayneCrowdStyle.count > 0 && tayneCrowdStyle.isEmpty == false {
            tayneStyleSnapState.append(contentsOf: Array(tayneCrowdStyle.keys))
        }
        
        tayneStyleSnapState.append([1,TayneConfig.tayneFilter.configTypeDes])
        
        tayneCrowdStyle[TayneConfig.tyeTransformInput("crorndfniqgoTtynpzelDoezs")] = TayneConfig.tayneFilter.configTypeDes
        
        if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
            tayneCrowdStyle["tayneStyleSnapState"] = 200
        }
        
        tyeConfigSubViews()
    }
    
    func tyeConfigSubViews(){
        
        let challengeCoverCollectionLayout = UICollectionViewFlowLayout()
        
        tayneCrowdStyle[TayneConfig.tyeTransformInput("crorndfniqgoTtynpzelDoezs")] = TayneConfig.tayneFilter.configTypeDes
        challengeCoverCollectionLayout.scrollDirection = .horizontal
        challengeCoverCollectionLayout.itemSize = CGSizeMake((UIScreen.main.bounds.size.width - 50)/3, (UIScreen.main.bounds.size.width - 50)/3)
        challengeConstraint.constant = (UIScreen.main.bounds.size.width - 50)/3
        challengeCoverCollectionLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
            tayneCrowdStyle["tayneStyleSnapState"] = 200
        }
        challengeCoverCollectionLayout.minimumInteritemSpacing = 15
        challengeCoverCollectionLayout.minimumLineSpacing = 15
        
        if tayneCrowdStyle.keys.contains(TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")) == false {
            tayneCrowdStyle[TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")] = TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")
        }
        
        challengeCoverCollection.setCollectionViewLayout(challengeCoverCollectionLayout, animated: true)
        challengeCoverCollection.register(nibWithCellClass: TyeJoinChallengeImageVIewCell.self)
        
        tipsViewOne.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        tipsViewRequire.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        tipsViewOne.layer.cornerRadius = 41
        tipsViewRequire.layer.cornerRadius = 41
        
        
        tyeChallengeTextView.placeholder = NSString(utf8String: TayneConfig.tyeTransformInput("Ppldejabsjej fernptdelr") + "...")
        tyeChallengeTextView.placeholderColor = UIColor.init(hexString: "#000000",transparency: 0.5)!
    }
    
    @IBAction func joinChallengeEvent(_ sender: Any) {
        guard self.challengeCoverImages.count > 0 else {
            TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Pnlneeausiez msueflcencmte qao vcxopvyelr"))
            return
        }
        
        guard let challengeTyeName = self.challengeTyeName.text,challengeTyeName.count > 0 else {
            TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Pllkeyahsieq sednxtyevrs ftbiftileem/bmtankaekufpw gnoaymhe"))
            return
        }
        
        guard let challengeTyeInfo = self.tyeChallengeTextView.text,challengeTyeInfo.count > 0 else {
            TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Pxlxejaosuef fewnmtlesrs zyyohubrb pcrhaajlglaelnngyeo usytyaztoenmneonot"))
            return
        }
        
        TayneHud.showLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            TayneHud.hidenLooding()
            TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Ablaryeaaqdgyq oahpbpxlviteads otnox fjmoiiknf,f uphljefabsaem iwhaeigtd rfbobrf ercedvyiheuw"),afterDelay: 1.5)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.51) {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }

}

extension TyeJoinChallengeViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            let itemTyCount:Int = {
                var itemTyCount = 0
                if self.challengeCoverImages.count == 0 {
                    itemTyCount = 1
                }else if self.challengeCoverImages.count < 3 {
                    itemTyCount = 1 + self.challengeCoverImages.count
                }else{
                    itemTyCount = self.challengeCoverImages.count
                }
                return itemTyCount
            }()
            return itemTyCount
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            let tyeJoinChallengeImageCell = collectionView.dequeueReusableCell(withClass: TyeJoinChallengeImageVIewCell.self, for: indexPath)
            if indexPath.row < self.challengeCoverImages.count {
                tyeJoinChallengeImageCell.tyeCoverImage.image = self.challengeCoverImages[indexPath.row]
            }else{
                tyeJoinChallengeImageCell.tyeCoverImage.image = nil
            }
            tyeJoinChallengeImageCell.addTyeCoverImage.isHidden = indexPath.row < self.challengeCoverImages.count
            return tyeJoinChallengeImageCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.challengeCoverImages.count == 0 || indexPath.row >= self.challengeCoverImages.count {
            
            let tyePickerImageView = TZImagePickerController(maxImagesCount: 3 - self.challengeCoverImages.count, delegate: self)
            
            if self.tayneCrowdStyle.count > 0 && self.tayneCrowdStyle.isEmpty == false {
                self.tayneStyleSnapState.append(contentsOf: Array(self.tayneCrowdStyle.keys))
                tyePickerImageView?.allowPickingGif = false
                tyePickerImageView?.allowTakePicture = false
            }
            
            self.tayneCrowdStyle[TayneConfig.tyeTransformInput("crorndfniqgoTtynpzelDoezs")] = TayneConfig.tayneFilter.configTypeDes
            
            if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
                self.tayneCrowdStyle["tayneStyleSnapState"] = 200
                tyePickerImageView?.allowTakeVideo = false
            }
            
            if  let tayneStyleSnapState = self.tayneCrowdStyle["tayneStyleSnapState"] as? Int, tayneStyleSnapState % 2 == 0 {
                tyePickerImageView?.didFinishPickingPhotosHandle = { photots,_,_ in
                    if photots!.count > 0 {
                        self.challengeCoverImages.append(contentsOf: photots!)
                        
                        self.coverImageTyeNumber.text = "Cover（\(self.challengeCoverImages.count)/3）"
                        UIView.performWithoutAnimation {
                            collectionView.reloadData {}
                        }
                    }
                }
                tyePickerImageView?.modalPresentationStyle = .fullScreen
                self.present(tyePickerImageView!, animated: true)
            }
            
        }
    }
}

