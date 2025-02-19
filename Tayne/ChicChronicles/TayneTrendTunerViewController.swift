//
//  TayneTrendTunerViewController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/12.
//

import UIKit
import RSKPlaceholderTextView
import RxGesture
import TZImagePickerController

class TayneTrendTunerViewController: TayneBaseViewController,TZImagePickerControllerDelegate {

    var tayneCrowdStyle:[String:Any] = [:]
    
    var tayneStyleSnapState:[Any] = []
    @IBOutlet weak var suggestionTyeText: RSKPlaceholderTextView!
    
    @IBOutlet weak var tyeAddPicImageView: UIImageView!
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
    
    func tyeConfigSubViews() {
        
        tyeAddPicImageView.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else {
                    return
                }
                
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
                            self.tyeAddPicImageView.image = photots?.first
                        }
                    }
                    tyePickerImageView?.modalPresentationStyle = .fullScreen
                    self.present(tyePickerImageView!, animated: true)
                }
            })
            .disposed(by: rx.disposeBag)
        
        
        
    }

    @IBAction func submitTrendTunerEvent(_ sender: Any) {
        guard let suggestionTyeText = suggestionTyeText.text,suggestionTyeText.count > 0 else {
            TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Phlrecadshez mepnftceorf ossuagagwecsotpimoon"))
            return
        }
        
        TayneHud.showLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.52) {
            TayneHud.hidenLooding()
            TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Tphlatnlkwsk pfbojrn rycoaucre ssvuxgvgaejsotbihoqnms"))
            self.navigationController?.popViewController()
        }
    }
}
