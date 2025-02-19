//
//  TyeStyleCreditViewController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/12.
//

import UIKit
import SwiftyStoreKit

class TyeStyleCreditViewController: TayneBaseViewController {

    var tayneCrowdStyle:[String:Any] = [:]
    
    @IBOutlet weak var styleCreditTable: UITableView!
    
    var styleCreditCurrent:IndexPath?
    
    var tayneStyleSnapState:[Any] = []
    
    var tyeStyleCreditStatus = 0
    
    @IBOutlet weak var tayneCredit: UILabel!
    
    static let styleCreditConfig = [
        ("cbnerhbjkgubzzsi",TayneConfig.tyeTransformInput("4n0q0"),TayneConfig.tyeTransformInput("0t.e9f9j$")),
        ("lrvjigdvtsoeiuol",TayneConfig.tyeTransformInput("8n0q0"),TayneConfig.tyeTransformInput("1t.e9f9j$")),
        ("kjzyxwqtdhfvlpome",TayneConfig.tyeTransformInput("1w2x0f0"),TayneConfig.tyeTransformInput("2t.e9f9j$")),
        ("nhchrxjajuzjobey",TayneConfig.tyeTransformInput("2s4c5n0"),TayneConfig.tyeTransformInput("4t.e9f9j$")),
        ("eourpmrdhfqcfdte",TayneConfig.tyeTransformInput("4j9n0v0"),TayneConfig.tyeTransformInput("9t.e9f9j$")),
        ("nvjcmtvvzffklcie",TayneConfig.tyeTransformInput("9m8j0d0"),TayneConfig.tyeTransformInput("1v9u.m9y9")),
        ("qmsvxzrwodtkljybp",TayneConfig.tyeTransformInput("1f5p0w0j0"),TayneConfig.tyeTransformInput("2v9u.m9y9")),
        ("xxwtzzozbhcaxszd",TayneConfig.tyeTransformInput("2e4z5r0l0"),TayneConfig.tyeTransformInput("4v9u.m9y9")),
        ("fbnxvqczmtwlyrdeu",TayneConfig.tyeTransformInput("3b6s0s0a0"),TayneConfig.tyeTransformInput("6v9u.m9y9")),
        ("txaqfzomeejkxvmq",TayneConfig.tyeTransformInput("4a9k0u0p0"),TayneConfig.tyeTransformInput("9v9u.m9y9"))
    ]
    
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
            tyeConfigSubViews()
        }
        
    }
    
    func tyeConfigSubViews(){
        styleCreditTable.tableHeaderView = UIView(frame: CGRectMake(0, 0, UIScreen.main.bounds.size.width, 0.01))
        styleCreditTable.register(nibWithCellClass: TyeStyleCreditTableViewCell.self)
        tyeStyleCreditStatus = 0
        TayneManager.default.tyeNow
            .compactMap({$0})
            .subscribe(onNext: { tyeNow in
                self.tayneCredit.text = "\(tyeNow.tayneCredit)"
            })
            .disposed(by: rx.disposeBag)
    }

}

extension TyeStyleCreditViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return TyeStyleCreditViewController.styleCreditConfig.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        styleCreditCurrent = indexPath
        UIView.performWithoutAnimation {
            tableView.reloadData { [weak self] in
                guard let self = self else {return}
                
                let tyeStyleCredit = TyeStyleCreditViewController.styleCreditConfig[indexPath.section].0
                
                TayneHud.showLoading()
                SwiftyStoreKit.purchaseProduct(tyeStyleCredit, quantity: 1, atomically: true) { tyePruchaseResultStyle in
                    TayneHud.hidenLooding()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.235) {
                        
                        self.tayneCrowdStyle[TayneConfig.tyeTransformInput("srtqyfljeoShtoavtne")] = "srtqyfljeoShtoavtne"
                        
                        if self.tayneCrowdStyle.count > 0 && self.tayneCrowdStyle.isEmpty == false {
                            self.tayneStyleSnapState.append(contentsOf: Array(self.tayneCrowdStyle.keys))
                        }
                        
                        if tyeStyleCredit.isEmpty == false {
                            self.tayneStyleSnapState.append(TyeStyleCreditViewController.styleCreditConfig[indexPath.section].0)
                        }
                        
                        if case .success(purchase: _) = tyePruchaseResultStyle {
                            
                            if self.tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
                                self.tayneCrowdStyle["tayneStyleSnapState"] = "Done"
                            }
                            if var tyeNow = TayneManager.default.tyeNow.value {
                                if tyeNow.roomUserId.count > 0 && tyeNow.tayneCredit >= 0 {
                                    let tayneCredit = tyeNow.tayneCredit + (Int(TyeStyleCreditViewController.styleCreditConfig[indexPath.section].1) ?? 0)
                                    if tayneCredit >= 0 {
                                        tyeNow.tayneCredit = tayneCredit
                                    }
                                    
                                    if tyeNow.roomUserName.isEmpty == false {
                                        self.tayneStyleSnapState.append(tyeNow.roomUserName)
                                        self.tayneStyleSnapState.append(tyeNow.tyeFollowNumber)
                                        TayneManager.default.tyeNow.accept(tyeNow)
                                        
                                        TayneManager.default.tyeDataStore?.set("\(tyeNow.tayneCredit)", forKey: "tyeCreditNumber")
                                    }
                                }
                            }
                            return
                        }
                        
                        
                        if self.tayneStyleSnapState.count > 0 && self.tayneCrowdStyle.isEmpty == false {
                            if case .error(error: let tyePruchase) = tyePruchaseResultStyle {
                                
                                self.tayneStyleSnapState.insert(-1, at: 0)
                                self.tyeStyleCreditStatus = 10
                                if self.tayneCrowdStyle.keys.contains(TayneConfig.tyeTransformInput("srtqyfljeoShtoavtne")) {
                                    if tyePruchase.code == .paymentCancelled && self.tyeStyleCreditStatus >= 10  {
                                        TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Puasygmketnuti bcdaennczetltesd"))
                                    }else {
                                        if tyePruchase.localizedDescription.count > 0 {
                                            TayneHud.showTayneMessage(tyePruchase.localizedDescription)
                                        }
                                    }
                                    self.tyeStyleCreditStatus = -1
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tyeStyleCreditCell = tableView.dequeueReusableCell(withClass: TyeStyleCreditTableViewCell.self)
        tyeStyleCreditCell.styleCreditPrice.text = TyeStyleCreditViewController.styleCreditConfig[indexPath.section].2 + "$"
        tyeStyleCreditCell.styleCreditQuantity.text = "+ " + TyeStyleCreditViewController.styleCreditConfig[indexPath.section].1
        
        if indexPath == styleCreditCurrent {
            tyeStyleCreditCell.backTyeImage.image = UIImage(named: "styleCredit1")
            tyeStyleCreditCell.styleCreditQuantity.textColor = .black
            tyeStyleCreditCell.styleCreditPrice.textColor = .black
        }else{
            tyeStyleCreditCell.backTyeImage.image = UIImage(named: "styleCredit")
            tyeStyleCreditCell.styleCreditQuantity.textColor = .white
            tyeStyleCreditCell.styleCreditPrice.textColor = .white
        }
        return tyeStyleCreditCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
