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
import FirebaseDatabase
import FirebaseStorage

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
                
                if let user = user {
                    self.setData(forUser: user)
                }
                else {
                    print("Unable to unwrap user")
                }
            }
        })
    }
    
    func pushToMainApp(forUser user: WandrUser) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let mainVC = appDelegate.configureTabBarForRoot(withUser: user)
        self.presentViewController(mainVC, animated: true, completion: nil)
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("user logged out")
    }
    
    func setData(forUser user: FIRUser) {
        // Create a reference for where this user will live on the RT Database.
        // See Firebase-Database-Model included in the root directory of this project for a guide.
        let userReference = FIRDatabase.database().referenceWithPath("/users").childByAutoId()
        
        guard let displayName = user.displayName else { return }
        
        // Setting the default values for a new user
        userReference.child("display_name").setValue(displayName)
        userReference.child("user_auth_uid").setValue(user.uid)
        userReference.child("follower_count").setValue(0)
        userReference.child("following_count").setValue(0)
        userReference.child("post_count").setValue(0)
        
        // The user photo needs to be stored on the Firebase/Storage, not the RT database.
        setPhotoDataForURL(user.photoURL, forUserAuthID: user.uid)
        
        // Save basic user data to plist on disk
        let currentUser = WandrUser(withDisplayName: displayName,
                                    fullName: displayName,
                                    profilePicture: nil,
                                    uid: user.uid, followerCount: 0, followingCount: 0, postCount: 0)
        
        currentUser.saveToUserDefaults()
        
        pushToMainApp(forUser: currentUser)
    }
    
    func setPhotoDataForURL(url: NSURL?, forUserAuthID userUID: String) {
        
        // First grab the image from the FIRUser photoURL property. Not sure if this is better 
        // than just doing the contentsOfURL class method on UIImage. I think that one is synchronous,
        // whereas the below is an async call
        
        guard let url = url else { return }
        
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithURL(url) { (data, response, error) in
            guard let data = data else { return }
            print("Storing photo....")
            // save this image to the firebase storage
            let photoRef = FIRStorage.storage().referenceWithPath("/users").child(userUID).child("profile_photo")
            photoRef.putData(data)
        }
        dataTask.resume()
    }
    
}



