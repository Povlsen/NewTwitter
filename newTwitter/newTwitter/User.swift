//
//  User.swift
//  newTwitter
//
//  Created by Elev on 16/05/2018.
//  Copyright © 2018 Nikolai Povlsen. All rights reserved.
//

import Foundation

enum error { case success, passwordNotStrong, emtyUserName, emtyEmail, emtyName, passwordDontMatch, passwordNotCorrect, oldPasswordNotCorrect }

class User {
    var errors : [error] = []
    
    private var userName: String = String()
    private var password: String = String()
    private var email: String = String()
    private var name: String = String()
    private var profilePicture: File?
    private var profileSite: ProfileSite
    
    init?(userName: String, password: String, password2: String, email: String, name: String, profilePicture: File?, profileSite:ProfileSite) {
        self.profileSite = profileSite
        self.profilePicture = profilePicture
        
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
        
        
        
        if errors.count > 0 {return nil}
    }
    
    func setUserName(userName: String) -> error {
        if userName.count <= 0 {
            return error.emtyUserName
        }
        self.userName = userName
        
        return error.success
    }
    
    func getUserName() -> String {
        return self.userName
    }
    
    private func isPasswordValid(password:String, password2:String) -> [error] {
        var errors:[error] = []
        if password.count <= 0 {
            errors.append(error.passwordNotStrong)
        }
        if password != password2 {
            errors.append(.passwordDontMatch)
        }
        
        return errors
    }
    
    func changePassword(oldPassword:String, newPassword:String, newPassword2:String) -> [error] {
        var errors:[error] = []
        if self.password != oldPassword {
            errors.append(.oldPasswordNotCorrect)
        }
        
        errors.append(contentsOf: self.isPasswordValid(password: newPassword, password2: newPassword2))
        
        if errors.count <= 0 {
            self.password = newPassword
        }
        
        return errors
    }
    
    func setEmail(email: String) -> error {
        if email.count <= 0 {
            return error.emtyEmail
        }
        self.email = email
        
        return error.success
    }
    
    func getEmail() -> String {
        return self.email
    }

    func setName(name: String) -> error {
        if name.count <= 0 {
            return error.emtyName
        }
        self.name = name

        return error.success
    }
    
    func getName() -> String {
        return self.name
    }
    
    func setProfileSite(profileSite: ProfileSite) {
        self.profileSite = profileSite
    }
    
    func getProfileSite() -> ProfileSite {
        return self.profileSite
    }
    
    func setProfilePicture(profilePicture: File) {
        self.profilePicture = profilePicture
    }
    
    func getProfilePicture() -> String {
        return self.profilePicture?.getFullPath() ?? ""
    }
}
