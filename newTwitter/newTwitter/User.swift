//
//  User.swift
//  newTwitter
//
//  Created by Elev on 16/05/2018.
//  Copyright © 2018 Nikolai Povlsen. All rights reserved.
//

import Foundation

enum state { case success, passwordNotStrong, emtyUserName, emtyEmail, emtyName, passwordDontMatch, passwordNotCorrect, oldPasswordNotCorrect }

class User {
    var errors : [state] = []
    
    private var userName: String = String()
    private var password: String = String()
    private var email: String = String()
    private var name: String = String()
    private var profilePicture: File?
    private var profileSite: ProfileSite
    
    init?(userName: String, password: String, password2: String, email: String, name: String, profilePicture: File?, profileSite:ProfileSite) {
        let userNameError = self.setUserName(userName: userName)
        if userNameError != .success {errors.append(userNameError)}
        
        let passwordErrors = self.isPasswordValid(password: password, password2: password2)
        if passwordErrors.count <= 0 {
            self.password = password
        } else { errors.append(contentsOf: passwordErrors) }
        
        let emailError = self.setEmail(email: email)
        if emailError != .success {errors.append(emailError)}
        
        let nameError = self.setName(name: name)
        if nameError != .success {errors.append(nameError)}
        
        self.profileSite = profileSite
        self.profilePicture = profilePicture
        
        if errors.count > 0 {return nil}
    }
    
    func setUserName(userName: String) -> state {
        if userName.count <= 0 {
            return state.emtyUserName
        }
        self.userName = userName
        
        return state.success
    }
    
    func getUserName() -> String {
        return self.userName
    }
    
    private func isPasswordValid(password:String, password2:String) -> [state] {
        var errors:[state] = []
        if password.count <= 0 {
            errors.append(state.passwordNotStrong)
        }
        if password != password2 {
            errors.append(.passwordDontMatch)
        }
        
        return errors
    }
    
    func changePassword(oldPassword:String, newPassword:String, newPassword2:String) -> [state] {
        var errors:[state] = []
        if self.password != oldPassword {
            errors.append(.oldPasswordNotCorrect)
        }
        
        errors.append(contentsOf: self.isPasswordValid(password: newPassword, password2: newPassword2))
        
        if errors.count <= 0 {
            self.password = newPassword
        }
        
        return errors
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
    
    func setProfileSite(profileSite: ProfileSite) {
        self.profileSite = profileSite
    }
    
    func setProfilePicture(profilePicture: File) {
        self.profilePicture = profilePicture
    }
}
