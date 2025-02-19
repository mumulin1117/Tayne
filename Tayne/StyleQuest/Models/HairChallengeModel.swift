//
//  HairChallengeModel.swift
//  Tayne
//
//  Created by Tayne on 2025/2/13.
//


import Foundation
import KakaJSON

struct Participant: Convertible {
    var challengesId: String = ""
    var userTyeDisplayName: String = ""
    var challengeCaption: String = ""
    var userChallengePics: [String] = []
}

struct HairChallengeModel: Convertible {
    var challengeId: String = ""
    var challengeName: String = ""
    var challengeDescription: String = ""
    var participantList: [Participant] = []
    var totalPageviews:Int = Int.random(in: 30..<101)
}


struct TrendTalkRoom:Convertible {
    var roomUserId = ""
    var roomUserName = ""
    var tayneCredit = 0
    
    var tyeFollowNumber = Int.random(in: 3..<10)
    var tyeFollowerNumber = Int.random(in: 3..<10)
}

struct TalkInfomationModel:Convertible{
    var tyeFromId = ""
    var tyeInfomation = ""
    var tyeFrom = ""
    var tyeTo = "" // 对方的名字
    var tyeToId = "" // 对方的头像
    var tyeGiftName = ""
    var tyeGIftNumber = 0
    var tyeTrankTalkRoomName = ""
    var tyeAura = 0 // 
}
