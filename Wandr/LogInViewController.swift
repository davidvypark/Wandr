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
import FirebaseAuth

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
        
        guard let token = FBSDKAccessToken.currentAccessToken() else { return }
		
        let credential = FIRFacebookAuthProvider.credentialWithAccessToken(token.tokenString)

        FIRAuth.auth()?.signInWithCredential(credential, completion: { (user, error) in
            if error == nil {
                print("successfully logged in")
                
                //TODO: Add logic to only update user data for the first time the user is logged in (NSUserDefaults?)
                
                // Push to the main app
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                let mainVC = appDelegate.configureTabBarForRoot()
                self.presentViewController(mainVC, animated: true, completion: nil)
            }
        })
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
       print("user logged out")
    }
    
    func setData(forUser user: FIRUser) {
        //TODO: pull data for user's profile picture that is generated from FB and put it in the firebase storage/database
        // profile pictures will not be synced with FB aside from the first login, just to populate the profile.
        // After that the user can change the photo to whatever they like

            

    }
    func setPhotoDataForURL(url: NSURL?) {
        
        guard let url = url else { return }
        
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithURL(url) { (data, response, error) in
            
        }
        dataTask.resume()
    }

}



