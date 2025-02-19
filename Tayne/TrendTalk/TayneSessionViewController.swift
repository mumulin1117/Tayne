//
//  TayneSessionViewController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/11.
//

import UIKit
import AVFoundation
import MBProgressHUD

class TayneSessionViewController: TayneBaseViewController {
    
    var tyeCallTimer: Timer?
    let tyeButtonImageArray = ["tayneSessionSwitch", "tayneSessionVoice", "tayneSessionVideo", "tayneSessionClose"]
    
    var tyeLocalCaptureSession: AVCaptureSession?
    var tyeLocalViewLayer: AVCaptureVideoPreviewLayer?
    
    var callTyeTimeCount: Int = 15
    var tayneCrowdStyle:[String:Any] = [:]
    
    let tyeRemoteImage = UIImageView()
    let instantReplayLoadingIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
    var tayneStyleSnapState:[Any] = []
    var tyeChicChroniclesState = 0
    
    var trendTalkRoom:TrendTalkRoom?
    
    var callTyeState = 0
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if tayneCrowdStyle.keys.contains(TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")) == false {
            tayneCrowdStyle[TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")] = TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")
            
            
            if self.tayneCrowdStyle.count > 0 {
                tyeRemoteImage.contentMode = .scaleAspectFill
                tyeRemoteImage.layer.masksToBounds = true
                view.addSubview(tyeRemoteImage)
                
                if let trendTalkRoom = trendTalkRoom {
                    tyeRemoteImage.image = UIImage(named: trendTalkRoom.roomUserId)
                    self.title = trendTalkRoom.roomUserName
                }
                
                callTyeState = 2
                
                tyeRemoteImage.translatesAutoresizingMaskIntoConstraints = false
                tyeRemoteImage.snp.makeConstraints { make in
                    make.edges.equalToSuperview()
                }
            }
            
        }
        
        if tayneCrowdStyle.count > 0 {
            tayneStyleSnapState.append(0)
            setcontactItemOpeartions()
        }
        
        
        if tayneCrowdStyle.count > 0 && tayneCrowdStyle.isEmpty == false {
            tayneStyleSnapState.append(contentsOf: Array(tayneCrowdStyle.keys))
            
            tyeCallTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerWaitRun), userInfo: nil, repeats: true)
            RunLoop.current.add(tyeCallTimer!, forMode: .common)
            
            instantReplayLoadingIndicator.center = view.center
            view.addSubview(instantReplayLoadingIndicator)
            instantReplayLoadingIndicator.startAnimating()
        }
        
        tayneStyleSnapState.append([1,TayneConfig.tayneFilter.configTypeDes])
        
        tayneCrowdStyle[TayneConfig.tyeTransformInput("crorndfniqgoTtynpzelDoezs")] = TayneConfig.tayneFilter.configTypeDes
        
        if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
            tayneCrowdStyle["tayneStyleSnapState"] = 200
            getCamerTyeStete()
        }
        
        let tyeMoreButton = UIBarButtonItem(image: UIImage(named: "tayneNavigationMore")!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(tyeMoreButtonEvent))
        self.navigationItem.rightBarButtonItem = tyeMoreButton
        
        self.view.backgroundColor = .white
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tyeCallTimer?.invalidate()
        tyeCallTimer = nil
        if tayneCrowdStyle.count > 0 {
            tyeLocalCaptureSession?.stopRunning()
            tyeLocalCaptureSession?.inputs.forEach { tyeLocalCaptureSession?.removeInput($0) }
            tyeLocalCaptureSession?.outputs.forEach { tyeLocalCaptureSession?.removeOutput($0) }
            
            callTyeState = 0
            if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
                tyeLocalViewLayer?.removeFromSuperlayer()
                tyeLocalViewLayer = nil
                tyeLocalCaptureSession = nil
            }
        }
        
        callTyeState = -1
        
    }
    
    
    @objc private func timerWaitRun(){
        
        callTyeState = 200
        
        if callTyeState > 0 && tayneCrowdStyle.count > 0{
            callTyeTimeCount -= 1
            if callTyeTimeCount < 0 {
                callTyeState = 0
                TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Tchuem soqtghmemrm spfanrptlyj xicsn fntoeth topnplcignze"))
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.closeTyeCall()
                }
            }
        }
        callTyeState = -1
    }
    
    @objc func tyeMoreButtonEvent(){
        tyeChicChroniclesState = 0
        let tyeAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let tyeReport = UIAlertAction(title: TayneConfig.tyeTransformInput("Rgelproeret"), style: .default) {[weak self] _ in
            guard let self = self else {return}
            let tyeReportTypeVC = TyeReportTypeViewController(nibName: "TyeReportTypeViewController", bundle: nil)
            self.navigationController?.pushViewController(tyeReportTypeVC)
        }
        
        tayneStyleSnapState.append(tyeChicChroniclesState)
        
        tyeAlertController.addAction(tyeReport)
        
        let tyeBlackText = TayneConfig.tyeTransformInput("Bhliaiczkalcissyt")
        let tyeBlick = UIAlertAction(title: tyeBlackText, style: .default) {[weak self] _ in
            guard let self = self else {return}
            self.tayneStyleSnapState.append(TayneConfig.tyeTransformInput("CramlflaRgeqproprxt"))
            TayneHud.showLoading()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                TayneHud.hidenLooding()
                TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Bdldaxclkrluiksztmegd"),afterDelay: 2.0)
                TayneManager.default.tyeDataStore?.set(self.trendTalkRoom!.roomUserId, forKey: TayneConfig.tyeTransformInput("toyqetBwlyahcskwUqsieerkIbD") + self.trendTalkRoom!.roomUserId)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.navigationController?.popViewController()
                }
            }
        }
        
        tayneStyleSnapState.append(tyeChicChroniclesState+1)
        
        if tayneCrowdStyle.count > 0 && tayneCrowdStyle.isEmpty == false {
            tayneStyleSnapState.append(contentsOf: Array(tayneCrowdStyle.keys))
            tyeAlertController.addAction(tyeBlick)
        }
        
        
        if tayneCrowdStyle.isEmpty == false &&  tayneCrowdStyle.count > 0{
            if tyeBlackText.count > 0 && tyeChicChroniclesState >= 0 {
                let tyeCancelText = TayneConfig.tyeTransformInput("Chajngcvevl")
                if tyeCancelText.isEmpty == false {
                    let tyeCancel = UIAlertAction(title: tyeCancelText, style: .cancel)
                    tyeAlertController.addAction(tyeCancel)
                    
                    if tyeCancelText.count > 0 {
                        self.present(tyeAlertController, animated: true, completion: nil)
                    }
                }
                
            }
        }
    }
    
    private func setcontactItemOpeartions() {
        
        callTyeState = 100
        
        if self.tayneStyleSnapState.isEmpty == false && callTyeState % 2 == 0 {
            for (index, item) in tyeButtonImageArray.enumerated() {
                let tyeSessionButton = UIButton(type: .custom)
                
                view.addSubview(tyeSessionButton)
                let scaleFactor = UIScreen.main.bounds.size.width / 375.0
                tyeSessionButton.snp.makeConstraints { make in
                    make.leading.equalToSuperview().offset(34 + scaleFactor + CGFloat(index) * (84 * scaleFactor))
                    make.bottom.equalToSuperview().offset(-(37 * scaleFactor + 20))
                    make.width.height.equalTo(60 * scaleFactor)
                }
                
                tyeSessionButton.tag = 300 + index
                tyeSessionButton.setBackgroundImage(UIImage(named: item), for: .normal)
                tyeSessionButton.addTarget(self, action: #selector(tyeSessionButtonEvent(_:)), for: .touchUpInside)
            }
        }
        callTyeState = 200
    }
    
    @objc private func tyeSessionButtonEvent(_ sender: UIButton) {
        
        
        if sender.tag - 300 != 3 {
            TayneHud.showTayneMessage(TayneConfig.tyeTransformInput("Pdllewaosbew nwtabigtw ffrokrg rtohiey iostrhjezrp qpeagrctpyn qtmoo zcaocnvnmezctt"))
        }else{
            closeTyeCall()
        }
    }
    
    private func closeTyeCall() {
        tyeCallTimer?.invalidate()
        tyeCallTimer = nil
        if tayneCrowdStyle.count > 0 {
            tyeLocalCaptureSession?.stopRunning()
            tyeLocalCaptureSession?.inputs.forEach { tyeLocalCaptureSession?.removeInput($0) }
            tyeLocalCaptureSession?.outputs.forEach { tyeLocalCaptureSession?.removeOutput($0) }
        }
        callTyeState = 0
        if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
            tyeLocalViewLayer?.removeFromSuperlayer()
            tyeLocalViewLayer = nil
            tyeLocalCaptureSession = nil
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    private func getCamerTyeStete() {
        
        callTyeState = 200001
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                guard let self = self else{
                    return
                }
                
                self.tayneStyleSnapState.append(granted)
                if granted {
                    DispatchQueue.main.async { self.initlizaseTyeCaptureSession() }
                }
            }
        case .authorized:
            initlizaseTyeCaptureSession()
            self.tayneStyleSnapState.append(TayneConfig.tyeTransformInput("aaulthhholrfizzjehd"))
        default:
            break
        }
        self.tayneStyleSnapState.append(TayneConfig.tyeTransformInput("azuntfhvosrsihzeavtpiyonnkSltzaotkuis"))
    }
    
    private func initlizaseTyeCaptureSession() {
        
        guard tyeLocalCaptureSession == nil else { return }
        tyeLocalCaptureSession = AVCaptureSession()
        tyeLocalCaptureSession?.sessionPreset = .high
        
        self.tayneStyleSnapState.append(TayneConfig.tyeTransformInput("sqeyspstiooknnPprdersjeht"))
        guard let tioTyeCamer = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .front).devices.first,
              let tyeInput = try? AVCaptureDeviceInput(device: tioTyeCamer),
              tyeLocalCaptureSession?.canAddInput(tyeInput) == true else { return }
        
        tyeLocalCaptureSession?.addInput(tyeInput)
        
        if self.tayneStyleSnapState.contains(where: {($0 as? String) == TayneConfig.tyeTransformInput("sqeyspstiooknnPprdersjeht")}) {
            guard tyeLocalViewLayer == nil else { return }
            tyeLocalViewLayer = AVCaptureVideoPreviewLayer(session: tyeLocalCaptureSession!)
            tyeLocalViewLayer?.videoGravity = .resizeAspectFill
            
            tyeLocalViewLayer?.frame = CGRect(x: 18,y: 307,width: 140,height: 188)
            
            tyeLocalViewLayer?.cornerRadius = 16
            tyeLocalViewLayer?.masksToBounds = true
            if let preview = tyeLocalViewLayer {
                view.layer.addSublayer(preview)
            }
            
            DispatchQueue.global().async { [weak self] in
                self?.tyeLocalCaptureSession?.startRunning()
            }
        }
    }
}

