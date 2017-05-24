//
//  UserDefaultsValues.swift
//  LifeReplay
//
//  Created by Divum Corporate Services on 24/03/17.
//  Copyright © 2017 Divum. All rights reserved.
//

import UIKit

class UserDefaultsValues: NSObject {
    //SharedInstance
    static let sharedInstance = UserDefaultsValues()
    
    //User Defaults
    let defaults = UserDefaults.standard
    
    func isDropboxRegistered() -> Bool {
        if let bIsRegistered: Bool = defaults.bool(forKey: "DropboxStatus") as Bool? {
            return bIsRegistered
        }
        else {
            defaults.set(false, forKey: "DropboxStatus")
            return false
        }
    }
    
    func setDropboxRegister(isStatus:Bool) {
        
        defaults.set(isStatus, forKey: "DropboxStatus")
        
    }
    
    func dropboxToken() -> String {
        if let bToken: String = defaults.string(forKey: "DropboxToken") as String? {
            return bToken
        }
        else {
            defaults.set("", forKey: "DropboxToken")
            return ""
        }
    }
    
    func setDropboxToken(pToken: String) {
        
        defaults.set(pToken, forKey: "DropboxToken")
        
    }
    
    func dropboxUserId() -> Int {
        if let bToken: Int = defaults.integer(forKey: "DropboxId") as Int? {
            return bToken
        }
        else {
            defaults.set(0, forKey: "DropboxId")
            return 0
        }
    }
    
    func setDropboxUserId(pToken: Int) {
        
        defaults.set(pToken, forKey: "DropboxId")
    }
    
    func setLoginStatus(pStatus: Bool) {
        
        defaults.set(pStatus, forKey: "LoginStatus")
    }
    
    func getLoginStatus() -> Bool
    {
        if let islogin: Bool = defaults.bool(forKey: "LoginStatus") as Bool? {
            return islogin
        }
        else {
            defaults.set(false, forKey: "LoginStatus")
            return false
        }
    }
    
    
    func getLoginUserId() -> Int {
        if let ploginId: Int = defaults.integer(forKey: "LoginUserId") as Int? {
            return ploginId
        }
        else {
            defaults.set(0, forKey: "LoginUserId")
            return 0
        }
    }
    
    func setLoginUserId(ploginId: Int)
    {
        defaults.set(ploginId, forKey: "LoginUserId")
    }

    func setDropboxSelectedFoldersCount(pFolderCount: Int)
    {
        defaults.set(pFolderCount, forKey: "DropboxFolderCount")
    }
    
    
    func getDropboxSelectedFoldersCount() -> Int
    {
        if let ploginId: Int = defaults.integer(forKey: "DropboxFolderCount") as Int? {
            return ploginId
        }
        else
        {
            defaults.set(0, forKey: "DropboxFolderCount")
            return 0
        }
    }
    
}
