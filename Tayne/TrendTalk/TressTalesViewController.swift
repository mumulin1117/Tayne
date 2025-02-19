//
//  TressTalesViewController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/11.
//

import UIKit

class TressTalesViewController: TayneBaseViewController {

    var tayneCrowdStyle:[String:Any] = [:]
    
    var tayneStyleSnapState:[Any] = []
    @IBOutlet weak var tressTalesTable: UITableView!
    var tyeChicChroniclesState = 0
    @IBOutlet weak var tressTalesCollection: UICollectionView!
    
    var taybeTalkerAll:[TalkInfomationModel] = []
    var taybeTalkerInfomation:[TalkInfomationModel] = []
    @IBOutlet weak var sayTextField: UITextField!
    
    var tresTalesIndex = 0
    
    var trendTalkRoom:TrendTalkRoom?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadInfomations()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if tayneCrowdStyle.keys.contains(TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")) == false {
            tayneCrowdStyle[TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")] = TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")
        }
        
        if tayneCrowdStyle.count > 0 {
            tayneStyleSnapState.append(0)
            self.title = TayneConfig.tyeTransformInput("Cbhjait")
        }
        
        
        if tayneCrowdStyle.count > 0 && tayneCrowdStyle.isEmpty == false {
            tayneStyleSnapState.append(contentsOf: Array(tayneCrowdStyle.keys))
        }
        
        tayneStyleSnapState.append([1,TayneConfig.tayneFilter.configTypeDes])
        
        tayneCrowdStyle[TayneConfig.tyeTransformInput("crorndfniqgoTtynpzelDoezs")] = TayneConfig.tayneFilter.configTypeDes
        
        if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
            tayneCrowdStyle["tayneStyleSnapState"] = 200
                        
            
            let tyeSessionButton = UIBarButtonItem(image: UIImage(named: "TyeVideoButton")!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(tyeSessionButtonEvent))
            
            let tyeMoreButton = UIBarButtonItem(image: UIImage(named: "TyeReportOrBlack")!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(tyeMoreButtonEvent))
            self.navigationItem.rightBarButtonItems = [tyeMoreButton,tyeSessionButton]
        }
        
        tyeConfigSubViews()
        
    }
    
    func reloadInfomations(){
        taybeTalkerAll = TayneManager.default.trendTalkDatas.filter({ talkInfomationModel in
            
            if TayneManager.default.tyeDataStore?.string(forKey: TayneConfig.tyeTransformInput("toyqetBwlyahcskwUqsieerkIbD") + talkInfomationModel.tyeFromId) == nil {
                return talkInfomationModel.tyeFrom == talkInfomationModel.tyeTrankTalkRoomName
            }
            
            return false
        })
        
        if tresTalesIndex > taybeTalkerAll.count - 1 {
            tresTalesIndex = taybeTalkerAll.count - 1
        }
        
        if tresTalesIndex < 0 {
            tresTalesIndex = 0
            taybeTalkerInfomation.removeAll()
            
            UIView.performWithoutAnimation {
                self.tressTalesCollection.reloadData {
                    
                }
                
                self.tressTalesTable.reloadData{
                    
                }
            }
            return
        }
        
        trendTalkRoom = TrendTalkRoom()
        trendTalkRoom!.roomUserId = taybeTalkerAll[tresTalesIndex].tyeFromId
        trendTalkRoom!.roomUserName = taybeTalkerAll[tresTalesIndex].tyeFrom
        
        taybeTalkerInfomation = TayneManager.default.trendTalkInfomations.filter({ talkInfomationModel in
            return talkInfomationModel.tyeTrankTalkRoomName == self.trendTalkRoom!.roomUserName
        })
        
        UIView.performWithoutAnimation {
            self.tressTalesCollection.reloadData {
                
            }
            
            self.tressTalesTable.reloadData{
                
            }
        }
    }
    
    @IBAction func sayDoneEvent(_ sender: Any) {
        guard let sayTyeText = sayTextField.text, sayTyeText.count > 0 else { return}

        guard let trendTalkRoom = trendTalkRoom else {return}
        
        var tyeInfomation = TalkInfomationModel()
        tyeInfomation.tyeAura = 1
        tyeInfomation.tyeFromId = trendTalkRoom.roomUserId
        tyeInfomation.tyeFrom = trendTalkRoom.roomUserName
        tyeInfomation.tyeInfomation = sayTyeText
        tyeInfomation.tyeTrankTalkRoomName = trendTalkRoom.roomUserName
        
        taybeTalkerInfomation.append(tyeInfomation)
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
            self.tressTalesTable.reloadData { [weak self] in
                guard let self = self else {return}
                self.sayTextField.text = ""
            }
        }
        
    }
    
    func tyeConfigSubViews(){
        
        let tressTalesCollectionLayout = UICollectionViewFlowLayout()
        
        tayneCrowdStyle[TayneConfig.tyeTransformInput("crorndfniqgoTtynpzelDoezs")] = TayneConfig.tayneFilter.configTypeDes
        tressTalesCollectionLayout.scrollDirection = .horizontal
        tressTalesCollectionLayout.itemSize = CGSizeMake(95, 95)
        tressTalesCollectionLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
            tayneCrowdStyle["tayneStyleSnapState"] = 200
            tressTalesTable.estimatedRowHeight = 100
            tressTalesTable.register(nibWithCellClass: TressTalesMyTableViewCell.self)
        }
        tressTalesCollectionLayout.minimumInteritemSpacing = 15
        
        if tayneCrowdStyle.keys.contains(TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")) {
            tayneCrowdStyle[TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")] = TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")
            tressTalesTable.rowHeight = UITableView.automaticDimension
            tressTalesTable.register(nibWithCellClass: TressTalesRemoteTableViewCell.self)
        }
        
        tressTalesCollection.register(nibWithCellClass: TressTalesCollectionViewCell.self)
        tressTalesCollection.setCollectionViewLayout(tressTalesCollectionLayout, animated: true)
        
    }
    
    @objc func tyeSessionButtonEvent(){
        let tayneSessionVC = TayneSessionViewController()
        tayneSessionVC.trendTalkRoom = self.trendTalkRoom
        navigationController?.pushViewController(tayneSessionVC)
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
                TayneManager.default.tyeDataStore?.set(self.trendTalkRoom!.roomUserId, forKey: TayneConfig.tyeTransformInput("toyqetBwlyahcskwUqsieerkIbD") + self.trendTalkRoom!.roomUserId)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.reloadInfomations()
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

extension TressTalesViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            return taybeTalkerInfomation.count
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
            return 20.0
        }
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            return 0.01
        }
        return 15.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            let tyeInfomation = taybeTalkerInfomation[indexPath.section]
            if tyeInfomation.tyeAura == 0 {
                let tressTalesRemoteCell = tableView.dequeueReusableCell(withClass: TressTalesRemoteTableViewCell.self)
                tressTalesRemoteCell.tyeInfomation.text = tyeInfomation.tyeInfomation
                return tressTalesRemoteCell
            }else{
                let tressTalesMyCell = tableView.dequeueReusableCell(withClass: TressTalesMyTableViewCell.self)
                tressTalesMyCell.tyeInfomation.text = tyeInfomation.tyeInfomation
                return tressTalesMyCell
            }
        }
        return UITableViewCell()
        
    }
    
}

extension TressTalesViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            return taybeTalkerAll.count
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            let tressTalesCell = collectionView.dequeueReusableCell(withClass: TressTalesCollectionViewCell.self, for: indexPath)
            tressTalesCell.backgroundColor = tresTalesIndex == indexPath.row ? UIColor.white.withAlphaComponent(0.3) : .clear
            tressTalesCell.tressTalesImage.image = UIImage(named: taybeTalkerAll[indexPath.row].tyeFromId)
            tressTalesCell.tressTalesName.text = taybeTalkerAll[indexPath.row].tyeFrom
            return tressTalesCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tresTalesIndex = indexPath.row
        reloadInfomations()
    }
}
