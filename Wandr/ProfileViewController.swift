//
//  ProfileViewController.swift
//  Wandr
//
//  Created by Matt Amerige on 7/19/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orangeColor()
        tabBarItem.title = "Profile"
        navigationItem.title = "Matt Amerige"
        setupSubViews()
    }
    
    func setupSubViews() {

        let testUser = WandrUser(username: "Matt Amerige")
        testUser.profilePicture = UIImage(named: "matt")
        
        let profileHeaderVC = ProfileHeaderViewController(user: testUser)
        view.addSubview(profileHeaderVC.view)
        
        // Profile header view has the same width as the screen, takes up 1/4 of the screen, and is at the top        
        profileHeaderVC.view.snp_makeConstraints { (make) in
            make.width.equalTo(view.snp_width)
            make.height.equalTo(view).dividedBy(3)
            make.top.equalTo(view.snp_top)
            make.left.equalTo(view.snp_left)
        }
    }
}
