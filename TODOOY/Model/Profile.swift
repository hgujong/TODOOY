//
//  Profile.swift
//  TODO
//
//  Created by 서종현 on 2022/12/26.
//

import Foundation

struct Profile {
    var mail: String
    var pw: String
    var prefersNotifications = true
    
    static let `default` = Profile(mail: "JongHyun", pw: "jhseo0704")
}
