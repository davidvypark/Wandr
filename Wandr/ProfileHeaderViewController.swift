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
    
    //MARK: Properties
    
    let user: WandrUser
    
    let profilePictureButton = UIButton()
    let usernameLabel = UILabel()
    let aboutLabel = UILabel()
    
    let postsButton = UIButton(type: .System)
    let followingButton = UIButton(type: .System)
    let followersbutton = UIButton(type: .System)
    
    let buttonStackView = UIStackView()
    
    let editProfileButton = UIButton(type: .System)
    
    //MARK: Initialization
    init(user: WandrUser) {
        self.user = user
        super.init(nibName: nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.user = WandrUser(username: "EMPTY")
        super.init(coder: aDecoder)
    }
    //MARK: ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        setupSubviewAppearance()
        setupButtonTargetAction()
        setupSubviewConstraints()
    }
    
    func setupSubviewAppearance() {
        // Profile Picture
        profilePictureButton.setImage(user.profilePicture?.circle, forState: .Normal)

        // Username Label
        setupUsernameLabelAppearance()
        
        // About Label
        setupAboutLabelAppearance()
        
        // Post Button
        configureSplitLineButton(postsButton, withText: "18", subText: "posts")
        
        // Following Button
        configureSplitLineButton(followingButton, withText: "100", subText: "following")
        
        // Followers Button
        configureSplitLineButton(followersbutton, withText: "53", subText: "followers")
        
        // Edit Profile Button
        setupEditButtonAppearance()
        
    }
    
    //MARK: Subview Appearance
    
    func configureSplitLineButton(button: UIButton, withText text: String, subText: String) {
        
        button.setTitle("\(text)\n\(subText)", forState: .Normal)
        
        button.titleLabel?.lineBreakMode = .ByWordWrapping
        button.titleLabel?.textAlignment = .Center
        
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Highlighted)
    }
    
    func setupUsernameLabelAppearance() {
        usernameLabel.text = user.username
        usernameLabel.font = UIFont.boldSystemFontOfSize(UIFont.systemFontSize())
    }
    
    func setupAboutLabelAppearance() {
        aboutLabel.text = "This is the blib. I'm just writing this to fill some space." // Assuming this comes from the user
        aboutLabel.font = UIFont.systemFontOfSize(UIFont.systemFontSize())
        aboutLabel.lineBreakMode = .ByWordWrapping
        aboutLabel.numberOfLines = 2
    }
    
    func setupEditButtonAppearance() {
        editProfileButton.setTitle("Edit Profile", forState: .Normal)
        editProfileButton.backgroundColor = UIColor.lightGrayColor()
        editProfileButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
    }
    
    //MARK: Constraints
    func setupSubviewConstraints() {
        
        // Add the profile picture to the upper left, with a padding on 8 points on the top and left
        // The profile should take up about half of the view height.
        let padding: CGFloat = 8
        view.addSubview(profilePictureButton)
        profilePictureButton.snp_makeConstraints { (make) in
            make.height.equalTo(view.snp_height).dividedBy(2.5)
            make.width.equalTo(view.snp_height).dividedBy(2.5)
            make.left.equalTo(view.snp_left).offset(padding)
            make.top.equalTo(view.snp_top).offset(padding)
        }
        
        // username should be 8 points below the profile picture
        view.addSubview(usernameLabel)
        usernameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(view.snp_left).offset(padding)
            make.top.equalTo(profilePictureButton.snp_bottom).offset(padding)
        }
        
        // Blib should be 8 points below the name, extending to the edges of the super view (minus the padding)
        view.addSubview(aboutLabel)
        aboutLabel.snp_makeConstraints { (make) in
            make.top.equalTo(usernameLabel.snp_bottom).offset(padding)
            make.left.equalTo(view.snp_left).offset(padding)
            make.right.equalTo(view.snp_right).offset(-padding)
        }
        
        view.addSubview(postsButton)
        view.addSubview(followersbutton)
        view.addSubview(followingButton)
        view.addSubview(buttonStackView)
        
        buttonStackView.addArrangedSubview(postsButton)
        buttonStackView.addArrangedSubview(followersbutton)
        buttonStackView.addArrangedSubview(followingButton)
        buttonStackView.axis = .Horizontal
        buttonStackView.distribution = .FillProportionally
        buttonStackView.spacing = padding * 2.0
        
        buttonStackView.snp_makeConstraints { (make) in
            make.top.equalTo(view.snp_top).offset(padding)
            make.right.equalTo(view.snp_right).offset(-padding * 4.0)
            
        }
        
        view.addSubview(editProfileButton)
        
        editProfileButton.snp_makeConstraints { (make) in
            make.centerX.equalTo(buttonStackView.snp_centerX)
            make.top.equalTo(buttonStackView.snp_bottom).offset(padding)
            make.left.equalTo(buttonStackView.snp_left).offset(-padding * 2.0)
            make.right.equalTo(buttonStackView.snp_right).offset(padding * 2.0)
        }
        
    }
    
    //MARK: Button Action
    func setupButtonTargetAction() {
        // This doesn't work yet!
        profilePictureButton.addTarget(self, action: #selector(self.profileButtonTapped), forControlEvents: .TouchUpInside)
    }
    
    func profileButtonTapped(sender: UIButton) {
      print("Profile button tapped")
    }
    
    
}
