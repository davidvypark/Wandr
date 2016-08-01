//
//  WandrUser.swift
//  Wandr
//
//  Created by David Park on 7/19/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit
import FirebaseStorage

class WandrUser: NSObject, NSCoding {
    
    let displayName: String
    let fullName: String
    let username: String = "USE DISPLAYNAME INSTEAD" // should be changed to displayName
    var profilePicture: UIImage?
    var profilePictureReferencePath: FIRStorageReference {
        return FIRStorage.storage().referenceWithPath("/users").child(self.uid).child("profile_photo")
    }
    let uid: String
    let followerCount: Int
    let followingCount: Int
    let postCount: Int
    
    
    init(withDisplayName displayName: String,
                         fullName: String,
                         profilePicture: UIImage?,
                         uid: String,
                         followerCount: Int,
                         followingCount: Int,
                         postCount: Int) {
        
        
        self.displayName = displayName
        self.fullName = fullName
        self.profilePicture = profilePicture
        self.uid = uid
        self.followerCount = followerCount
        self.followingCount = followingCount
        self.postCount = postCount
    
        super.init()
    }
    
    @objc required init?(coder aDecoder: NSCoder) {
        
        self.displayName = aDecoder.decodeObjectForKey("displayName") as! String
        self.fullName = aDecoder.decodeObjectForKey("fullName") as! String
        self.profilePicture = aDecoder.decodeObjectForKey("ProfilePicture") as? UIImage
        self.uid = aDecoder.decodeObjectForKey("uid") as! String
        self.followerCount = aDecoder.decodeObjectForKey("followerCount") as! Int
        self.followingCount = aDecoder.decodeObjectForKey("followingCount") as! Int
        self.postCount = aDecoder.decodeObjectForKey("postCount") as! Int
    }
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.displayName, forKey: "displayName")
        aCoder.encodeObject(self.fullName, forKey: "fullName")
        aCoder.encodeObject(self.profilePicture, forKey: "profilePicture")
        aCoder.encodeObject(self.uid, forKey: "uid")
        aCoder.encodeObject(self.followerCount, forKey: "followerCount")
        aCoder.encodeObject(self.followingCount, forKey: "followingCount")
        aCoder.encodeObject(self.postCount, forKey: "postCount")
    }
    
    func loadProfilePicture(completion: (UIImage?) -> () ) {
        profilePictureReferencePath.dataWithMaxSize(1 * 1024 * 1024) { (data, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("Invalid profile picture data")
                completion(nil)
                return
            }
            
            guard let profilePicture = UIImage(data: data) else {
                print("Could convert data to UIImage")
                completion(nil)
                return
            }
            completion(profilePicture)
        }
    }
    
    
    func saveToUserDefaults() {
        let data = NSKeyedArchiver.archivedDataWithRootObject(self)
        NSUserDefaults.standardUserDefaults().setObject(data, forKey: Constants.currentUserKey)
    }
    
    class func loadCurrentUser() -> WandrUser? {
        guard let data = NSUserDefaults.standardUserDefaults().objectForKey(Constants.currentUserKey) as? NSData else {
            return nil
        }
        let user = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? WandrUser
        
        return user
    }
}





