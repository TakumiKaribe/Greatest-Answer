//
//  SignInViewController.swift
//  AsaKore
//
//  Created by 刈部拓未 on 2018/06/09.
//  Copyright © 2018年 刈部拓未. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn

final class SignInViewController: UIViewController, GIDSignInUIDelegate {
    private var signInButton = GIDSignInButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        view.addSubview(signInButton)
        signInButton.height(24)
        signInButton.width(44)
        signInButton.centerXToSuperview()
        signInButton.centerYToSuperview()
    }
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension SignInViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let _ = error { return }
        
        guard let authentication = user.authentication else { return }
        
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let _ = error { return }
            print("signed in")
            let controller = UIAlertController(title: "Send Invitation", message: nil, preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in self?.invitation() }))
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
}

extension SignInViewController: InviteDelegate {
    func invitation() {
        if let invite = Invites.inviteDialog() {
            invite.setInviteDelegate(self)
            
            // NOTE: You must have the App Store ID set in your developer console project
            // in order for invitations to successfully be sent.
            
            // A message hint for the dialog. Note this manifests differently depending on the
            // received invitation type. For example, in an email invite this appears as the subject.
            invite.setMessage("Try this out!\n -\(GIDSignIn.sharedInstance().currentUser.profile.name)")
            // Title for the dialog, this is what the user sees before sending the invites.
            invite.setTitle("Invites Example")
            invite.setDeepLink("app_url")
            invite.setCallToActionText("Install!")
            invite.setCustomImage("https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png")
            invite.open()
        }
    }
}
