//
//  TyeStyleQuestViewController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/10.
//

import UIKit
import RxGesture

class TyeStyleQuestViewController: TayneBaseViewController {

    @IBOutlet weak var styleQuestTable: UITableView!
    @IBOutlet weak var styleQuestCollection: UICollectionView!
    @IBOutlet weak var tyeAiImage: UIImageView!
    @IBOutlet weak var aiBottomTyeConstraint: NSLayoutConstraint!
    
    var tayneCrowdStyle:[String:Any] = [:]
    
    var tayneStyleSnapState:[Any] = []
    
    var tyeSelectMenu:UIButton?
    
    var allStyleQuest:[HairChallengeModel] = []
    var allStyleQuestUser:[TrendTalkRoom] = []
    
    var nowTyePage = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        fetchTayneAllQuest(nowTyePage: self.nowTyePage, tyeParams: self.tayneCrowdStyle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if tayneCrowdStyle.count > 0 {
            tayneStyleSnapState.append(0)
        }
        
        tayneStyleSnapState.append([1,TayneConfig.tayneFilter.configTypeDes])
        
        tayneCrowdStyle[TayneConfig.tyeTransformInput("crorndfniqgoTtynpzelDoezs")] = TayneConfig.tayneFilter.configTypeDes
        
        if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
            tayneCrowdStyle["tayneStyleSnapState"] = 200
        }
        
        tyeConfigSubViews()
    }
    
    func tyeConfigSubViews(){
        
        func topSwitchControlConfig(senderTag:Int){
            if let tyeSelectMenu = self.view.viewWithTag(10000 + senderTag) as? UIButton {
                tyeSelectMenu.layerCornerRadius = 19
                tyeSelectMenu.layer.masksToBounds = true
                tyeSelectMenu.layerBorderWidth = 1
                tyeSelectMenu.layerBorderColor = .white.withAlphaComponent(0.7)
                if tyeSelectMenu.tag == 10001 {
                    self.tyeSelectMenu = tyeSelectMenu
                    tyeSelectMenu.layerBorderWidth = 0
                }
            }
        }
        
        topSwitchControlConfig(senderTag: 1)
        topSwitchControlConfig(senderTag: 2)
        topSwitchControlConfig(senderTag: 3)
        
        let hasHomeIndicator = UIDevice.current.userInterfaceIdiom == .phone && UIScreen.main.bounds.height >= 812
        aiBottomTyeConstraint.constant = (hasHomeIndicator ? 34.0 : 0.0) + 38
        
        tyeAiImage.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else {
                    return
                }
                let hairstyleGenerationVC = HairstyleGenerationViewController(nibName: "HairstyleGenerationViewController", bundle: nil)
                hairstyleGenerationVC.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(hairstyleGenerationVC)
            })
            .disposed(by: rx.disposeBag)
        
        styleQuestTable.register(nib: UINib(nibName: "StyleQuestTableViewCell", bundle: nil), withCellClass: StyleQuestTableViewCell.self)
        styleQuestTable.register(nib: UINib(nibName: "StyleQuestSecondTableViewCell", bundle: nil), withCellClass: StyleQuestSecondTableViewCell.self)
        
        if tayneCrowdStyle.count > 0 && tayneCrowdStyle.isEmpty == false {
            tayneStyleSnapState.append(contentsOf: Array(tayneCrowdStyle.keys))
        }
        
        let styleQuestCollectionLayout = UICollectionViewFlowLayout()
        
        tayneCrowdStyle[TayneConfig.tyeTransformInput("crorndfniqgoTtynpzelDoezs")] = TayneConfig.tayneFilter.configTypeDes
        styleQuestCollectionLayout.scrollDirection = .horizontal
        styleQuestCollectionLayout.itemSize = CGSizeMake(66, 66)
        styleQuestCollectionLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
            tayneCrowdStyle["tayneStyleSnapState"] = 200
        }
        styleQuestCollectionLayout.minimumInteritemSpacing = 15
        styleQuestCollectionLayout.minimumLineSpacing = 15
        
        if tayneCrowdStyle.keys.contains(TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")) == false {
            tayneCrowdStyle[TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")] = TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")
        }
        
        styleQuestCollection.setCollectionViewLayout(styleQuestCollectionLayout, animated: true)
        
    }
    
    func fetchTayneAllQuest(nowTyePage:Int,tyeParams:[String:Any],tyeSwitch:Bool = false){
        
        if nowTyePage >= 0 {
            if tyeSwitch {
                TayneHud.showLoading()
            }else{
                if allStyleQuest.count == 0 && allStyleQuestUser.count == 0 {
                    TayneHud.showLoading()
                }
            }
            let tyeOperationQueue = OperationQueue()
            tyeOperationQueue.addOperation {
                
                if tyeSwitch {
                    sleep(2)
                }else{
                    if self.allStyleQuest.count == 0 && self.allStyleQuestUser.count == 0 {
                        sleep(2)
                    }
                }
                
                var allStyleQuest:[HairChallengeModel] = []
                var allStyleQuestUser:[TrendTalkRoom] = []
                if self.allStyleQuest.count == 0 , self.tayneStyleSnapState.count > 0 {
                    allStyleQuest = TayneManager.default.hairsChallenges.filter({ hairChallengeModel in
                        var tmpChallenge = ""
                        if hairChallengeModel.challengeId.count > 0 {
                            tmpChallenge = hairChallengeModel.challengeId + hairChallengeModel.challengeDescription
                        }
                        
                        if tmpChallenge.count > 0 {
                            // 拉黑的
                            if TayneManager.default.tyeDataStore?.string(forKey: TayneConfig.tyeTransformInput("taylebBrlyaychkhIuD") + hairChallengeModel.challengeId) != nil {
                                return false
                            }
                            
                        }
                        
                        return true
                        
                    })
                    
                }else{
                    allStyleQuest = self.allStyleQuest.filter({ hairChallengeModel in
                        var tmpChallenge = ""
                        if hairChallengeModel.challengeId.count > 0 {
                            tmpChallenge = hairChallengeModel.challengeId + hairChallengeModel.challengeDescription
                        }
                        
                        if tmpChallenge.count > 0 {
                            // 拉黑的
                            if TayneManager.default.tyeDataStore?.string(forKey: TayneConfig.tyeTransformInput("taylebBrlyaychkhIuD") + hairChallengeModel.challengeId) != nil {
                                return false
                            }
                        }
                        
                        return true
                        
                    })
                    
                }
                
                if tyeSwitch {
                    allStyleQuest.shuffle()
                }
                
                if tyeParams.count >= 0 && self.nowTyePage >= 0 {
                    if self.allStyleQuestUser.count == 0 , self.tayneCrowdStyle.count > 0 {
                        allStyleQuestUser = TayneManager.default.tayneTalkers.filter({ tayneTalker in
                            var tmpChallenge = ""
                            if tayneTalker.roomUserId.count > 0 {
                                tmpChallenge = tayneTalker.roomUserId + tayneTalker.roomUserName
                            }
                            
                            if tmpChallenge.count > 0 {
                                // 拉黑的用户
                                if TayneManager.default.tyeDataStore?.string(forKey: TayneConfig.tyeTransformInput("toyqetBwlyahcskwUqsieerkIbD") + tayneTalker.roomUserId) != nil {
                                    return false
                                }
                                
                                if let tyeNow = TayneManager.default.tyeNow.value , tayneTalker.roomUserId == tyeNow.roomUserId {
                                    return false
                                }
                                
                                if let tyeNow = TayneManager.default.tyeNow.value {
                                    if tayneTalker.roomUserId == tyeNow.roomUserId {
                                        return false
                                    }
                                }
                                
                            }
                            
                            return true
                            
                        })
                        
                        allStyleQuestUser.shuffle()
                    }else{
                        allStyleQuestUser = self.allStyleQuestUser.filter({ tayneTalker in
                            var tmpChallenge = ""
                            if tayneTalker.roomUserId.count > 0 {
                                tmpChallenge = tayneTalker.roomUserId + tayneTalker.roomUserName
                            }
                            
                            if tmpChallenge.count > 0 {
                                
                                if TayneManager.default.tyeDataStore?.string(forKey: TayneConfig.tyeTransformInput("toyqetBwlyahcskwUqsieerkIbD") + tayneTalker.roomUserId) != nil {
                                    return false
                                }
                            }
                            
                            return true
                            
                        })
                    }
                }
                
                OperationQueue.main.addOperation {
                    self.nowTyePage += 1
                    self.tayneCrowdStyle["state"] = "tyeParamsDone"
                    self.allStyleQuest = allStyleQuest
                    self.allStyleQuestUser = allStyleQuestUser
                    UIView.performWithoutAnimation {
                        self.styleQuestTable.reloadData {
                            TayneHud.hidenLooding()
                        }
                        
                        self.styleQuestCollection.reloadData {
                            
                        }
                    }
                }
            }
        }
        
    }
    
    @IBAction func styleQuestNotification(_ sender: Any) {
        let tressTalesVC = TressTalesViewController(nibName: "TressTalesViewController", bundle: nil)
        tressTalesVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(tressTalesVC)
    }
    
    
    @IBAction func topSwitchMenu(_ sender: UIButton) {
        
        guard tyeSelectMenu != sender else {
            return
        }
        
        sender.isSelected.toggle()
        sender.layerBorderWidth = 0
        tyeSelectMenu?.isSelected.toggle()
        tyeSelectMenu?.layerBorderWidth = 1
        tyeSelectMenu?.layerBorderColor = .white.withAlphaComponent(0.7)
        
        tyeSelectMenu = sender
        
        UIView.performWithoutAnimation {
            self.fetchTayneAllQuest(nowTyePage: self.nowTyePage, tyeParams: self.tayneCrowdStyle,tyeSwitch: true)
        }
        
    }
    
    @IBAction func styleQuestAddEvent(_ sender: Any) {
        let publishChallengeVC = PublishChallengeViewController(nibName: "PublishChallengeViewController", bundle: nil)
        publishChallengeVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(publishChallengeVC)
    }
    
    
}

extension TyeStyleQuestViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            return allStyleQuest.count
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            return 1
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            return 0.01
        }
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            return 15.0
        }
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            if indexPath.section % 2 != 0 {
                let styleQuestSecondCell = tableView.dequeueReusableCell(withClass: StyleQuestSecondTableViewCell.self)
                styleQuestSecondCell.challengeTyeName.text = allStyleQuest[indexPath.section].challengeName
                styleQuestSecondCell.challengeTyeInfoDesc.text = allStyleQuest[indexPath.section].challengeDescription
                styleQuestSecondCell.challengeTyeImage.image = UIImage(named: allStyleQuest[indexPath.section].challengeId)
                styleQuestSecondCell.challengeTyHotButton.setTitle(" \(allStyleQuest[indexPath.section].totalPageviews)", for: .normal)
                return styleQuestSecondCell
            }else{
                let styleQuestCell = tableView.dequeueReusableCell(withClass: StyleQuestTableViewCell.self)
                styleQuestCell.challengeTyeName.text = allStyleQuest[indexPath.section].challengeName
                styleQuestCell.challengeTyeInfoDesc.text = allStyleQuest[indexPath.section].challengeDescription
                styleQuestCell.challengeTyeImage.image = UIImage(named: allStyleQuest[indexPath.section].challengeId)
                styleQuestCell.challengeTyHotButton.setTitle(" \(allStyleQuest[indexPath.section].totalPageviews)", for: .normal)
                return styleQuestCell
            }
        }
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            
            let tyeChallengeDetailVC = TyeChallengeDetailViewController(nibName: "TyeChallengeDetailViewController", bundle: nil)
            tyeChallengeDetailVC.hidesBottomBarWhenPushed = true
            tyeChallengeDetailVC.hairTyeChallenge = allStyleQuest[indexPath.section]
            tyeChallengeDetailVC.tyeDirection = indexPath.section % 2 == 0 ? 0 : 1
            navigationController?.pushViewController(tyeChallengeDetailVC)
        }
    }
}

extension TyeStyleQuestViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            return allStyleQuestUser.count
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            let styleQuestUserCell = collectionView.dequeueReusableCell(withClass: StyleQuestUserCollectionViewCell.self, for: indexPath)
            styleQuestUserCell.styleQuestUserImage.image = UIImage(named: allStyleQuestUser[indexPath.row].roomUserId)
            return styleQuestUserCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let tyeParticipant = Participant(challengesId: allStyleQuestUser[indexPath.row].roomUserId,
                                         userTyeDisplayName: allStyleQuestUser[indexPath.row].roomUserName,
                                         challengeCaption: "",
                                         userChallengePics: [])
        let tyeChicChroniclesVC = TyeChicChroniclesViewController(nibName: "TyeChicChroniclesViewController", bundle: nil)
        tyeChicChroniclesVC.tyeParticipant = tyeParticipant
        tyeChicChroniclesVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(tyeChicChroniclesVC)
    }
}
