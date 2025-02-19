//
//  PublishChallengeViewController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/10.
//

import UIKit
import RSKPlaceholderTextView
import TZImagePickerController
import RxGesture
import RxSwift
import RxCocoa

class PublishChallengeViewController: TayneBaseViewController,TZImagePickerControllerDelegate {

    var tayneCrowdStyle:[String:Any] = [:]
    
    @IBOutlet weak var tipsViewOne: UIView!
    var tayneStyleSnapState:[Any] = []
    @IBOutlet weak var tyeChallengeTextView: RSKPlaceholderTextView!
    
    @IBOutlet weak var challengeTyeName: UITextField!
    @IBOutlet weak var coverImageTyeNumber: UILabel!
    @IBOutlet weak var publishChallengeIcon: UIImageView!
    @IBOutlet weak var tyeChallengeConve: UIImageView!
    @IBOutlet weak var challengeInfoNUmber: UILabel!
    
    @IBOutlet weak var tipsViewRequire: UIView!
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
        tipsViewOne.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        tipsViewRequire.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        tipsViewOne.layer.cornerRadius = 41
        tipsViewRequire.layer.cornerRadius = 41
        
        
        tyeChallengeTextView.placeholder = NSString(utf8String: TayneConfig.tyeTransformInput("Ppldejabsjej fernptdelr") + "...")
        tyeChallengeTextView.placeholderColor = UIColor.init(hexString: "#000000",transparency: 0.5)!
        
        tyeChallengeConve.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else {return}
                
                let tyePickerImageView = TZImagePickerController(maxImagesCount: 1, delegate: self)
                
                if self.tayneCrowdStyle.count > 0 && self.tayneCrowdStyle.isEmpty == false {
                    self.tayneStyleSnapState.append(contentsOf: Array(self.tayneCrowdStyle.keys))
                    tyePickerImageView?.allowPickingGif = false
                    tyePickerImageView?.allowTakePicture = false
                }
                
                self.tayneCrowdStyle[TayneConfig.tyeTransformInput("crorndfniqgoTtynpzelDoezs")] = TayneConfig.tayneFilter.configTypeDes
                
                if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
                    self.tayneCrowdStyle["tayneStyleSnapState"] = 200
                    tyePickerImageView?.allowTakeVideo = false
                }
                
                if  let tayneStyleSnapState = self.tayneCrowdStyle["tayneStyleSnapState"] as? Int, tayneStyleSnapState % 2 == 0 {
                    tyePickerImageView?.didFinishPickingPhotosHandle = { photots,_,_ in
                        if photots!.count > 0 {
                            self.tyeChallengeConve.image = photots?.first
                            self.publishChallengeIcon.isHidden = true
                            self.coverImageTyeNumber.text = "Cover（1/1）"
                        }
                    }
                    tyePickerImageView?.modalPresentationStyle = .fullScreen
                    self.present(tyePickerImageView!, animated: true)
                }
                
            })
            .disposed(by: rx.disposeBag)
        
        tyeChallengeTextView.rx
            .text
            .orEmpty
            .subscribe(onNext: { [weak self] challengeTyeInfo in
                guard let self = self else {
                    return
                }
                
                if challengeTyeInfo.count > 50 {
                    self.tyeChallengeTextView.text = String(challengeTyeInfo.prefix(50))
                }
                
                self.challengeInfoNUmber.text = "\(challengeTyeInfo.count)/50"
            })
            .disposed(by: rx.disposeBag)
    }
    
    @IBAction func createTyeChallengeInfo(_ sender: Any) {
        guard let _ = self.tyeChallengeConve.image else {
            TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Pnlneeausiez msueflcencmte qao vcxopvyelr"))
            return
        }
        
        guard let challengeTyeName = self.challengeTyeName.text,challengeTyeName.count > 0 else {
            TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Pilnefagsqek tesnqtheorf fac dcvhcaalrllehnogaed unianmje"))
            return
        }
        
        guard let challengeTyeInfo = self.tyeChallengeTextView.text,challengeTyeInfo.count > 0 else {
            TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Pqlheiansbeb eemngtyearb wtuhted ncihhayljlpennwgvem wdneystczrziapjtaisokn"))
            return
        }
        
        TayneHud.showLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            TayneHud.hidenLooding()
            TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Pquwbvliibsmhgetdw rsouicucveusgsufqufleltyc,m epmlcetaiscea vwrasihts nfyozru zrsetvlixefw"),afterDelay: 1.5)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.51) {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }

}
