//
//  TrendTalkCreateViewController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/11.
//


import UIKit
import RxGesture
import RxSwift
import RxCocoa
import TZImagePickerController


class TrendTalkCreateViewController: TayneBaseViewController ,TZImagePickerControllerDelegate{
    
    var tayneCrowdStyle:[String:Any] = [:]
    @IBOutlet weak var trendTalkTypeView1: UIView!
    @IBOutlet weak var trendTalkTypeImage1: UIImageView!
    @IBOutlet weak var tyeRoomNameField: UITextField!
    
    @IBOutlet weak var trendTalkTypeView2: UIView!
    @IBOutlet weak var trendTalkTypeImage2: UIImageView!
    var tayneStyleSnapState:[Any] = []
    @IBOutlet weak var trendTalkTypeView3: UIView!
    @IBOutlet weak var trendTalkTypeImage3: UIImageView!
    
    @IBOutlet weak var publishChallengeIcon: UIImageView!
    @IBOutlet weak var tyeChallengeConve: UIImageView!
    @IBOutlet weak var coverImageTyeNumber: UILabel!
    
    var selectedTyeTypeView:UIView?
    
    var tyeCreateState:(Bool,String) = (false,TayneConfig.tyeTransformInput("Pslwelatsfem bsgeilceocnte aad uccopvpefr"))
    
    let tyeChatTypeSelected:BehaviorRelay<String?> = .init(value: nil)
    let tyeRoomName:BehaviorRelay<String?> = .init(value: nil)
    let tyeRoomCover:BehaviorRelay<UIImage?> = .init(value: nil)
    
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
        
        if selectedTyeTypeView == nil {
            tyeConfigSubViews()
        }
    }
    
    func tyeConfigSubViews(){
        trendTalkTypeView1.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] gesture in
                guard let self = self else {return}
                self.gestureViewTyeHandler(gestureView: gesture.view!)
            })
            .disposed(by: rx.disposeBag)
            
        
        trendTalkTypeView2.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] gesture in
                guard let self = self else {return}
                self.gestureViewTyeHandler(gestureView: gesture.view!)
                
            })
            .disposed(by: rx.disposeBag)
        
        trendTalkTypeView3.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] gesture in
                guard let self = self else {return}
                self.gestureViewTyeHandler(gestureView: gesture.view!)
            })
            .disposed(by: rx.disposeBag)
        
        Observable.combineLatest(tyeChatTypeSelected,tyeRoomName,tyeRoomCover)
            .subscribe(onNext: { tyeSelectType,tyeRoomNameText,tyeRoomCoverImage in
                
                if tyeRoomCoverImage == nil {
                    self.tyeCreateState = (false,TayneConfig.tyeTransformInput("Pzlyelatstee esveylneacwty kau gcuosvvedr"))
                    return
                }
                
                if tyeRoomNameText == nil || tyeRoomNameText?.count == 0 {
                    self.tyeCreateState = (false,TayneConfig.tyeTransformInput("Phlteyahsbes qemnxtzeprp ctzhfeb tcghxaitl frdonotmc lnwatmze"))
                    return
                }
                
                if tyeSelectType == nil || tyeSelectType?.count == 0 {
                    self.tyeCreateState = (false,TayneConfig.tyeTransformInput("Pelxejafstep rsoeglyewcsti vtehren hcxhuaqtw erpodotms mtxyspie"))
                    return
                }
                
                self.tyeCreateState = (true,TayneConfig.tyeTransformInput("Pelxejafstep rsoeglyewcsti vtehren hcxhuaqtw erpodotms mtxyspie"))
            })
            .disposed(by: rx.disposeBag)
        
        tyeRoomNameField.rx.text.orEmpty
            .bind(to: tyeRoomName)
            .disposed(by: rx.disposeBag)
        
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
                            self.coverImageTyeNumber.text = TayneConfig.tyeTransformInput("Uypxlwowatdv bcqowvoepr") + "(1/1)"
                            self.tyeRoomCover.accept(photots?.first)
                        }
                    }
                    tyePickerImageView?.modalPresentationStyle = .fullScreen
                    self.present(tyePickerImageView!, animated: true)
                }
                
            })
            .disposed(by: rx.disposeBag)
    }
    
    @IBAction func createTalkRoomInfo(_ sender: Any) {
        if self.tyeCreateState.0 {
            TayneHud.showLoading()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.51) {
                TayneHud.hidenLooding()
                TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Seuicxcaepsvswfquzlqlbyb zckrbefautrefdx,h kphlzeaajsqex ywwaoisto jfmoury arjemvliqeyw"))
                self.navigationController?.popViewController()
            }
        }else{
            TayneHud.showTayneMessage(tyeCreateState.1)
        }
    }
    
    
    func gestureViewTyeHandler(gestureView:UIView) {
        
        guard gestureView != selectedTyeTypeView else {
            return
        }
        
        if gestureView == trendTalkTypeView1 {
            trendTalkTypeImage1.image = UIImage(named: "chatTypeImage_s")
            trendTalkTypeImage2.image = UIImage(named: "detailTyButonImage")
            trendTalkTypeImage3.image = UIImage(named: "detailTyButonImage")
        }else if gestureView == trendTalkTypeView2 {
            trendTalkTypeImage2.image = UIImage(named: "chatTypeImage_s")
            trendTalkTypeImage1.image = UIImage(named: "detailTyButonImage")
            trendTalkTypeImage3.image = UIImage(named: "detailTyButonImage")
        }else{
            trendTalkTypeImage3.image = UIImage(named: "chatTypeImage_s")
            trendTalkTypeImage2.image = UIImage(named: "detailTyButonImage")
            trendTalkTypeImage1.image = UIImage(named: "detailTyButonImage")
        }
        
        selectedTyeTypeView = gestureView
        self.tyeChatTypeSelected.accept("selectedTyeTypeView")
    }

}


