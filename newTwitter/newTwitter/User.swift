//
//  User.swift
//  newTwitter
//
//  Created by Elev on 16/05/2018.
//  Copyright © 2018 Nikolai Povlsen. All rights reserved.
//

import Foundation

enum state { case success, passwordNotStrong, emtyUserName, emtyEmail, emtyName }

class User {
    var errors : [state] = []
    
    private var userName: String = String()
    private var password: String = String()
    private var email: String = String()
    private var name: String = String()
    private var profilePicture: File
    private var profileSite: ProfileSite
    
    init?(userName: String, password: String, email: String, name: String) {
        let userNameError = self.setUserName(userName: userName)
        if userNameError != .success {errors.append(userNameError)}
        
        let passwordError = self.setPassword(password: password)
        if passwordError != .success {errors.append(passwordError)}
        
        let emailError = self.setEmail(email: email)
        if emailError != .success {errors.append(emailError)}
        
        let nameError = self.setName(name: name)
        if nameError != .success {errors.append(nameError)}
        
        if errors.count > 0 {return nil}
    }
    
    func setUserName(userName: String) -> state {
        if userName.count <= 0 {
            return state.emtyUserName
        }
        self.userName = userName
        
        return state.success
    }
    
    func setPassword(password: String) -> state {
        if password.count <= 0 {
            return state.passwordNotStrong
        }
        self.password = password
        
        return state.success
    }
    
    func setEmail(email: String) -> state {
        if email.count <= 0 {
            return state.emtyEmail
        }
        self.email = email
        
        return state.success
    }

    func setName(name: String) -> state {
        if name.count <= 0 {
            return state.emtyName
        }
        self.name = name
        
        return state.success
    }
}
