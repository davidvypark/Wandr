//
//  TestDataUsers.swift
//  Wandr
//
//  Created by David Park on 7/19/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import Foundation
import UIKit

//TEST USERS

let user1 = WandrUser(username: "DavidYolo420")
let user2 = WandrUser(username: "MattyTrump")





//TEST POSTS

let post1 = WandrPost(user: user1, content: UIImage(named:"stockpic1")! , bookmarks: 50, location: "Los Angeles, CA", comments: ["awesome!! Take a pic!!! Bring me back a souvenier", "wish i was there", "#GOALS"], caption: "Me and the squad taking a little trip to destroy a ring real quick. Should be back by the weekend. Hit me up if you want to grab some tacos")

let post2 = WandrPost(user: user2, content: UIImage(named:"stockpic2")!, bookmarks: 80, location: "Las Vegas, NV", comments: ["I think i need to go to jelly school after this", "wow youre so lucky", "marry me!"], caption: "Had a great time hiking today. This place is pretty cool but I have yet to see any yellow stones")


//===============================


let postArray = [post1,post2]




//GENERATE TEST DATA

func generateTestData() {
	user1.profilePicture = UIImage(named: "david")
	user2.profilePicture = UIImage(named: "matt")
}