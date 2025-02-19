//
//  TyeReportTypeViewController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/12.
//

import UIKit
import RxSwift
import RxCocoa
import RSKPlaceholderTextView

class TyeReportTypeViewController: TayneBaseViewController {

    var tayneCrowdStyle:[String:Any] = [:]
    
    var tayneStyleSnapState:[Any] = []
    
    var tyeReportTypeCurrent:UIButton?
    
    @IBOutlet weak var tyeInputCountNumber: UILabel!
    
    @IBOutlet weak var falseInfomationTyeText: RSKPlaceholderTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = TayneConfig.tyeTransformInput("Rjeepfovrjtr wTuyhpue")
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
        
        falseInfomationTyeText
            .rx
            .text
            .orEmpty
            .map({ [weak self] tyeInputText in
                guard let self = self else {return tyeInputText}
                var tyeNewValue = tyeInputText
                if tyeInputText.count > 50 {
                    tyeNewValue = String(tyeInputText.prefix(50))
                }
                self.tyeInputCountNumber.text = "\(tyeNewValue.count)/50"
                return tyeNewValue
            })
            .bind(to: falseInfomationTyeText.rx.text)
            .disposed(by: rx.disposeBag)
        
    }
    
    
    @IBAction func tyeReportEvent(_ sender: UIButton) {
        
        
        if tayneCrowdStyle.count > 0 {
            tayneStyleSnapState.append("report type index 1")
        }
        
        guard sender != tyeReportTypeCurrent else {
            sender.isSelected.toggle()
            sender.backgroundColor = .white
            tyeReportTypeCurrent = nil
            return
        }
        
        sender.isSelected.toggle()
        sender.backgroundColor = UIColor.init(hexString: "#F71818")
        tyeReportTypeCurrent?.isSelected.toggle()
        tyeReportTypeCurrent?.backgroundColor = .white
        
        tyeReportTypeCurrent = sender
        
    }
    
    
    @IBAction func submitTyeReportEvent(_ sender: Any) {
        guard let _ = self.tyeReportTypeCurrent else {
            TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Pelqeoansaeh zsveulyetcfth gtjhyee nroespfoirttlisnega rtdyzpee"))
            return
        }
        
        TayneHud.showLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            TayneHud.hidenLooding()
            TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Rcegpqoyretq cSvumczccedsismffuzldlfy"))
            self.navigationController?.popViewController()
        }
        
    }
    
}
