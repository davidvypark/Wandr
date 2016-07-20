//
//  ProfileViewController.swift
//  Wandr
//
//  Created by Matt Amerige on 7/19/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orangeColor()
        title = "Profile"
        setupSubViews()
    }
    
    func setupSubViews() {

        let testUser = WandrUser(username: "Matt Amerige")
        testUser.profilePicture = UIImage(named: "matt")
        
        let profileHeaderVC = ProfileHeaderViewController(user: testUser)
        view.addSubview(profileHeaderVC.view)
        
        profileHeaderVC.view.translatesAutoresizingMaskIntoConstraints = false
        // Profile header view has the same width as the screen, takes up 1/4 of the screen, and is at the top
        profileHeaderVC.view.widthAnchor.constraintEqualToAnchor(view.widthAnchor).active = true
        profileHeaderVC.view.heightAnchor.constraintEqualToAnchor(view.heightAnchor, multiplier: 0.25).active = true
        profileHeaderVC.view.topAnchor.constraintEqualToAnchor(view.topAnchor).active = true
        profileHeaderVC.view.leftAnchor.constraintEqualToAnchor(view.leftAnchor).active = true
    }
}
