//
//  SignInViewController.swift
//  AsaKore
//
//  Created by 刈部拓未 on 2018/06/09.
//  Copyright © 2018年 刈部拓未. All rights reserved.
//

import Foundation
import UIKit
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
