//
//  AppDelegate+GIDSignInDelegate.swift
//  Greatest Answer
//
//  Created by 刈部拓未 on 2018/06/09.
//  Copyright © 2018年 刈部拓未. All rights reserved.
//

import Foundation
import Firebase
import GoogleSignIn

extension AppDelegate: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let _ = error { return }
        
        guard let authentication = user.authentication else { return }
        
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let _ = error {
                return
            }
            
            print("signed in")
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
}
