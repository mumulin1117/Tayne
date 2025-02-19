//
//  TyeChicChroniclesViewController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/11.
//

import UIKit
import RxCocoa
import RxSwift

class TyeChicChroniclesViewController: TayneBaseViewController {

    var tayneCrowdStyle:[String:Any] = [:]
    
    var tayneStyleSnapState:[Any] = []
    @IBOutlet weak var tyeUserImageTop: NSLayoutConstraint!
    @IBOutlet weak var scrollViewTop: NSLayoutConstraint!
    
    @IBOutlet weak var tyeEmptyView: UIView!
    @IBOutlet weak var tyeCredictNumber: UILabel!
    var tyeChicChroniclesState = 0
    @IBOutlet weak var tyeUserIconImage: UIImageView!
    
    var tyeParticipant:Participant?
    
    @IBOutlet weak var profileTyeButton1: UIButton!
    @IBOutlet weak var profileTyeButton2: UIButton!
    @IBOutlet weak var profileTyeButton3: UIButton!
    @IBOutlet weak var userTyeDisplayName: UILabel!
    @IBOutlet weak var tyeFollowNumber: UILabel!
    @IBOutlet weak var tyeFollowerNumber: UILabel!
    @IBOutlet weak var challengeTyeImage: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(self.navigationController?.viewControllers.count ?? 0 == 1, animated: true)
    }
    
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
        
        if self.navigationController?.viewControllers.count ?? 0 > 1 {
            tyeUserImageTop.constant = 0
            scrollViewTop.constant = 111
            let tyeMoreButton = UIBarButtonItem(image: UIImage(named: "TyeReportOrBlack")!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(tyeMoreButtonEvent))
            navigationItem.rightBarButtonItem = tyeMoreButton
        }else{
            profileTyeButton2.isHidden = true
            profileTyeButton3.isHidden = true
            profileTyeButton1.setBackgroundImage(UIImage(named: "TyeSetting"), for: .normal)
        }
        
        if let _ = tyeParticipant {
            tyeUserProfileUpdate()
        }else{
            // 自己的主页
            TayneManager.default.tyeNow
                .compactMap { $0 }
                .subscribe(onNext: { tyeNow in
                    
                    if tyeNow.roomUserId.count > 0 {
                        self.tayneStyleSnapState.append(tyeNow.roomUserId)
                        self.tyeCredictNumber.text = "\(tyeNow.tayneCredit)"
                        if tyeNow.roomUserId == tyeNow.roomUserName {
                            self.tyeUserIconImage.image = UIImage.tayneAppLogo
                        }else{
                            self.tyeUserIconImage.image = UIImage(named: tyeNow.roomUserId)
                        }
                        
                        self.tyeFollowNumber.text = "\(tyeNow.tyeFollowNumber)"
                        self.tyeFollowerNumber.text = "\(tyeNow.tyeFollowerNumber)"
                        
                        if self.tayneStyleSnapState.isEmpty == false {
                            self.tayneCrowdStyle["now"] = tyeNow.roomUserId
                            
                            if let tyeChallenge = TayneManager.default.hairsChallenges.first(where: { hairChallengeModel in
                                if let _ = hairChallengeModel.participantList.first(where: { participant in
                                    return participant.challengesId == tyeNow.roomUserId
                                }){
                                    return true
                                }else{
                                    return false
                                }
                            }){
                                self.challengeTyeImage.image = UIImage(named: tyeChallenge.challengeId)
                                self.tyeEmptyView.isHidden = true
                            }
                            
                            self.userTyeDisplayName.text = tyeNow.roomUserName
                            
                        }
                    }
                })
                .disposed(by: rx.disposeBag)
        }
        
    }
    
    func tyeUserProfileUpdate(){
        
        guard let tyeParticipant = tyeParticipant else {return}
        
        self.tayneStyleSnapState.append(tyeParticipant.challengesId)
        self.tyeUserIconImage.image = UIImage(named: tyeParticipant.challengesId)
        
        if TayneManager.default.tyeDataStore?.string(forKey: TayneConfig.tyeTransformInput("tfywemFfolljlgonwzelr") + tyeParticipant.challengesId) != nil {
            profileTyeButton3.isSelected = true
        }
        
        if let tyeNow = TayneManager.default.tayneTalkers.first(where: {$0.roomUserId == tyeParticipant.challengesId}) {
            self.tyeFollowNumber.text = "\(tyeNow.tyeFollowNumber)"
            self.tyeFollowerNumber.text = "\(tyeNow.tyeFollowerNumber)"
        }
        userTyeDisplayName.text = tyeParticipant.userTyeDisplayName
        
        if self.tayneStyleSnapState.isEmpty == false {
            self.tayneCrowdStyle["now"] = tyeParticipant.challengesId
            if tyeParticipant.userChallengePics.count > 0 {
                self.challengeTyeImage.image = UIImage(named: tyeParticipant.userChallengePics[0])
            }else{
                self.challengeTyeImage.image = nil
            }
            self.tyeEmptyView.isHidden = true
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                
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
    
    @IBAction func tyeChichroniclesEvent(_ sender: UIButton) {
        
        tayneCrowdStyle[TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")] = TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")
        
        if sender.tag == 10002 {
            // 充值
            let tyeStyleCreditVC = TyeStyleCreditViewController(nibName: "TyeStyleCreditViewController", bundle: nil)
            tyeStyleCreditVC.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(tyeStyleCreditVC)
            return
        }
        
        if sender.tag == 201 {
            if self.navigationController?.viewControllers.count ?? 0 > 1 {
                var trendTalkRoom = TrendTalkRoom()
                trendTalkRoom.roomUserId = tyeParticipant!.challengesId
                trendTalkRoom.roomUserName = tyeParticipant!.userTyeDisplayName
                
                let tayneSessionVC = TayneSessionViewController()
                tayneSessionVC.trendTalkRoom = trendTalkRoom
                navigationController?.pushViewController(tayneSessionVC)
            }else{
                let tayneSettingVC = TayneSettingViewController(nibName: "TayneSettingViewController", bundle: nil)
                tayneSettingVC.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(tayneSettingVC)
            }
        }
        
        if sender.tag == 202 {
            if let tresTalesIndex = TayneManager.default.trendTalkDatas.firstIndex(where: {$0.tyeTrankTalkRoomName == self.tyeParticipant!.userTyeDisplayName}) {
                let tressTalesVC = TressTalesViewController(nibName: "TressTalesViewController", bundle: nil)
                tressTalesVC.tresTalesIndex = tresTalesIndex
                navigationController?.pushViewController(tressTalesVC)
            }else{
                var tyeInfomation = TalkInfomationModel()
                tyeInfomation.tyeAura = 0
                tyeInfomation.tyeFromId = self.tyeParticipant!.challengesId
                tyeInfomation.tyeFrom = self.tyeParticipant!.userTyeDisplayName
                tyeInfomation.tyeTrankTalkRoomName = self.tyeParticipant!.userTyeDisplayName
                TayneManager.default.trendTalkDatas.insert(tyeInfomation, at: 0)
                
                let tressTalesVC = TressTalesViewController(nibName: "TressTalesViewController", bundle: nil)
                navigationController?.pushViewController(tressTalesVC)
            }
            
        }
        
        if sender.tag == 203 {
            sender.isSelected.toggle()
            
            if tayneCrowdStyle.count > 0 {
                tayneStyleSnapState.append(0)
            }
            
            if sender.isSelected {
                TayneManager.default.tyeDataStore?.set(tyeParticipant!.challengesId, forKey: TayneConfig.tyeTransformInput("tfywemFfolljlgonwzelr") + tyeParticipant!.challengesId)
                
            }else{
                TayneManager.default.tyeDataStore?.removeValue(forKey: TayneConfig.tyeTransformInput("tfywemFfolljlgonwzelr") + tyeParticipant!.challengesId)
            }
            
            if let tyeFindIndex = TayneManager.default.tayneTalkers.firstIndex(where: {$0.roomUserId == tyeParticipant!.challengesId}) {
                var tayneTalker = TayneManager.default.tayneTalkers[tyeFindIndex]
                if sender.isSelected {
                    tayneTalker.tyeFollowerNumber += 1
                }else{
                    tayneTalker.tyeFollowerNumber -= 1
                }
                
                self.tyeFollowNumber.text = "\(tayneTalker.tyeFollowNumber)"
                self.tyeFollowerNumber.text = "\(tayneTalker.tyeFollowerNumber)"
                TayneManager.default.tayneTalkers[tyeFindIndex] = tayneTalker
            }
        }
    }
    

}


