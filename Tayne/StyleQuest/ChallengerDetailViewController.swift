//
//  ChallengerDetailViewController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/11.
//

import UIKit
import RxGesture

class ChallengerDetailViewController: TayneBaseViewController {

    var tayneCrowdStyle:[String:Any] = [:]
    
    @IBOutlet weak var challengeDetailCollection: UICollectionView!
    var tayneStyleSnapState:[Any] = []
    
    var tyeParticipant:Participant?
    
    var tyeChicChroniclesState = 0
    
    @IBOutlet weak var taynePageControl: UIPageControl!
    @IBOutlet weak var challengerImage: UIImageView!
    @IBOutlet weak var challengerName: UILabel!
    @IBOutlet weak var challengerDetail: UILabel!
    @IBOutlet weak var isTyeLikeButton: UIButton!
    @IBOutlet weak var isTyeFollow: UIButton!
    @IBOutlet weak var numberOfLiker: UILabel!
    
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
        
        let tyeMoreButton = UIBarButtonItem(image: UIImage(named: "TyeReportOrBlack")!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(tyeMoreButtonEvent))
        navigationItem.rightBarButtonItem = tyeMoreButton
        
        tyeConfigSubViews()
    }
    
    func tyeConfigSubViews(){
        
        let challengeDetailCollectionLayout = UICollectionViewFlowLayout()
        
        tayneCrowdStyle[TayneConfig.tyeTransformInput("crorndfniqgoTtynpzelDoezs")] = TayneConfig.tayneFilter.configTypeDes
        challengeDetailCollectionLayout.scrollDirection = .horizontal
        challengeDetailCollectionLayout.itemSize = UIScreen.main.bounds.size
        challengeDetailCollectionLayout.sectionInset = .zero
        if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
            tayneCrowdStyle["tayneStyleSnapState"] = 200
        }
        challengeDetailCollectionLayout.minimumInteritemSpacing = 0
        challengeDetailCollectionLayout.minimumLineSpacing = 0
        
        if tayneCrowdStyle.keys.contains(TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")) == false {
            tayneCrowdStyle[TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")] = TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")
        }
        
        challengeDetailCollection.setCollectionViewLayout(challengeDetailCollectionLayout, animated: true)
        challengeDetailCollection.register(nibWithCellClass: ChallengerDetailCollectionViewCell.self)
        challengeDetailCollection.isPagingEnabled = true
        challengeDetailCollection.bounces = false
        
        challengerImage.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else {return}
                let tyeChicChroniclesVC = TyeChicChroniclesViewController(nibName: "TyeChicChroniclesViewController", bundle: nil)
                tyeChicChroniclesVC.tyeParticipant = self.tyeParticipant
                self.navigationController?.pushViewController(tyeChicChroniclesVC)
            })
            .disposed(by: rx.disposeBag)
        
        if let tyeParticipant = tyeParticipant {
            taynePageControl.numberOfPages = tyeParticipant.userChallengePics.count
            challengerImage.image = UIImage(named: tyeParticipant.challengesId)
            challengerName.text = tyeParticipant.userTyeDisplayName
            challengerDetail.text = tyeParticipant.challengeCaption
            
            if TayneManager.default.tyeDataStore?.string(forKey: TayneConfig.tyeTransformInput("ThaiyundeoLcixkveaUksaecr") + tyeParticipant.challengesId) != nil {
                isTyeLikeButton.isSelected = true
            }
            
            if TayneManager.default.tyeDataStore?.string(forKey: TayneConfig.tyeTransformInput("TnahylncecFroalilzolwfUgssewr") + tyeParticipant.challengesId) != nil {
                isTyeFollow.isSelected = true
            }
        }
        
    }

    @IBAction func isTyeLikeButtonEvent(_ sender: UIButton) {
        if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
            tayneCrowdStyle["tayneStyleSnapState"] = 200
            sender.isSelected.toggle()
            
            if tayneCrowdStyle.count > 0 && tayneCrowdStyle.isEmpty == false {
                tayneStyleSnapState.append(contentsOf: Array(tayneCrowdStyle.keys))
            }
            
            tayneStyleSnapState.append([1,TayneConfig.tayneFilter.configTypeDes])
            
            if let tyeParticipant = tyeParticipant {
                if sender.isSelected == true &&  tayneStyleSnapState.firstIndex(where: {($0 as? Int) == 0}) != nil {
                    TayneManager.default.tyeDataStore?.set(tyeParticipant.challengesId, forKey: TayneConfig.tyeTransformInput("ThaiyundeoLcixkveaUksaecr") + tyeParticipant.challengesId)
                }else{
                    TayneManager.default.tyeDataStore?.removeValue(forKey: TayneConfig.tyeTransformInput("ThaiyundeoLcixkveaUksaecr") + tyeParticipant.challengesId)
                }
            }
        }
    }
    
    
    @IBAction func isTyeFollowEvent(_ sender: UIButton) {
        if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
            tayneCrowdStyle["tayneStyleSnapState"] = 200
            
            if tayneCrowdStyle.count > 0 && tayneCrowdStyle.isEmpty == false {
                tayneStyleSnapState.append(contentsOf: Array(tayneCrowdStyle.keys))
            }
            
            tayneStyleSnapState.append([1,TayneConfig.tayneFilter.configTypeDes])
            
            if let tyeParticipant = tyeParticipant , tayneStyleSnapState.firstIndex(where: {($0 as? Int) == 0}) != nil  {
                
                if TayneManager.default.tyeDataStore?.string(forKey: TayneConfig.tyeTransformInput("TnahylncecFroalilzolwfUgssewr") + tyeParticipant.challengesId) != nil {
                    if let tresTalesIndex = TayneManager.default.trendTalkDatas.firstIndex(where: {$0.tyeTrankTalkRoomName == tyeParticipant.userTyeDisplayName}) {
                        let tressTalesVC = TressTalesViewController(nibName: "TressTalesViewController", bundle: nil)
                        tressTalesVC.tresTalesIndex = tresTalesIndex
                        navigationController?.pushViewController(tressTalesVC)
                    }else{
                        var tyeInfomation = TalkInfomationModel()
                        tyeInfomation.tyeAura = 0
                        tyeInfomation.tyeFromId = tyeParticipant.challengesId
                        tyeInfomation.tyeFrom = tyeParticipant.userTyeDisplayName
                        tyeInfomation.tyeTrankTalkRoomName = tyeParticipant.userTyeDisplayName
                        TayneManager.default.trendTalkDatas.insert(tyeInfomation, at: 0)
                        
                        let tressTalesVC = TressTalesViewController(nibName: "TressTalesViewController", bundle: nil)
                        navigationController?.pushViewController(tressTalesVC)
                    }
                }else{
                    TayneManager.default.tyeDataStore?.set(tyeParticipant.challengesId, forKey: TayneConfig.tyeTransformInput("TnahylncecFroalilzolwfUgssewr") + tyeParticipant.challengesId)
                }
            }
        }
    }
    
    @objc func tyeMoreButtonEvent(){
        tyeChicChroniclesState = 0
        let tyeAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let tyeReport = UIAlertAction(title: TayneConfig.tyeTransformInput("Rgelproeret"), style: .default) {[weak self] _ in
            guard let self = self else {return}
            let tyeReportTypeVC = TyeReportTypeViewController(nibName: "TyeReportTypeViewController", bundle: nil)
            self.navigationController?.pushViewController(tyeReportTypeVC)
        }
        
        tayneStyleSnapState.append(tyeChicChroniclesState)
        
        tyeAlertController.addAction(tyeReport)
        
        let tyeBlackText = TayneConfig.tyeTransformInput("Bhliaiczkalcissyt")
        let tyeBlick = UIAlertAction(title: tyeBlackText, style: .default) {[weak self] _ in
            guard let self = self else {return}
            self.tayneStyleSnapState.append(TayneConfig.tyeTransformInput("CramlflaRgeqproprxt"))
            TayneHud.showLoading()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                TayneHud.hidenLooding()
                TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Bdldaxclkrluiksztmegd"),afterDelay: 2.0)
                TayneManager.default.tyeDataStore?.set(self.tyeParticipant!.challengesId, forKey: TayneConfig.tyeTransformInput("toyqetBwlyahcskwUqsieerkIbD") + self.tyeParticipant!.challengesId)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.navigationController?.popViewController()
                }
            }
        }
        
        tayneStyleSnapState.append(tyeChicChroniclesState+1)
        
        if tayneCrowdStyle.count > 0 && tayneCrowdStyle.isEmpty == false {
            tayneStyleSnapState.append(contentsOf: Array(tayneCrowdStyle.keys))
            tyeAlertController.addAction(tyeBlick)
        }
        
        
        if tayneCrowdStyle.isEmpty == false &&  tayneCrowdStyle.count > 0{
            if tyeBlackText.count > 0 && tyeChicChroniclesState >= 0 {
                let tyeCancelText = TayneConfig.tyeTransformInput("Chajngcvevl")
                if tyeCancelText.isEmpty == false {
                    let tyeCancel = UIAlertAction(title: tyeCancelText, style: .cancel)
                    tyeAlertController.addAction(tyeCancel)
                    
                    if tyeCancelText.count > 0 {
                        self.present(tyeAlertController, animated: true, completion: nil)
                    }
                }
                
            }
        }
    }
    
}

extension ChallengerDetailViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            
            return tyeParticipant?.userChallengePics.count ?? 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            let challengerDetailCell = collectionView.dequeueReusableCell(withClass: ChallengerDetailCollectionViewCell.self, for: indexPath)
            if let tyeParticipant = tyeParticipant {
                challengerDetailCell.challengeJoinImage.image = UIImage(named: tyeParticipant.userChallengePics[indexPath.row])
            }
            return challengerDetailCell
        }
        return UICollectionViewCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        taynePageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.size.width)
    }
}
