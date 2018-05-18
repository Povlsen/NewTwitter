//
//  File.swift
//  newTwitter
//
//  Created by elev on 16/05/2018.
//  Copyright © 2018 Nikolai Povlsen. All rights reserved.
//

import Foundation

class File {
    private var server:Server
    private var share:Share
    private var path:String
    private var uploadDate: Date
    private var fileName: String
    private var type:FileType
    
    init(server:Server, share:Share, path:String, uploadDate: Date, fileName: String, type:FileType) {
        self.server = server
        self.share = share
        self.path = path
        self.uploadDate = uploadDate
        self.fileName = fileName
        self.type = type
    }
    
    func getFullPath() -> String {
        return "\(self.server.getServer)\(self.share.getShare)\(self.path)\(self.fileName)"
    }
    
    func getUploadDate() -> Date {
        return self.uploadDate
    }
}

class FileType {
    private var type: String
    
    init(type:String) {
        self.type = type
    }
    
    func getType() -> String {
        return self.type
    }
    
    func setType(type:String) {
        self.type = type
    }
}

class Server {
    private var server: String
    
    init(server:String) {
        self.server = server
    }
    
    func getServer() -> String {
        return self.server
    }
    
    func setServer(server:String) {
        self.server = server
    }
}

class Share {
    private var share: String
    
    init(share:String) {
        self.share = share
    }
    
    func getShare() -> String {
        return self.share
    }
    
    func setShare(share:String) {
        self.share = share
    }
}
