//
//  ProfileSite.swift
//  newTwitter
//
//  Created by Elev on 17/05/2018.
//  Copyright © 2018 Nikolai Povlsen. All rights reserved.
//

import Foundation

class ProfileSite {
    private var user:User
    private var bannerPicture:File?
    private var tweets:[Post] = []
    init(user: User) {
        self.user = user
    }
    func userName() -> String{
        return user.getName()
    }
    func profilePicture() -> String{
        return user.getProfilePicture()
    }
}
