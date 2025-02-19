//
//  TyeChallengeDetailViewController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/10.
//

import UIKit
import SnapKit


class TyeChallengeDetailViewController: TayneBaseViewController {
    
    var tayneCrowdStyle:[String:Any] = [:]
    @IBOutlet weak var infoTyContainer: UIView!
    
    @IBOutlet weak var challengeDetailCollection: UICollectionView!
    
    var tayneStyleSnapState:[Any] = []
    
    var hairTyeChallenge:HairChallengeModel?
    
    var tyeTmpParticipantList:[Participant] = []
    
    var tyeChicChroniclesState = 0
    
    var tyeDirection = 0
    @IBOutlet weak var emptyTyeView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let hairTyeChallenge = self.hairTyeChallenge {
            tyeTmpParticipantList = hairTyeChallenge.participantList.filter({ tyeParticipant in
                if TayneManager.default.tyeDataStore?.string(forKey: TayneConfig.tyeTransformInput("toyqetBwlyahcskwUqsieerkIbD") + tyeParticipant.challengesId) != nil {
                    return false
                }
                return true
            })
            
            emptyTyeView.isHidden = !tyeTmpParticipantList.isEmpty
            
            challengeDetailCollection.reloadData {
                
            }
        }
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
        
        let tyeMoreButton = UIBarButtonItem(image: UIImage(named: "TyeReportOrBlack")!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(tyeMoreButtonEvent))
        navigationItem.rightBarButtonItem = tyeMoreButton
        
        tyeConfigSubViews()
    }
    
    
    
    func tyeConfigSubViews(){
        
        if tyeDirection == 1 {
            if let styleQuestSecondView = Bundle.main.loadNibNamed("StyleQuestSecondTableViewCell", owner: nil, options: nil)?.first as? StyleQuestSecondTableViewCell {
                
                let styleQuestContentView = styleQuestSecondView.contentView
                infoTyContainer.addSubview(styleQuestContentView)
                styleQuestContentView.snp.makeConstraints { make in
                    make.edges.equalToSuperview().inset(0)
                }
                
                styleQuestSecondView.challengeTyeName.text = hairTyeChallenge!.challengeName
                styleQuestSecondView.challengeTyeInfoDesc.text = hairTyeChallenge!.challengeDescription
                styleQuestSecondView.challengeTyeImage.image = UIImage(named: hairTyeChallenge!.challengeId)
                styleQuestSecondView.challengeTyHotButton.setTitle(" \(hairTyeChallenge!.totalPageviews)", for: .normal)
            }
        }else{
            if let styleQuestView = Bundle.main.loadNibNamed("StyleQuestTableViewCell", owner: nil, options: nil)?.first as? StyleQuestTableViewCell {
                
                let styleQuestContentView = styleQuestView.contentView
                infoTyContainer.addSubview(styleQuestContentView) // 加入当前视图
                styleQuestContentView.snp.makeConstraints { make in
                    make.edges.equalToSuperview().inset(0)
                }
                
                styleQuestView.challengeTyeName.text = hairTyeChallenge!.challengeName
                styleQuestView.challengeTyeInfoDesc.text = hairTyeChallenge!.challengeDescription
                styleQuestView.challengeTyeImage.image = UIImage(named: hairTyeChallenge!.challengeId)
                styleQuestView.challengeTyHotButton.setTitle(" \(hairTyeChallenge!.totalPageviews)", for: .normal)
            }
        }
        
        let detailChallecgeLayout = UICollectionViewFlowLayout()
        
        tayneCrowdStyle[TayneConfig.tyeTransformInput("crorndfniqgoTtynpzelDoezs")] = TayneConfig.tayneFilter.configTypeDes
        detailChallecgeLayout.scrollDirection = .vertical
        detailChallecgeLayout.itemSize = CGSizeMake((UIScreen.main.bounds.size.width - 40)/2, 230)
        detailChallecgeLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 15, right: 15)
        if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
            tayneCrowdStyle["tayneStyleSnapState"] = 200
        }
        detailChallecgeLayout.minimumInteritemSpacing = 10
        detailChallecgeLayout.minimumLineSpacing = 10
        
        if tayneCrowdStyle.keys.contains(TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")) == false {
            tayneCrowdStyle[TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")] = TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")
        }
        
        challengeDetailCollection.setCollectionViewLayout(detailChallecgeLayout, animated: true)
        challengeDetailCollection.register(nibWithCellClass: TyeChallengeDetailCell.self)
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
                TayneManager.default.tyeDataStore?.set(self.hairTyeChallenge!.challengeId, forKey: TayneConfig.tyeTransformInput("taylebBrlyaychkhIuD") + self.hairTyeChallenge!.challengeId)
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
    
    @IBAction func joinChallengeEvent(_ sender: Any) {
        let tyeJoinChallengeVC = TyeJoinChallengeViewController(nibName: "TyeJoinChallengeViewController", bundle: nil)
        navigationController?.pushViewController(tyeJoinChallengeVC)
    }
    
}

extension TyeChallengeDetailViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            return tyeTmpParticipantList.count
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            let tyeChallengeDetailCell = collectionView.dequeueReusableCell(withClass: TyeChallengeDetailCell.self, for: indexPath)
            if let hairTyeChallenge = hairTyeChallenge {
                let participant = tyeTmpParticipantList[indexPath.row]
                tyeChallengeDetailCell.challengeImage.image = UIImage(named: participant.userChallengePics[indexPath.row])
                tyeChallengeDetailCell.tyeUserIcon.image = UIImage(named: participant.challengesId)
                
                tyeChallengeDetailCell.tyeUserIconTaped = { [weak self] in
                    guard let self = self else { return }
                    
                    if let tyeNow = TayneManager.default.tyeNow.value,tyeNow.roomUserId != participant.challengesId {
                        let tyeChicChroniclesVC = TyeChicChroniclesViewController(nibName: "TyeChicChroniclesViewController", bundle: nil)
                        tyeChicChroniclesVC.tyeParticipant = participant
                        self.navigationController?.pushViewController(tyeChicChroniclesVC)
                    }else{
                        NotificationCenter.default.post(name: NSNotification.Name(TayneConfig.tyeTransformInput("goohttojCneenttkewr")), object: nil)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            self.navigationController?.popViewController(animated: false)
                        }
                    }
                }
            }
            
            
            return tyeChallengeDetailCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let challengerDetailVC = ChallengerDetailViewController(nibName: "ChallengerDetailViewController", bundle: nil)
        challengerDetailVC.tyeParticipant = tyeTmpParticipantList[indexPath.row]
        navigationController?.pushViewController(challengerDetailVC, animated: true)
        
    }
}

