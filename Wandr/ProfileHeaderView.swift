//
//  ProfileHeaderView.swift
//  Wandr
//
//  Created by Matt Amerige on 7/21/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit

protocol ProfileHeaderViewDelegate: class {
    func profilePictureButtonPressed()
    func postsButtonPressed()
    func followingButtonPressed()
    func followersButtonPressed()
    func editProfileButtonPressed()
}


class ProfileHeaderView: UICollectionReusableView {
    
    weak var delegate: ProfileHeaderViewDelegate?
    
    var username = "EMPTY USERNAME"
    var profilePicture = UIImage()
    
    let profilePictureButton = UIButton()
    let usernameLabel = UILabel()
    let aboutLabel = UILabel()
    
    let postsButton = UIButton(type: .System)
    let followingButton = UIButton(type: .System)
    let followersbutton = UIButton(type: .System)
    
    let buttonStackView = UIStackView()
    
    let editProfileButton = UIButton(type: .System)
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor.whiteColor()
        setupSubviewAppearance()
        setupSubviewConstraints()
        setupButtonTargetAction()
    }
    
    func setupSubviewAppearance() {
        // Profile Picture
        profilePictureButton.setImage(profilePicture.circle, forState: .Normal)
        
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
        
        // This is all to bold just the TEXT part of the string
        let nsText = "\(text)\n\(subText)" as NSString
        let attributedStringNormal = NSMutableAttributedString(string: nsText as String,
                                                               attributes: [NSFontAttributeName:UIFont.systemFontOfSize(UIFont.systemFontSize())])
        let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFontOfSize(UIFont.systemFontSize())]
        
        attributedStringNormal.addAttributes(boldFontAttribute, range: nsText.rangeOfString(text))
        attributedStringNormal.addAttribute(NSForegroundColorAttributeName, value: UIColor.blackColor(), range: NSMakeRange(0, nsText.length))
        
        button.setAttributedTitle(attributedStringNormal, forState: .Normal)
        
        button.titleLabel?.lineBreakMode = .ByWordWrapping
        button.titleLabel?.textAlignment = .Center
    }
    
    func setupUsernameLabelAppearance() {
        usernameLabel.text = username
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
        addSubview(profilePictureButton)
        profilePictureButton.snp_makeConstraints { (make) in
            make.height.equalTo(self.snp_height).dividedBy(2.5)
            make.width.equalTo(self.snp_height).dividedBy(2.5)
            make.left.equalTo(self.snp_left).offset(padding)
            make.top.equalTo(self.snp_top).offset(padding)
        }
        
        // username should be 8 points below the profile picture
        addSubview(usernameLabel)
        usernameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(self.snp_left).offset(padding)
            make.top.equalTo(profilePictureButton.snp_bottom).offset(padding)
        }
        
        // Blib should be 8 points below the name, extending to the edges of the super view (minus the padding)
        addSubview(aboutLabel)
        aboutLabel.snp_makeConstraints { (make) in
            make.top.equalTo(usernameLabel.snp_bottom).offset(padding)
            make.left.equalTo(self.snp_left).offset(padding)
            make.right.equalTo(self.snp_right).offset(-padding)
        }
        
        // Add the post, followers, and following button to a stackview
        addSubview(postsButton)
        addSubview(followersbutton)
        addSubview(followingButton)
        addSubview(buttonStackView)
        
        buttonStackView.addArrangedSubview(postsButton)
        buttonStackView.addArrangedSubview(followersbutton)
        buttonStackView.addArrangedSubview(followingButton)
        buttonStackView.axis = .Horizontal
        buttonStackView.distribution = .FillProportionally
        buttonStackView.spacing = padding * 2.0
        
        buttonStackView.snp_makeConstraints { (make) in
            make.top.equalTo(self.snp_top).offset(padding)
            make.right.equalTo(self.snp_right).offset(-padding * 4.0)
            
        }
        
        // Edit button is below the stackview
        addSubview(editProfileButton)
        
        editProfileButton.snp_makeConstraints { (make) in
            make.centerX.equalTo(buttonStackView.snp_centerX)
            make.top.equalTo(buttonStackView.snp_bottom).offset(padding)
            make.left.equalTo(buttonStackView.snp_left).offset(-padding * 2.0)
            make.right.equalTo(buttonStackView.snp_right).offset(padding * 2.0)
        }
    }
    
    func setupButtonTargetAction() {
        
        profilePictureButton.addTarget(self, action: #selector(forwardButtonAction), forControlEvents: .TouchUpInside)
        postsButton.addTarget(self, action: #selector(forwardButtonAction), forControlEvents: .TouchUpInside)
        followersbutton.addTarget(self, action: #selector(forwardButtonAction), forControlEvents: .TouchUpInside)
        followingButton.addTarget(self, action: #selector(forwardButtonAction), forControlEvents: .TouchUpInside)
        editProfileButton.addTarget(self, action: #selector(forwardButtonAction), forControlEvents: .TouchUpInside)
        
    }
    
    func forwardButtonAction(sender: UIButton) {
        
        switch sender {
        case profilePictureButton: delegate?.profilePictureButtonPressed()
        case postsButton: delegate?.postsButtonPressed()
        case followingButton: delegate?.followingButtonPressed()
        case followersbutton: delegate?.followersButtonPressed()
        case editProfileButton: delegate?.editProfileButtonPressed()
        default: break // list is exhaustive
        }
        
    }

    

}
