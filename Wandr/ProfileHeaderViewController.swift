//
//  ProfileHeaderViewController.swift
//  Wandr
//
//  Created by Matt Amerige on 7/20/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit

class ProfileHeaderViewController: UIViewController {
    
    let profilePictureButton = UIButton()
    let usernameLabel = UILabel()
    
    init(user: WandrUser) {
        self.usernameLabel.text = user.username
        self.profilePictureButton.setImage(user.profilePicture?.circle, forState: .Normal)
        self.profilePictureButton.adjustsImageWhenHighlighted = false
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
        profilePictureButton.translatesAutoresizingMaskIntoConstraints = false
        profilePictureButton.heightAnchor.constraintEqualToAnchor(view.heightAnchor, multiplier: 0.5).active = true
        profilePictureButton.widthAnchor.constraintLessThanOrEqualToAnchor(profilePictureButton.heightAnchor).active = true
        profilePictureButton.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: padding).active = true
        profilePictureButton.leftAnchor.constraintEqualToAnchor(view.leftAnchor, constant: padding).active = true
        
        // username should be 8 points below the profile picture
        view.addSubview(usernameLabel)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.leftAnchor.constraintEqualToAnchor(view.leftAnchor, constant: padding).active = true
        usernameLabel.topAnchor.constraintEqualToAnchor(profilePictureButton.bottomAnchor, constant: padding).active = true
    }
    
    func setupButtonTargetAction() {
        // This doesn't work yet!
        profilePictureButton.addTarget(self, action: #selector(self.profileButtonTapped), forControlEvents: .TouchUpInside)
    }
    
    func profileButtonTapped(sender: UIButton) {
      print("Profile button tapped")
    }
    
    
}
