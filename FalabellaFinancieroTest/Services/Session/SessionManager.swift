//
//  SessionManager.swift
//  FalabellaFinancieroTest
//
//  Created by Juan Guillermo Quiroga Salamanca on 5/14/20.
//  Copyright © 2020 Globant. All rights reserved.
//

import Foundation
import CryptoSwift


protocol SessionManagerProtocol {
    func getSession() -> Session?
    func saveSession(session: Session)
}

extension MVPPresenter {
    static func inject() -> SessionManagerProtocol {
        return SessionManager.instance
    }
}
final class SessionManager {
    
    static let instance = SessionManager()
    struct dataKey{
        static let secretKey = "secret0key000000"
        static let iv = "0123456789012345"
        static let userKey = "username"
        static let passwordKey = "password"
    }
    let preferences = UserDefaults.standard
}
extension SessionManager: SessionManagerProtocol {

    func getSession() -> Session? {
        
        guard let user = preferences.array(forKey: SessionManager.dataKey.userKey), let password = preferences.array(forKey: SessionManager.dataKey.passwordKey) else { return nil }
        let session = Session(userName:decode(encrypted: user)!, password: decode(encrypted: password)!)
        return session
    }
    
    func saveSession(session: Session) {
        preferences.set(encode(value: session.userName), forKey: SessionManager.dataKey.userKey)
        preferences.set(encode(value: session.password), forKey: SessionManager.dataKey.passwordKey)
        didSave()
        
    }
    
    
}
private extension SessionManager{
    func encode(value: String) -> Array<UInt8>{

        let encrypted: Array<UInt8> = try! AES(key: Array(SessionManager.dataKey.secretKey.utf8), blockMode: CBC(iv: Array(SessionManager.dataKey.iv.utf8)), padding: .pkcs7).encrypt(Array(value.utf8))
        return encrypted
    }
    func decode(encrypted: Array<Any>) -> String?{
        guard let _encrypted: Array<UInt8>  = encrypted as? Array<UInt8> else { return nil }
        let decrypted = try! AES(key: Array(SessionManager.dataKey.secretKey.utf8), blockMode: CBC(iv: Array(SessionManager.dataKey.iv.utf8)), padding: .pkcs7).decrypt(_encrypted)
        
        return String(bytes: decrypted, encoding: .utf8)!
    }
    
    func didSave(){
        let didSave = preferences.synchronize()
        if !didSave{
            // Couldn't Save
            print("Preferences could not be saved!")
        }
    }
}


