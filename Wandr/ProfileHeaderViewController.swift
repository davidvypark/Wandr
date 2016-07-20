//
//  ProfileHeaderViewController.swift
//  Wandr
//
//  Created by Matt Amerige on 7/20/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit
import SnapKit

class ProfileHeaderViewController: UIViewController {
    
    let profilePictureButton = UIButton()
    let usernameLabel = UILabel()
    
    init(user: WandrUser) {
        self.usernameLabel.text = user.username
        self.profilePictureButton.setImage(user.profilePicture?.circle, forState: .Normal)
        super.init(nibName: nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        setupButtonTargetAction()
        setupViews()
    }
    
    func setupViews() {
        // Add the profile picture to the upper left, with a padding on 8 points on the top and left
        // The profile should take up about half of the view height.
        let padding: CGFloat = 8
        view.addSubview(profilePictureButton)
        profilePictureButton.snp_makeConstraints { (make) in
            make.height.equalTo(view.snp_height).dividedBy(2)
            make.width.equalTo(view.snp_height).dividedBy(2)
            make.left.equalTo(view.snp_left).offset(padding)
            make.top.equalTo(view.snp_top).offset(padding)
        }
        
        // username should be 8 points below the profile picture
        view.addSubview(usernameLabel)
        usernameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(view.snp_left).offset(padding)
            make.top.equalTo(profilePictureButton.snp_bottom).offset(padding)
        }
    }
    
    func setupButtonTargetAction() {
        // This doesn't work yet!
        profilePictureButton.addTarget(self, action: #selector(self.profileButtonTapped), forControlEvents: .TouchUpInside)
    }
    
    func profileButtonTapped(sender: UIButton) {
      print("Profile button tapped")
    }
    
    
}
