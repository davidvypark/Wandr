//
//  ProfileHeaderViewController.swift
//  Wandr
//
//  Created by Matt Amerige on 7/20/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit

class ProfileHeaderViewController: UIViewController {
    
    let profilePictureImageView = UIImageView()
    let usernameLabel = UILabel()
    
    init(user: WandrUser) {
        self.profilePictureImageView.image = user.profilePicture
        self.usernameLabel.text = user.username
        super.init(nibName: nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = UIColor.purpleColor()
    }
    
    
}
