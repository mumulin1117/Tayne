//
//  TayneSettingViewController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/12.
//

import UIKit
import RTRootNavigationController

class TayneSettingViewController: TayneBaseViewController {
    
    @IBOutlet weak var tayneSettingTable: UITableView!
    
    var tayneCrowdStyle:[String:Any] = [:]
    
    var tayneStyleSnapState:[Any] = []
    
    var tayneSettingItem:[String] = []
    
    var tyeChicChroniclesState = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if tayneCrowdStyle.keys.contains(TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")) == false {
            tayneCrowdStyle[TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")] = TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")
            tayneSettingItem.append(contentsOf: [TayneConfig.tyeTransformInput("Pdrjipvuaqceye hPhozlxizcby"),TayneConfig.tyeTransformInput("Ujsqefrb uAbgirnebeemdecnvt")])
        }
        
        if tayneCrowdStyle.count > 0 {
            tayneStyleSnapState.append(0)
            tayneSettingItem.append(contentsOf: [TayneConfig.tyeTransformInput("Fiexeodfbwavcuk"),TayneConfig.tyeTransformInput("Atbzoguett bUgs")])
        }
        
        self.title = TayneConfig.tyeTransformInput("Sxeutatoibncg")
        if tayneCrowdStyle.count > 0 && tayneCrowdStyle.isEmpty == false {
            tayneStyleSnapState.append(contentsOf: Array(tayneCrowdStyle.keys))
        }
        tayneSettingItem.append(TayneConfig.tyeTransformInput("Bnlbancnkyloizswt"))
        tayneStyleSnapState.append([1,TayneConfig.tayneFilter.configTypeDes])
        
        tayneCrowdStyle[TayneConfig.tyeTransformInput("crorndfniqgoTtynpzelDoezs")] = TayneConfig.tayneFilter.configTypeDes
        
        if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
            tayneCrowdStyle["tayneStyleSnapState"] = 200
            tayneSettingItem.append(TayneConfig.tyeTransformInput("Ddenldedtyec galcdcvopuwnxt"))
            tayneSettingTable.register(nibWithCellClass: TayneSettingTableViewCell.self)
        }
        
    }
    
    @IBAction func loginTyeOutEvent(_ sender: Any) {
        tyeChicChroniclesState = 0
        let tyeAlertController = UIAlertController(title: TayneConfig.tyeTransformInput("Prrgovmnprt"), message: TayneConfig.tyeTransformInput("Ahrvek yypoqud esxuarsez aygohua owpaonbtc ttior tljoagj fobuati?"), preferredStyle: .alert)
        
        let thinkAgain = UIAlertAction(title: TayneConfig.tyeTransformInput("Tjhgizntkr haugoaviin"), style: .cancel) {[weak self] _ in
            guard let self = self else {return}
            self.tayneStyleSnapState.append("thinkAgain")
        }
        
        tayneStyleSnapState.append(tyeChicChroniclesState)
        
        tyeAlertController.addAction(thinkAgain)
        
        let tyeSureText = TayneConfig.tyeTransformInput("Sxumrue")
        let tyeSure = UIAlertAction(title: tyeSureText, style: .default) {[weak self] _ in
            guard let self = self else {return}
            self.tayneStyleSnapState.append(TayneConfig.tyeTransformInput("CramlflaRgeqproprxt"))
            TayneHud.showLoading()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                TayneHud.hidenLooding()
                if let tyeNow = TayneManager.default.tyeNow.value {
                    self.tayneStyleSnapState.append(tyeNow.roomUserId)
                    TayneManager.default.tyeDataStore = nil
                    TayneManager.default.tyeNow.accept(nil)
                    TayneManager.default.updateUserProfile()
                    
                    if let connectedScenesItem = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let delegate = connectedScenesItem.delegate as? SceneDelegate {
                        if let tayneLoginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withClass: TayneLoginViewController.self) {
                            if delegate.window != nil {
                                delegate.window!.rootViewController = RTRootNavigationController(rootViewController: tayneLoginVC)
                            }
                        }
                        
                    }
                }
            }
        }
        
        tayneStyleSnapState.append(tyeChicChroniclesState+1)
        
        if tayneCrowdStyle.count > 0 && tayneCrowdStyle.isEmpty == false {
            tayneStyleSnapState.append(contentsOf: Array(tayneCrowdStyle.keys))
            tyeAlertController.addAction(tyeSure)
        }
        
        if tayneCrowdStyle.isEmpty == false &&  tayneCrowdStyle.count > 0{
            self.present(tyeAlertController, animated: true, completion: nil)
        }
    }

}

extension TayneSettingViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tayneSettingItem.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 4 {
            let tayneBlackPoolVC = TayneBlackPoolViewController(nibName: "TayneBlackPoolViewController", bundle: nil)
            navigationController?.pushViewController(tayneBlackPoolVC)
            return
        }
        
        if indexPath.section == 3 {
            let tayneInfoVC = TayneInfoViewController(nibName: "TayneInfoViewController", bundle: nil)
            navigationController?.pushViewController(tayneInfoVC)
            return
        }
        
        if indexPath.section == 2 {
            if let tayneTrendTunerVC = UIStoryboard.main?.instantiateViewController(withClass: TayneTrendTunerViewController.self) {
                navigationController?.pushViewController(tayneTrendTunerVC)
            }
            return
        }
        
        if indexPath.section < 2 {
            let termsAndPrivacyVC = TermsAndPrivacyViewController()
            termsAndPrivacyVC.tayneType = indexPath.section == 0 ? 1 : 0
            self.navigationController?.pushViewController(termsAndPrivacyVC)
        }
        
        if indexPath.section == 5 {
            tyeChicChroniclesState = 0
            let tyeAlertController = UIAlertController(title: TayneConfig.tyeTransformInput("Prrgovmnprt"), message: TayneConfig.tyeTransformInput("Dpaftiah eclahnxnyoqte obmeu oreehsftiowrbewdm caafatfeprs hdjenlkeqtaienwgb ktbhyel vazcwcdonupnatv,r fpalkekaesxez hcoosnafdiqrfmb!"), preferredStyle: .alert)
            
            let thinkAgain = UIAlertAction(title: TayneConfig.tyeTransformInput("Tjhgizntkr haugoaviin"), style: .cancel) {[weak self] _ in
                guard let self = self else {return}
                self.tayneStyleSnapState.append("thinkAgain")
            }
            
            tayneStyleSnapState.append(tyeChicChroniclesState)
            
            tyeAlertController.addAction(thinkAgain)
            
            let tyeSureText = TayneConfig.tyeTransformInput("Sxumrue")
            let tyeSure = UIAlertAction(title: tyeSureText, style: .default) {[weak self] _ in
                guard let self = self else {return}
                self.tayneStyleSnapState.append(TayneConfig.tyeTransformInput("CramlflaRgeqproprxt"))
                TayneHud.showLoading()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    TayneHud.hidenLooding()
                    if let tyeNow = TayneManager.default.tyeNow.value {
                        TayneManager.default.tyeDataStore?.clearAll()
                        TayneManager.default.tyeNow.accept(nil)
                        TayneManager.default.updateUserProfile()
                        if let connectedScenesItem = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                           let delegate = connectedScenesItem.delegate as? SceneDelegate {
                            if let tayneLoginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withClass: TayneLoginViewController.self) {
                                if delegate.window != nil {
                                    delegate.window!.rootViewController = RTRootNavigationController(rootViewController: tayneLoginVC)
                                }
                            }
                            
                        }
                    }
                }
            }
            
            tayneStyleSnapState.append(tyeChicChroniclesState+1)
            
            if tayneCrowdStyle.count > 0 && tayneCrowdStyle.isEmpty == false {
                tayneStyleSnapState.append(contentsOf: Array(tayneCrowdStyle.keys))
                tyeAlertController.addAction(tyeSure)
            }
            
            if tayneCrowdStyle.isEmpty == false &&  tayneCrowdStyle.count > 0{
                self.present(tyeAlertController, animated: true, completion: nil)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tayneSettingCell = tableView.dequeueReusableCell(withClass: TayneSettingTableViewCell.self)
        tayneSettingCell.tyeTitleSet.text = tayneSettingItem[indexPath.section]
        return tayneSettingCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
