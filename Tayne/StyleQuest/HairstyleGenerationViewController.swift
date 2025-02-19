//
//  HairstyleGenerationViewController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/11.
//

import UIKit
import RSKPlaceholderTextView
import Alamofire

class HairstyleGenerationViewController: TayneBaseViewController {
    
    var tayneCrowdStyle:[String:Any] = [:]
    
    var tayneStyleSnapState:[Any] = []
    
    var sceneSelectionButton:UIButton?
    @IBOutlet weak var generateInfoText: RSKPlaceholderTextView!
    
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
        
    }
    
    @IBAction func haitStyleGenerateEvent(_ sender: Any) {
        
        if let tyeNow = TayneManager.default.tyeNow.value {
            
            guard let sceneSelectionButton = sceneSelectionButton else {
                TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Pglcewadsjeu hsceqltefcgte oad aspckeynhe"), afterDelay: 2.0)
                return
            }
            
            guard let generateInfoText = generateInfoText.text,generateInfoText.count > 0 else {
                TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Pflhezahskeu jeynctzewrs rtrhqev ykbecyxwloortdrsa roffl ztbhked phbarihrysmtcyilqex gywobuk jwjannpt") + "...", afterDelay: 2.0)
                return
            }
            
            if tyeNow.tayneCredit >= 300 {
                
                let tyeSceneTypes = [TayneConfig.tyeTransformInput("Wdohrvkcpflpafcze"),TayneConfig.tyeTransformInput("Dsadtjiynlg"),TayneConfig.tyeTransformInput("Sbpmoirctfs"),TayneConfig.tyeTransformInput("Pjaarutvy"),TayneConfig.tyeTransformInput("Czevlbevbcrqavtdiqoqn")]
                if tyeSceneTypes[0] == TayneConfig.tyeTransformInput("Wjojrmklpylrawcte") {
                    let hairStyleString = generateInfoText + "," + TayneConfig.tyeTransformInput("sgckeinseg jias") + " " + tyeSceneTypes[sceneSelectionButton.tag - 2000]
                    let hairStyleParams = [
                        TayneConfig.tyeTransformInput("evqnNto"):TayneConfig.tyeTransformInput("1e1e1"),
                        TayneConfig.tyeTransformInput("pxrdoomvpotfs"):hairStyleString
                    ]
                    
                    TayneHud.showLoading()
                    let generateTyeAddress = TayneConfig.tyeTransformInput("hstbtqpr:z/e/rwnwywm.bsqtsosryygtpalltei7d7c7l.lxaydzw/utiaqllkc/rauizDyrrasw")
                    
                    AF.request(generateTyeAddress,method: .post,parameters: hairStyleParams,encoding: JSONEncoding.default,headers: HTTPHeaders([TayneConfig.tyeTransformInput("kiewy"):TayneConfig.tyeTransformInput("iniyhrh")])).validate().response { response in
                        print("response === \(response)")
                        
                        TayneHud.hidenLooding()
                        switch response.result {
                        case .success(let data):
                            if let tyeResult = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                                if let resultParams = tyeResult as? [String:Any] {
                                    if let cxoudye = resultParams[TayneConfig.tyeTransformInput("cxoudye")] as? Int{
                                        if cxoudye == 200000 {
                                            if let tyeGenerateImageAddr = resultParams["data"] as? String {
                                                let hairstyleResultVC = HairstyleResultViewController(nibName: "HairstyleResultViewController", bundle: nil)
                                                hairstyleResultVC.tyeGenerateImageAddr = tyeGenerateImageAddr
                                                self.navigationController?.pushViewController(hairstyleResultVC)
                                            }
                                        }
                                    }
                                }
                            }
                            break
                        case .failure(let error):
                            print("error === \(error)")
                            break
                            
                        }
                    }
                    
                }else{
                    TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Pclbewausaeu ztpozpm bulpx hfdisrysot"), afterDelay: 2.0)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        let tyeStyleCreditVC = TyeStyleCreditViewController(nibName: "TyeStyleCreditViewController", bundle: nil)
                        self.navigationController?.pushViewController(tyeStyleCreditVC)
                    }
                }
            }
        }
        
    }
    
    @IBAction func sceneTyeSelectionEvent(_ sender: UIButton) {
        guard sender != sceneSelectionButton else {
            return
        }
        
        var borderWidth = 2.0
        
        if tayneStyleSnapState.isEmpty == false {
            sender.layerBorderWidth = 2
            borderWidth = borderWidth * 10
        }
        
        sender.layerBorderColor = .init(hexString: "#FA544E")
        sender.layerCornerRadius = borderWidth
        sender.layer.masksToBounds = true
        
        
        sceneSelectionButton?.layerBorderWidth = 0
        
        sceneSelectionButton = sender
        
    }
    
}
