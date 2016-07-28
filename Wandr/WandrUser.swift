//
//  WandrUser.swift
//  Wandr
//
//  Created by David Park on 7/19/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit

class WandrUser {
    
    var username: String
    var profilePicture: UIImage?
	var bio: String?
	var currentCity: String?
	
	
	init(username: String, profilePicture: UIImage, bio: String, currentCity: String) {
        self.username = username
		self.profilePicture = profilePicture
		self.bio = bio
		self.currentCity = currentCity
	}
}