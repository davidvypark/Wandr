//
//  WandrPost.swift
//  Wandr
//
//  Created by David Park on 7/19/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import Foundation
import UIKit

struct WandrPost {
	
	let username: String
	var profilePicture = UIImage()
	let content: String //change to video file	
	var bookmarks: Int
	let location: String
	var comments: [String]
	let caption: String
	
}

func ==(lhs: WandrPost, rhs: WandrPost) -> Bool {
	return lhs == rhs
}
