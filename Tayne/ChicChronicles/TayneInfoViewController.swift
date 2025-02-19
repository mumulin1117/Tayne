//
//  TayneInfoViewController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/12.
//

import UIKit

class TayneInfoViewController: TayneBaseViewController {

    var tayneCrowdStyle:[String:Any] = [:]
    @IBOutlet weak var tayneVersion: UILabel!
    var tayneStyleSnapState:[Any] = []
    
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
            
            if let loadTyeversion = Bundle.main.infoDictionary?[TayneConfig.tyeTransformInput("ChFeBeumntdvljeeSlhkourrtlVpezrwsyisopnjSqtsrsifnjg")] as? String {
                tayneVersion.text = TayneConfig.tyeTransformInput("Veexrnsximonn") + " " + loadTyeversion
            }
        }
    }

}
