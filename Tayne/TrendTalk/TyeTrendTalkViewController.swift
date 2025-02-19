//
//  TyeTrendTalkViewController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/10.
//

import UIKit

class TyeTrendTalkViewController: TayneBaseViewController {

    var tayneCrowdStyle:[String:Any] = [:]
    
    @IBOutlet weak var trendTalkCollection: UICollectionView!
    var tayneStyleSnapState:[Any] = []
    
    var trendTalkRooms:[TrendTalkRoom] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        if trendTalkRooms.count > 0 && tayneStyleSnapState.count != 0  {
            loadTyeAllTrendTalk(tyePage: 88, tyeState: 1, isLoad: true)
        }
    }
    
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
        
        loadTyeAllTrendTalk(tyePage: 101, tyeState: 1, isLoad: true)
        
    }
    
    func loadTyeAllTrendTalk(tyePage:Int,tyeState:Int,isLoad:Bool){
        
        tayneStyleSnapState.append(isLoad)
        
        if tayneStyleSnapState.count > 0 && tyePage >= 100 {
            TayneHud.showLoading()
        }
        
        DispatchQueue.global().async {
            
            if self.tayneStyleSnapState.count > 0 && tyePage >= 100 {
                sleep(2)
            }
            
            var trendTalkRooms:[TrendTalkRoom] = []
            if self.trendTalkRooms.count == 0 {
                trendTalkRooms = TayneManager.default.trendTalkRooms.filter { trendTalkRoom in
                    
                    let trendTalkRoomIndf = TayneConfig.tyeTransformInput("tdygejBtlqincskvTsaylgkneurls") + trendTalkRoom.roomUserId
                    if trendTalkRoomIndf.count > 0 {
                        if TayneManager.default.tyeDataStore?.string(forKey: trendTalkRoomIndf) != nil {
                            return false
                        }
                        return true
                    }
                    
                    return true
                }
            }else{
                trendTalkRooms = self.trendTalkRooms.filter { trendTalkRoom in
                    
                    let trendTalkRoomIndf = TayneConfig.tyeTransformInput("tdygejBtlqincskvTsaylgkneurls") + trendTalkRoom.roomUserId
                    if trendTalkRoomIndf.count > 0 {
                        if TayneManager.default.tyeDataStore?.string(forKey: trendTalkRoomIndf) != nil {
                            return false
                        }
                        return true
                    }
                    
                    return true
                }
            }
            
            DispatchQueue.main.async {
                
                if tyeState != 0 {
                    if self.tayneStyleSnapState.count > 0 && tyePage >= 100 {
                        TayneHud.hidenLooding()
                    }
                    self.tayneStyleSnapState.append(isLoad)
                    self.trendTalkRooms = trendTalkRooms
                    self.trendTalkCollection.reloadData {
                        
                    }
                }
                
            }
        }
        
        
    }
    
    func tyeConfigSubViews(){
        let trendTalkCollectionLayout = UICollectionViewFlowLayout()
        
        tayneCrowdStyle[TayneConfig.tyeTransformInput("crorndfniqgoTtynpzelDoezs")] = TayneConfig.tayneFilter.configTypeDes
        trendTalkCollectionLayout.scrollDirection = .vertical
        trendTalkCollectionLayout.itemSize = CGSizeMake((UIScreen.main.bounds.size.width - 40)/2, 225)
        trendTalkCollectionLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 20, right: 15)
        if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
            tayneCrowdStyle["tayneStyleSnapState"] = 200
        }
        trendTalkCollectionLayout.minimumInteritemSpacing = 10
        trendTalkCollectionLayout.minimumLineSpacing = 10
        
        if tayneCrowdStyle.keys.contains(TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")) == false {
            tayneCrowdStyle[TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")] = TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")
        }
        
        trendTalkCollection.setCollectionViewLayout(trendTalkCollectionLayout, animated: true)
    }
    
    @IBAction func trendTalkAddEvent(_ sender: Any) {
        let trendTalkCreateVC = TrendTalkCreateViewController(nibName: "TrendTalkCreateViewController", bundle: nil)
        trendTalkCreateVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(trendTalkCreateVC)
    }
    
}

extension TyeTrendTalkViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            return trendTalkRooms.count
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.tayneCrowdStyle.isEmpty == false && self.tayneStyleSnapState.isEmpty == false {
            let trendTalkCell = collectionView.dequeueReusableCell(withClass: TrendTalkCollectionViewCell.self, for: indexPath)
            trendTalkCell.trendTalkTyeImage.image = UIImage(named: trendTalkRooms[indexPath.row].roomUserId)
            trendTalkCell.trendTalkTyeName.text = trendTalkRooms[indexPath.row].roomUserName
            trendTalkCell.trendTalkLikeButton.isSelected = TayneManager.default.tyeDataStore?.string(forKey: TayneConfig.tyeTransformInput("TzreebnldpTjawlvkoRsoposmwLviakle") + trendTalkRooms[indexPath.row].roomUserId) != nil
            trendTalkCell.trendTalkRoom = trendTalkRooms[indexPath.row]
            return trendTalkCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tyeTrendTalkDetailVC = TyeTrendTalkDetailViewController(nibName: "TyeTrendTalkDetailViewController", bundle: nil)
        tyeTrendTalkDetailVC.hidesBottomBarWhenPushed = true
        tyeTrendTalkDetailVC.trendTalkRoom = trendTalkRooms[indexPath.row]
        navigationController?.pushViewController(tyeTrendTalkDetailVC)
    }
}
