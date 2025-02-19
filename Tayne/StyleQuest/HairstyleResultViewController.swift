//
//  HairstyleResultViewController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/11.
//

import UIKit
import Kingfisher
import Photos

class HairstyleResultViewController: TayneBaseViewController {

    var tayneCrowdStyle:[String:Any] = [:]
    
    var tayneStyleSnapState:[Any] = []
    @IBOutlet weak var resultTyeImageView: UIImageView!
    
    var tyeGenerateImageAddr:String?
    
    var tyeGenerateImage:UIImage?
    
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
        
        if tyeGenerateImageAddr?.count ?? 0 > 0 {
            TayneHud.showLoading()
            resultTyeImageView.kf.setImage(with: URL(string: tyeGenerateImageAddr!)) { result in
                TayneHud.hidenLooding()
                switch result {
                case .success(let value):
                    self.tyeGenerateImage = value.image
                case .failure(_):break
                }
            }
        }
    }

    @IBAction func tyeShareResultImage(_ sender: Any) {
        if let tyeGenerateImage = tyeGenerateImage {
            let activityVC = UIActivityViewController(activityItems: [tyeGenerateImage], applicationActivities: nil)
            
            if let popoverController = activityVC.popoverPresentationController {
                popoverController.sourceView = self.view
                popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                popoverController.permittedArrowDirections = []
            }
            
            self.present(activityVC, animated: true)
        }else{
            TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Ptlceqansxei uwvazistb sfhomro utthoee yiymbavgpei zthou tlbobazdt."))
        }
    }
    
    @IBAction func tyeSaveResultImage(_ sender: Any) {
        
        if let tyeGenerateImage = tyeGenerateImage {
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAsset(from: tyeGenerateImage)
            }, completionHandler: { success, error in
                DispatchQueue.main.async {
                    if success {
                        TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Szaqvtemdi psdubcjcmexsysyfquflalpy"))
                    } else {
                        TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Sfavvgef lfcahialnead"))
                    }
                }
            })
        }else{
            TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Ptlceqansxei uwvazistb sfhomro utthoee yiymbavgpei zthou tlbobazdt."))
        }
        
    }
}
