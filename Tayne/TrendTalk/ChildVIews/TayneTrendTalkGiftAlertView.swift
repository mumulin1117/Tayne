//
//  TayneTrendTalkGiftAlertView.swift
//  Tayne
//
//  Created by Tayne on 2025/2/13.
//

import UIKit
import RxGesture

class TayneTrendTalkGiftAlertView: UIView {

    @IBOutlet weak var tyeUserCollection: UICollectionView!
    
    @IBOutlet weak var tyeGiftCollection: UICollectionView!
    
    var tayneCrowdStyle:[String:Any] = [:]
    
    var giftTyeDone:((Int,Int,String,String) -> Void)?
    
    @IBOutlet weak var tyeGiftQuantity: UILabel!
    
    var tayneStyleSnapState:[Any] = []
    
    var tyeUserArray:[TrendTalkRoom] = []
    
    var tyeBlackAlphaView:UIView?
    
    var tyeSelectUserIndex:IndexPath = IndexPath(row: 0, section: 0)
    
    var tyeSelectGift:IndexPath?
    
    var tyeGiftCount = 1 {
        didSet{
            tyeGiftQuantity.text = "\(tyeGiftCount)"
        }
    }
    
    @IBAction func tyeSubtractEvent(_ sender: UIButton) {
        guard tyeGiftCount > 0 else { return }
        tyeGiftCount -= 1
    }
    
    @IBAction func tyeAddEvent(_ sender: UIButton) {
        tyeGiftCount += 1
    }
    
    func giftAlertConfig(){
        let tyeUserCollectionLayout = UICollectionViewFlowLayout()
        
        tayneCrowdStyle[TayneConfig.tyeTransformInput("crorndfniqgoTtynpzelDoezs")] = TayneConfig.tayneFilter.configTypeDes
        tyeUserCollectionLayout.scrollDirection = .horizontal
        tyeUserCollectionLayout.itemSize = CGSizeMake(36, 36)
        tyeUserCollectionLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
            tayneCrowdStyle["tayneStyleSnapState"] = 200
        }
        tyeUserCollectionLayout.minimumInteritemSpacing = 16
        
        if tayneCrowdStyle.keys.contains(TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")) == false {
            tayneCrowdStyle[TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")] = TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")
        }
        tyeUserCollection.register(cellWithClass: TyeUserCollectionViewCell.self)
        tyeUserCollection.setCollectionViewLayout(tyeUserCollectionLayout, animated: true)
        
        let tyeGiftLayout = UICollectionViewFlowLayout()
        
        tayneCrowdStyle[TayneConfig.tyeTransformInput("crorndfniqgoTtynpzelDoezs")] = TayneConfig.tayneFilter.configTypeDes
        tyeGiftLayout.scrollDirection = .vertical
        tyeGiftLayout.itemSize = CGSizeMake((UIScreen.main.bounds.size.width - 12 * 4)/3, 114)
        tyeGiftLayout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
            tayneCrowdStyle["tayneStyleSnapState"] = 200
        }
        tyeGiftLayout.minimumInteritemSpacing = 12
        tyeGiftLayout.minimumLineSpacing = 12
        
        if tayneCrowdStyle.keys.contains(TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")) == false {
            tayneCrowdStyle[TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")] = TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")
        }
        tyeGiftCollection.register(nibWithCellClass: TrendTalkGiftCollectionViewCell.self)
        tyeGiftCollection.setCollectionViewLayout(tyeGiftLayout, animated: true)
        tyeGiftCollection.reloadData()
        tyeUserCollection.reloadData()
        
        tyeUserCollection.delegate = self
        tyeGiftCollection.delegate = self
        
        tyeUserCollection.dataSource = self
        tyeGiftCollection.dataSource = self
        
    }
    
    func trendTalkGiftShow(_ tyeUsers:[TrendTalkRoom]){
        
        tyeUserArray = tyeUsers
        
        if tayneCrowdStyle.keys.contains(TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")) == false {
            tayneCrowdStyle[TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")] = TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")
        }
        
        if tayneCrowdStyle.count > 0 {
            tayneStyleSnapState.append(0)
        }
        
        
        if tayneCrowdStyle.count > 0 && tayneCrowdStyle.isEmpty == false {
            tayneStyleSnapState.append(contentsOf: Array(tayneCrowdStyle.keys))
        }
        
        
        if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
            tayneCrowdStyle["tayneStyleSnapState"] = 200
            if let tyeKeyWindow = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first {
                tyeBlackAlphaView = UIView()
                tyeBlackAlphaView!.backgroundColor = .black.withAlphaComponent(0.7)
                if tayneCrowdStyle.count > 0 {
                    tyeKeyWindow.addSubview(tyeBlackAlphaView!)
                    
                    tyeBlackAlphaView?.rx
                        .tapGesture()
                        .when(.recognized)
                        .subscribe(onNext: { [weak self] _ in
                            guard let self = self else {return}
                            self.trendTalkGiftDismis()
                        })
                        .disposed(by: rx.disposeBag)
                    
                    tyeBlackAlphaView!.snp.makeConstraints({ make in
                        make.top.right.equalToSuperview()
                        make.left.bottom.equalToSuperview()
                    })
                    
                    tayneStyleSnapState.append([1,TayneConfig.tayneFilter.configTypeDes])
                    
                    
                    if tayneCrowdStyle.count > 0 && tayneCrowdStyle.isEmpty == false {
                        tyeKeyWindow.addSubview(self)
                        self.snp.makeConstraints { make in
                            make.left.right.equalToSuperview()
                            make.bottom.equalToSuperview().offset(442)
                            make.width.equalToSuperview()
                            make.height.equalTo(442)
                        }
                    }
                    tyeKeyWindow.layoutIfNeeded()
                    tayneStyleSnapState.append(contentsOf: Array(tayneCrowdStyle.keys))
                    
                    tayneCrowdStyle[TayneConfig.tyeTransformInput("crorndfniqgoTtynpzelDoezs")] = TayneConfig.tayneFilter.configTypeDes
                    self.snp.updateConstraints { make in
                        make.bottom.equalToSuperview().offset(0)
                    }
                    UIView.animate(withDuration: 0.225) {
                        tyeKeyWindow.layoutIfNeeded()
                    }
                }
                
            }
        }
        
    }
    
    @IBAction func tyeSendGiftEvent(_ sender: Any) {
        if let tyeSelectGift = tyeSelectGift {
            self.trendTalkGiftDismis()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.giftTyeDone?(tyeSelectGift.row,self.tyeGiftCount,self.tyeUserArray[self.tyeSelectUserIndex.row].roomUserName,self.tyeUserArray[self.tyeSelectUserIndex.row].roomUserId)
            }
            
        }
    }
    
    func trendTalkGiftDismis(){
        
        if tayneCrowdStyle.keys.contains(TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")) == true {
            tayneCrowdStyle[TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")] = TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")
        }
        
        
        if tayneCrowdStyle.count > 0 {
            tayneStyleSnapState.append(0)
        }
        
        
        self.snp.updateConstraints { make in
            make.bottom.equalToSuperview().offset(442)
        }
        UIView.animate(withDuration: 0.235) {
            self.superview?.layoutIfNeeded()
        } completion: { _ in
            self.tyeBlackAlphaView?.removeFromSuperview()
            self.tayneCrowdStyle.removeAll()
            self.removeFromSuperview()
        }
    }
    
}


extension TayneTrendTalkGiftAlertView:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            if collectionView == tyeUserCollection {
                return tyeUserArray.count
            }else{
                return 6
            }
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            
            if collectionView == tyeUserCollection {
                let tyeUserCell = collectionView.dequeueReusableCell(withClass: TyeUserCollectionViewCell.self, for: indexPath)
                if tyeSelectUserIndex == indexPath {
                    tyeUserCell.tyeUserImage.layerBorderWidth = 2
                }else{
                    tyeUserCell.tyeUserImage.layerBorderWidth = 0
                }
                tyeUserCell.tyeUserImage.image = UIImage(named: tyeUserArray[indexPath.row].roomUserId)
                return tyeUserCell
            }else{
                let giftTyeCell = collectionView.dequeueReusableCell(withClass: TrendTalkGiftCollectionViewCell.self, for: indexPath)
                giftTyeCell.giftTyeImage.image = UIImage(named: "tayneGift" + "\(indexPath.row)")
                let giftTotalDatas = [29,69,129,329,1020,2100]
                giftTyeCell.giftCreditTyeCount.setTitle(" \(giftTotalDatas[indexPath.row])", for: .normal)
                if tyeSelectGift == indexPath {
                    giftTyeCell.layerBorderWidth = 2
                }else{
                    giftTyeCell.layerBorderWidth = 0
                }
                return giftTyeCell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tyeUserCollection {
            tyeSelectUserIndex = indexPath
        }else{
            tyeSelectGift = indexPath
        }
        UIView.performWithoutAnimation {
            collectionView.reloadData {}
        }
    }
}
