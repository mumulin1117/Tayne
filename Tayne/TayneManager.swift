//
//  TayneManager.swift
//  Tayne
//
//  Created by Tayne on 2025/2/10.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import MMKV
import SwiftyStoreKit

class TayneManager {

    static let `default` = TayneManager()
    
    var tyeDataStore:MMKV?
    
    var hairsChallenges:[HairChallengeModel] = []
    var trendTalkRooms:[TrendTalkRoom] = []
    var tayneTalkers:[TrendTalkRoom] = []
    var trendTalkInfomations:[TalkInfomationModel] = []
    var trendTalkDatas:[TalkInfomationModel] = []
    
    let tyeNow = BehaviorRelay<TrendTalkRoom?>(value: nil)
    
    private init (){
        
        let tyeHairChallenge = [
            [
                "challengeId": "6KyvpxjWqI9YuoY7.png",
                "challengeName": "Rainbow Dye",
                "challengeDescription": "Dye your hair with rainbow-colored streaks within a week to show off a vibrant look.",
                "participantList": [
                    [
                        "challengesId": "lrjQGieUFznkk8mf.jpg",
                        "userTyeDisplayName": "Lavin",
                        "challengeCaption":"Done with the Rainbow Hair Challenge! Feeling like a walking rainbow. ",
                        "userChallengePics": [
                            "I6YHtGOlMjFp1gwT.jpg",
                            "iFU7H3pYBvEhVGKV.jpg",
                            "KKFA07TgFXXM0Rrg.jpg"
                        ]
                    ],
                    [
                        "challengesId": "l58qsj7vri4Bg9SE.jpg",
                        "userTyeDisplayName": "Cuty",
                        "challengeCaption":"Took on the Rainbow Hair Challenge. My hair's now a vibrant spectrum. ",
                        "userChallengePics": [
                            "7H5T7sHqL1GsBhQP1.jpg",
                            "7H5T7sHqL1GsBhQP2.jpg",
                            "7H5T7sHqL1GsBhQP3.jpg"
                        ]
                    ]
                ]
            ],
            [
                "challengeId": "IM6vXwNnurdMEAo6.png",
                "challengeName": "Daily Updo",
                "challengeDescription": "Create a different updo style every day for a week, from elegant to trendy.    ",
                "participantList": [
                    [
                        "challengesId": "l58qsj7vri4Bg9SE.jpg",
                        "userTyeDisplayName": "Cuty",
                        "challengeCaption":"Took on the Rainbow Hair Challenge. My hair's now a vibrant spectrum. ",
                        "userChallengePics": [
                            "7H5T7sHqL1GsBhQP1.jpg",
                            "7H5T7sHqL1GsBhQP2.jpg",
                            "7H5T7sHqL1GsBhQP3.jpg"
                        ]
                    ]
                ]
            ],
            [
                "challengeId": "FTvn6xusCUL9m6pN.png",
                "challengeName": "Bangs Switch",
                "challengeDescription": "Change to a new bangs style, like blunt bangs or side-swept bangs, and keep it for 3 days.",
                "participantList": []
            ],
            [
                "challengeId": "B5xKx3zQVeeZyfI5.png",
                "challengeName": "Short - Cut Pledge",
                "challengeDescription": "Boldly cut your long hair short and rock the new short-hair look.",
                "participantList": []
            ],
            [
                "challengeId": "YwfrVZGGUFFPrYDd.png",
                "challengeName": "Messy Magic",
                "challengeDescription": "Achieve a stylishly messy hair look in 2 days, like tousled curls or a casual bun.",
                "participantList": []
            ],
            [
                "challengeId": "96MwfOfZviXK4DDz.png",
                "challengeName": "Layered Leap",
                "challengeDescription": "Get a layered haircut and try different styling methods within a week.",
                "participantList": []
            ]
        ]
        
        let trendTalkRoom = [
            [
                "roomUserId": "cutChat001.png",
                "roomUserName": "CutChat"
            ],
            [
                "roomUserId": "styleSwap002.png",
                "roomUserName": "Style Swap"
            ],
            [
                "roomUserId": "permPulse003.png",
                "roomUserName": "Perm Pulse"
            ],
            [
                "roomUserId": "updoUnion004.png",
                "roomUserName": "Updo Union"
            ],
            [
                "roomUserId": "fringeForum005.png",
                "roomUserName": "Fringe Forum"
            ],
            [
                "roomUserId": "hairHotspot006.png",
                "roomUserName": "Hair Hotspot"
            ]
        ]
        
        let tayneTalker = [
            [
                "roomUserId": "lrjQGieUFznkk8mf.jpg",
                "roomUserName": "Lavin"
            ],
            [
                "roomUserId": "l58qsj7vri4Bg9SE.jpg",
                "roomUserName": "Cuty"
            ],
            [
                "roomUserId": "5isd1teylh3.jpg",
                "roomUserName": "Avery"
            ],
            [
                "roomUserId": "p1UGqCUxelSv5bpT.jpg",
                "roomUserName": "Hyrine"
            ],
            [
                "roomUserId": "wyfnn0QwxC3NHmcv.jpg",
                "roomUserName": "Lyra"
            ],
            [
                "roomUserId": "9VGs2v7DRetlCBTN.jpg",
                "roomUserName": "Calla"
            ],
            [
                "roomUserId": "oREtlerpGC42Myr4.jpg",
                "roomUserName": "Enix"
            ],
            [
                "roomUserId": "Rc0Zpfd7rzVoulYn.jpg",
                "roomUserName": "Orion"
            ],
            [
                "roomUserId": "xn1X69SczdjuyGbU.jpg",
                "roomUserName": "Kairos"
            ],
            [
                "roomUserId": "Oku22eOKU2rFBxL8.jpg",
                "roomUserName": "Solom"
            ],
            [
                "roomUserId": "l58qsj7vri4Bg9SE.jpg",
                "roomUserName": "Cuty",
                "tayneCredit":0
            ]
        ]
        
        let trendTalkInfomation = [
            [
                "tyeFromId":"5isd1teylh3.jpg",
                "tyeInfomation":TayneConfig.tyeTransformInput("Hfejyi cesveemreylooniek!"),
                "tyeFrom":"Avery",
                "tyeTrankTalkRoomName":"CutChat"
            ],
            [
                "tyeFromId":"5isd1teylh3.jpg",
                "tyeInfomation":"Welcome to Tayne’s hairstyle chatroom! Any new inspirations to share today?",
                "tyeFrom":"Avery",
                "tyeTrankTalkRoomName":"CutChat"
            ],
            [
                "tyeFromId":"p1UGqCUxelSv5bpT.jpg",
                "tyeInfomation":"What are you up to? Let’s chat!",
                "tyeFrom":"Hyrine",
                "tyeTrankTalkRoomName":"Hyrine"
            ],
            [
                "tyeFromId":"wyfnn0QwxC3NHmcv.jpg",
                "tyeInfomation":"Hi, anything interesting happening lately?",
                "tyeFrom":"Lyra",
                "tyeTrankTalkRoomName":"Lyra"
            ]
        ]
        
        hairsChallenges = tyeHairChallenge.kj.modelArray(HairChallengeModel.self)
        trendTalkRooms = trendTalkRoom.kj.modelArray(TrendTalkRoom.self)
        tayneTalkers = tayneTalker.kj.modelArray(TrendTalkRoom.self)
        trendTalkInfomations = trendTalkInfomation.kj.modelArray(TalkInfomationModel.self)
        
        trendTalkDatas = trendTalkInfomations.filter({ talkInfomationModel in
            return talkInfomationModel.tyeFrom == talkInfomationModel.tyeTrankTalkRoomName
        })
        
        if let tyeLoginId = UserDefaults.standard.string(forKey: "tyeLoginId") {
            
            if let talkerLast = tayneTalkers.last, tyeLoginId == talkerLast.roomUserId{
                tyeNow.accept(talkerLast)
                updateUserProfile()
            }else{
                tyeNow.accept(TrendTalkRoom(roomUserId: tyeLoginId,roomUserName: tyeLoginId))
                updateUserProfile()
            }
        }
    }
    
    func updateUserProfile(){
        
        let documentTyePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.path
        if documentTyePath?.count ?? 0 > 0 {
            
            MMKV.initialize(rootDir: documentTyePath)
            
            guard let tayneNow = tyeNow.value else {
                UserDefaults.standard.removeObject(forKey: "tyeLoginId")
                UserDefaults.standard.synchronize()
                self.tyeDataStore = nil
                return
            }
            
            tyeDataStore = MMKV(mmapID: tayneNow.roomUserId)
            UserDefaults.standard.set(tayneNow.roomUserId, forKey: "tyeLoginId")
            UserDefaults.standard.synchronize()
            
            if let tyeCredit = tyeDataStore?.string(forKey: "tyeCreditNumber") {
                if let tyeCreditNumber = Int(tyeCredit), var tyeNow = self.tyeNow.value {
                    if tyeCreditNumber > 0 {
                        tyeNow.tayneCredit = tyeCreditNumber
                        self.tyeNow.accept(tyeNow)
                    }
                }
            }
        }
    }
    
    class func tyeCheckCompleteTransactions(){
        SwiftyStoreKit.completeTransactions(atomically: true) { toyeStorePurchases in
            let tyeStateList = [1,3]
            for toyStoreP in toyeStorePurchases {
                if tyeStateList.contains(toyStoreP.transaction.transactionState.rawValue) {
                    if toyStoreP.needsFinishTransaction {
                        SwiftyStoreKit.finishTransaction(toyStoreP.transaction)
                    }
                }
            }
        }
    }
    
}


