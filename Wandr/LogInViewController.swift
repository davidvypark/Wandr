//
//  LogInViewController.swift
//  
//
//  Created by David Park on 7/25/16.
//
//

import UIKit
import FBSDKLoginKit
import Firebase

class LogInViewController: UIViewController {
    
    let fbLoginButton = FBSDKLoginButton()

    override func viewDidLoad() {
        super.viewDidLoad()
		
        view.backgroundColor = UIColor.whiteColor()
        fbLoginButton.center = view.center
        view.addSubview(fbLoginButton)
        
        fbLoginButton.readPermissions = ["public_profile"]
        
        fbLoginButton.delegate = self
    }
}

extension LogInViewController: FBSDKLoginButtonDelegate {
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError?) {
        if let error = error {
            print(error)
            return
        }
        
        let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)

        FIRAuth.auth()?.signInWithCredential(credential, completion: { (user, error) in
            if error == nil {
                print("successfully logged in")
            }
        })
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
       print("user logged out")
    }
}




















