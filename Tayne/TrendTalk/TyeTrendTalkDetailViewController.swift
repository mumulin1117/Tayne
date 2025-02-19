//
//  TyeTrendTalkDetailViewController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/12.
//

import UIKit
import RxSwift
import RxCocoa

class TyeTrendTalkDetailViewController: TayneBaseViewController {
    
    var tayneCrowdStyle:[String:Any] = [:]
    
    @IBOutlet weak var trendTalkTyeName: UILabel!
    
    @IBOutlet weak var tyeOnlineNumber: UILabel!
    
    @IBOutlet weak var trendTalkBackImage: UIImageView!
    
    var tayneStyleSnapState:[Any] = []
    
    var trendTalkRoom:TrendTalkRoom?
    
    var tyeChicChroniclesState = 0
    
    var trendTalkUserCollection:UICollectionView?
    
    @IBOutlet weak var trendTalkTable: UITableView!
    
    var tayneTalkers = TayneManager.default.tayneTalkers.shuffled()
    
    var talkTyeInfomations:[TalkInfomationModel] = []
    
    @IBOutlet weak var sayTextField: UITextField!
    
    @IBOutlet weak var trendTalkTyeLikeButton: UIButton!
    
    lazy var detableTyeTableHeader:UIView = {
        let detableTyeTableHeader = UIView(frame: CGRectMake(0, 0, UIScreen.main.bounds.size.width, 94 * 2))
        
        let trendTalkCollectionLayout = UICollectionViewFlowLayout()
        
        tayneCrowdStyle[TayneConfig.tyeTransformInput("crorndfniqgoTtynpzelDoezs")] = TayneConfig.tayneFilter.configTypeDes
        trendTalkCollectionLayout.scrollDirection = .vertical
        trendTalkCollectionLayout.itemSize = CGSizeMake(UIScreen.main.bounds.size.width/4, 94)
        trendTalkCollectionLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
            tayneCrowdStyle["tayneStyleSnapState"] = 200
        }
        trendTalkCollectionLayout.minimumInteritemSpacing = 0
        trendTalkCollectionLayout.minimumLineSpacing = 0
        
        if tayneCrowdStyle.keys.contains(TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")) == false {
            tayneCrowdStyle[TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")] = TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")
        }
        
        trendTalkUserCollection = UICollectionView(frame: .zero, collectionViewLayout: trendTalkCollectionLayout)
        trendTalkUserCollection!.delegate = self
        trendTalkUserCollection!.dataSource = self
        trendTalkUserCollection!.backgroundColor = .clear
        detableTyeTableHeader.addSubview(trendTalkUserCollection!)
        trendTalkUserCollection!.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        trendTalkUserCollection!.register(nibWithCellClass: TressTalesCollectionViewCell.self)
        
        return detableTyeTableHeader
        
    }()
    
    @IBOutlet var detailTyeTable:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        if tayneCrowdStyle.keys.contains(TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")) == false {
            tayneCrowdStyle[TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")] = TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")
        }
        
        if tayneCrowdStyle.count > 0 {
            tayneStyleSnapState.append(0)
        }
        
        
        if tayneCrowdStyle.count > 0 && tayneCrowdStyle.isEmpty == false {
            tayneStyleSnapState.append(contentsOf: Array(tayneCrowdStyle.keys))
            tayneStyleSnapState.append(100)
        }
        
        tayneStyleSnapState.append([1,TayneConfig.tayneFilter.configTypeDes])
        
        tayneCrowdStyle[TayneConfig.tyeTransformInput("crorndfniqgoTtynpzelDoezs")] = TayneConfig.tayneFilter.configTypeDes
        
        if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
            tayneCrowdStyle["tayneStyleSnapState"] = 200
            tyeConfigSubViews()
        }
        
        tyeLoadAllTalkRoomInfomations { loadStateSubject in
            loadStateSubject.subscribe(onNext: { [weak self] talkTyeInfomations in
                guard let self = self else { return }
                self.talkTyeInfomations = talkTyeInfomations
                self.trendTalkTable.reloadData {
                    
                }
            })
            .disposed(by: rx.disposeBag)
        }
        
    }
    
    func tyeLoadAllTalkRoomInfomations(tyeLoadFinish: ((PublishSubject<[TalkInfomationModel]>) -> Void)){
        
        let loadStateSubject:PublishSubject<[TalkInfomationModel]> = .init()
        tyeLoadFinish(loadStateSubject)
        
        let talkTyeInfomations = TayneManager.default.trendTalkInfomations.filter({ talkInfomationModel in
            self.tayneStyleSnapState.append(talkInfomationModel.tyeFromId)
            
            if let trendTalkRoom = self.trendTalkRoom {
                if talkInfomationModel.tyeTrankTalkRoomName == trendTalkRoom.roomUserName{
                    return true
                }
            }
            
            self.tayneStyleSnapState.append(talkInfomationModel.tyeTrankTalkRoomName)
            
            return false
        })
        loadStateSubject.onNext(talkTyeInfomations)
    }
    
    @IBAction func trendTalkRightEvent(_ sender: Any) {
        
    }
    
    @IBAction func sayDoneEvent(_ sender: Any) {
        guard let sayTyeText = sayTextField.text, sayTyeText.count > 0 else { return}
        guard let tyeNow = TayneManager.default.tyeNow.value else { return }
        guard let trendTalkRoom = trendTalkRoom else {return}
        
        var tyeInfomation = TalkInfomationModel()
        tyeInfomation.tyeAura = 1
        tyeInfomation.tyeFromId = tyeNow.roomUserId
        tyeInfomation.tyeFrom = tyeNow.roomUserName
        tyeInfomation.tyeInfomation = sayTyeText
        tyeInfomation.tyeTrankTalkRoomName = trendTalkRoom.roomUserName
        
        talkTyeInfomations.append(tyeInfomation)
        TayneManager.default.trendTalkInfomations.append(tyeInfomation)
        
        if let tyeFindIndex = TayneManager.default.trendTalkDatas.firstIndex(where: { talkInfomationModel in
            return talkInfomationModel.tyeTrankTalkRoomName == trendTalkRoom.roomUserName
        }){
            TayneManager.default.trendTalkDatas[tyeFindIndex] = tyeInfomation
        }else{
            TayneManager.default.trendTalkDatas.insert(tyeInfomation, at: 0)
        }
        
        TayneHud.showLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.51) {
            TayneHud.hidenLooding()
            self.trendTalkTable.reloadData { [weak self] in
                guard let self = self else {return}
                self.sayTextField.text = ""
            }
        }
        
    }
    
    func tyeConfigSubViews(){
        detailTyeTable.rowHeight = UITableView.automaticDimension
        if tayneCrowdStyle.count > 0 && tayneCrowdStyle.isEmpty == false {
            tayneStyleSnapState.append(contentsOf: Array(tayneCrowdStyle.keys))
            detailTyeTable.estimatedRowHeight = 80
            detailTyeTable.tableHeaderView = detableTyeTableHeader
            
            if tayneStyleSnapState.contains(where: {($0 as? Int) == 100}) {
                detailTyeTable.register(nibWithCellClass: TyeTrendTalkRemoteCell.self)
                detailTyeTable.register(nibWithCellClass: TyeTrendTalkMyCell.self)
                detailTyeTable.register(nibWithCellClass: TyeTrendTalkGiftTableViewCell.self)
            }
        }
        
        if let trendTalkRoom = trendTalkRoom {
            trendTalkTyeLikeButton.isSelected = TayneManager.default.tyeDataStore?.string(forKey: TayneConfig.tyeTransformInput("TzreebnldpTjawlvkoRsoposmwLviakle") + trendTalkRoom.roomUserId) != nil
            trendTalkTyeName.text = trendTalkRoom.roomUserName
            tyeOnlineNumber.text = TayneConfig.tyeTransformInput("Onnvlyilnse") + " \(Int.random(in: 200..<300))"
            trendTalkBackImage.image = UIImage(named: trendTalkRoom.roomUserId)
            trendTalkUserCollection?.reloadData {
                
            }
        }
    }
    
    @IBAction func tyeNavigationBackEvent(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
                TayneManager.default.tyeDataStore?.set(self.trendTalkRoom!.roomUserId, forKey: TayneConfig.tyeTransformInput("tdygejBtlqincskvTsaylgkneurls") + self.trendTalkRoom!.roomUserId)
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
    
    @IBAction func trendTalkLikeEvent(_ sender: UIButton) {
        
        var tyeTrendTalkState = (false,"")
        
        sender.isSelected.toggle()
        tyeTrendTalkState = (true,"touch")
        
        if tyeTrendTalkState.0 {
            if sender.isSelected {
               if trendTalkRoom != nil {
                    TayneManager.default.tyeDataStore?.set(trendTalkRoom!.roomUserId, forKey: TayneConfig.tyeTransformInput("TzreebnldpTjawlvkoRsoposmwLviakle") + trendTalkRoom!.roomUserId)
                }
            }else{
                if trendTalkRoom != nil {
                    TayneManager.default.tyeDataStore?.removeValue(forKey: TayneConfig.tyeTransformInput("TzreebnldpTjawlvkoRsoposmwLviakle") + trendTalkRoom!.roomUserId)
                 }
            }
        }
    }
    
    @IBAction func showTayneGift(_ sender: Any) {
        
        let tyeGiftView = UIView.loadFromNib(withClass: TayneTrendTalkGiftAlertView.self, bundle: nil)
        tyeGiftView.giftAlertConfig()
        tyeGiftView.trendTalkGiftShow(tayneTalkers)
        tyeGiftView.giftTyeDone = { [weak self] (tyeIndex,giftTyueCount,toTayneTalker,toTayneTalkerId) in
            guard let self = self,
                  let tyeNow = TayneManager.default.tyeNow.value,
                  let trendTalkRoom = trendTalkRoom
            else { return }
            
            var tyeListPrice = [69,129,329,1020,2100]
            
            if toTayneTalker.count > 0 {
                tyeListPrice.insert(29, at: 0)
            }
            
            guard tyeNow.tayneCredit > tyeListPrice[tyeIndex] * giftTyueCount else {
                let tyeStyleCreditVC = TyeStyleCreditViewController()
                self.navigationController?.pushViewController(tyeStyleCreditVC)
                return
            }
            
            TayneHud.showLoading()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.51) {
                var tyeInfomation = TalkInfomationModel()
                tyeInfomation.tyeAura = 2
                tyeInfomation.tyeFromId = tyeNow.roomUserId
                tyeInfomation.tyeFrom = tyeNow.roomUserName
                tyeInfomation.tyeGIftNumber = giftTyueCount
                tyeInfomation.tyeTrankTalkRoomName = trendTalkRoom.roomUserName
                tyeInfomation.tyeGiftName = "tayneGift" + "\(tyeIndex)"
                tyeInfomation.tyeTo = toTayneTalker
                tyeInfomation.tyeToId = toTayneTalkerId
                
                self.talkTyeInfomations.append(tyeInfomation)
                TayneManager.default.trendTalkInfomations.append(tyeInfomation)
                
                if let tyeFindIndex = TayneManager.default.trendTalkDatas.firstIndex(where: { talkInfomationModel in
                    return talkInfomationModel.tyeTrankTalkRoomName == trendTalkRoom.roomUserName
                }){
                    TayneManager.default.trendTalkDatas[tyeFindIndex] = tyeInfomation
                }else{
                    TayneManager.default.trendTalkDatas.insert(tyeInfomation, at: 0)
                }
                TayneHud.hidenLooding()
                self.trendTalkTable.reloadData {
                    
                }
            }
        }
    }
    
    
}


extension TyeTrendTalkDetailViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            var trendTalkUserCount = 0
            if self.trendTalkRoom == nil {
                trendTalkUserCount = 0
            }
            
            if TayneManager.default.tayneTalkers.count > 0 {
                trendTalkUserCount = TayneManager.default.tayneTalkers.count
            }
            
            return trendTalkUserCount
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            let tressTalesCell = collectionView.dequeueReusableCell(withClass: TressTalesCollectionViewCell.self, for: indexPath)
            tressTalesCell.tressTalesImage.layerBorderWidth = 1
            tressTalesCell.tressTalesImage.layerCornerRadius = 54/2
            tressTalesCell.tressTalesImage.snp.updateConstraints { make in
                make.width.equalTo(54)
                make.height.equalTo(54)
            }
            tressTalesCell.tressTalesImage.image = UIImage(named: tayneTalkers[indexPath.row].roomUserId)
            tressTalesCell.tressTalesName.text = tayneTalkers[indexPath.row].roomUserName
            return tressTalesCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UIView.performWithoutAnimation {
            collectionView.reloadData {
                
            }
        }
    }
}

extension TyeTrendTalkDetailViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            return talkTyeInfomations.count
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
            if section == 0 {
                return 39
            }
            return 0.01
        }
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            return 21.0
        }
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            
            let tyeInfomation = talkTyeInfomations[indexPath.section]
            if tyeInfomation.tyeAura == 0 {
                let tyeRemoteCell = tableView.dequeueReusableCell(withClass: TyeTrendTalkRemoteCell.self)
                tyeRemoteCell.tyeFromName.text = tyeInfomation.tyeFrom
                tyeRemoteCell.tyeFromImage.image = UIImage(named: tyeInfomation.tyeFromId)
                tyeRemoteCell.tyeInfomation.text = tyeInfomation.tyeInfomation
                return tyeRemoteCell
            }else if tyeInfomation.tyeAura == 1 {
                let tyeMyCell = tableView.dequeueReusableCell(withClass: TyeTrendTalkMyCell.self)
                tyeMyCell.tyeInfomation.text = tyeInfomation.tyeInfomation
                return tyeMyCell
            }else{
                let tyeTrendTalkGiftCell = tableView.dequeueReusableCell(withClass: TyeTrendTalkGiftTableViewCell.self)
                tyeTrendTalkGiftCell.talkInfomationModel = tyeInfomation
                return tyeTrendTalkGiftCell
            }
        }
        return UITableViewCell()
        
    }
}
