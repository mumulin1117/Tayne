//
//  TayneLoginViewController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/10.
//

import UIKit
import RZColorfulSwift
import SwifterSwift

class TayneLoginViewController: TayneBaseViewController {

    @IBOutlet weak var loginTyeAgreement: UILabel!
    
    var tayneCrowdStyle:[String:Any] = [:]
    
    var tayneStyleSnapState:[Any] = []
    
    @IBOutlet weak var tayneLoginName: UITextField!
    @IBOutlet weak var tayneLoginPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if tayneCrowdStyle.keys.contains(TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")) == false {
            tayneCrowdStyle[TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")] = TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")
            
            navigationController?.setNavigationBarHidden(true, animated: true)
        }
        
        if tayneCrowdStyle.count > 0 {
            tayneStyleSnapState.append(0)
            
            loginTyeAgreement.rz.tapAction { [weak self]  _, rzTyeId, _ in
                
                if let self = self {
                    
                    if self.tayneCrowdStyle.count > 0 && self.tayneCrowdStyle.isEmpty == false {
                        self.tayneStyleSnapState.append("tapAction")
                    }
                    
                    let termsAndPrivacyVC = TermsAndPrivacyViewController()
                    termsAndPrivacyVC.tayneType = TayneConfig.tyeTransformInput("tbyi_uulsbesr") == rzTyeId ? 0 : 1
                    self.navigationController?.pushViewController(termsAndPrivacyVC)
                }
            }
        }
        
//#if DEBUG
//        tayneLoginName.insertText("tayne@gmail.com")
//        tayneLoginPassword.insertText("12341234")
//#endif
        
        tayneCrowdStyle[TayneConfig.tyeTransformInput("crorndfniqgoTtynpzelDoezs")] = TayneConfig.tayneFilter.configTypeDes
        
        if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
            tayneCrowdStyle["tayneStyleSnapState"] = 200
        }
        
        
        loginTyeAgreement.rz.colorfulConfer { [weak self] colorReset in
            
            guard let self = self else {
                return
            }
            
            if self.tayneCrowdStyle.count > 0 && self.tayneCrowdStyle.isEmpty == false {
                self.tayneStyleSnapState.append(contentsOf: Array(self.tayneCrowdStyle.values))
            }
            
            var agreementTyeText = TayneConfig.tyeTransformInput("Rdekaqdz sainidl daogtrwemew ottoo vofunt") + " "
            
            if !agreementTyeText.isEmpty {
                colorReset.text(agreementTyeText)?
                    .font(.systemFont(ofSize: 12,weight: .heavy))
                    .textColor(.white)
                    .paragraphStyle?.alignment(.center)
                    
                
                if self.tayneCrowdStyle.count > 0 && self.tayneCrowdStyle.isEmpty == false {
                    self.tayneStyleSnapState.append(contentsOf: Array(self.tayneCrowdStyle.keys))
                }
                
                agreementTyeText = TayneConfig.tyeTransformInput("Uzszeqri xArgmrveneomaeunmt")
                
                self.tayneStyleSnapState.append([10,"tayneStyleSnapState"])
                colorReset.text(agreementTyeText)?
                    .font(.systemFont(ofSize: 12,weight: .heavy))
                    .textColor(UIColor.init(hexString: "#FA544E"))
                    .tapActionByLable(TayneConfig.tyeTransformInput("tbyi_uulsbesr"))
                    .paragraphStyle?.alignment(.center)
                
                self.tayneStyleSnapState.append([12,"tayneFilter"])
                agreementTyeText = " "
                agreementTyeText = agreementTyeText + TayneConfig.tyeTransformInput("Alnwd") + "\n"
                colorReset.text(agreementTyeText)?
                    .font(.systemFont(ofSize: 12,weight: .heavy))
                    .textColor(.white)
                    .paragraphStyle?.alignment(.center)
                
                agreementTyeText = TayneConfig.tyeTransformInput("Pcriivveadcgym wPoozleiqchy")
                
                colorReset.text(agreementTyeText)?
                    .font(.systemFont(ofSize: 12,weight: .heavy))
                    .textColor(UIColor.init(hexString: "#FA544E"))
                    .tapActionByLable(TayneConfig.tyeTransformInput("tjyu_hptrminlridccy"))
                    .paragraphStyle?.alignment(.center)
            }
        }
        loginTyeAgreement.sizeToFit()
    }
    
    @IBAction func tayneLoginEvent(_ sender: Any) {
        
        guard let crowningGlory = self.tayneLoginName.text else {
            TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Pdlnevajsdeh sexnhtoeorr faz wvmaulnigdq dexmoapitls xacdzdprfeusos"))
            return
        }
        
        if crowningGlory.isValidEmail == false {
            TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Pdlnevajsdeh sexnhtoeorr faz wvmaulnigdq dexmoapitls xacdzdprfeusos"))
            return
        }
        
        if tayneCrowdStyle.count > 0 {
            
            guard let tayneLoginPassword = self.tayneLoginPassword.text else {
                TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Palkedarsjet deenptdegru yyeogukrn ppqafsespwvofrsd"))
                return
            }
            
            TayneHud.showLoading()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                if crowningGlory == "tayne@gmail.com",tayneLoginPassword == "12341234",TayneManager.default.tayneTalkers.count > 0 {
                    if let tayneNow = TayneManager.default.tayneTalkers.last {
                        TayneManager.default.tyeNow.accept(tayneNow)
                        TayneManager.default.updateUserProfile()
                    }
                    generateTayneTabbar()
                }else{
                    TayneManager.default.tyeNow.accept(TrendTalkRoom(roomUserId: crowningGlory,roomUserName: crowningGlory))
                    TayneManager.default.updateUserProfile()
                    generateTayneTabbar()
                }
            }
            
        }
        
        
        func generateTayneTabbar(){
            if let connectedScenesItem = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let delegate = connectedScenesItem.delegate as? SceneDelegate {
                let tayneTabbarVC = TayneTabbarController()
                TayneHud.hidenLooding()
                delegate.window?.rootViewController = tayneTabbarVC
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
