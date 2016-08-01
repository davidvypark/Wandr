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

let user1 = WandrUser(withDisplayName: "User1", fullName: "woof", profilePicture: nil, uid: "1234", followerCount: 0, followingCount: 0, postCount: 0)

let user2 = WandrUser(withDisplayName: "User2", fullName: "meow", profilePicture: nil, uid: "5432", followerCount: 0, followingCount: 0, postCount: 0)








//TEST POSTS

let post1 = WandrPost(user: user1, content: UIImage(named:"stockpic1")! , bookmarks: 50, location: "Los Angeles, CA", comments: ["awesome!! Take a pic!!! Bring me back a souvenier", "wish i was there", "#GOALS"], caption: "Me and the squad taking a little trip to destroy a ring real quick. Should be back by the weekend. Hit me up if you want to grab some tacos")

let post2 = WandrPost(user: user2, content: UIImage(named:"stockpic2")!, bookmarks: 80, location: "Las Vegas, NV", comments: ["I think i need to go to jelly school after this", "wow youre so lucky", "marry me!"], caption: "Had a great time hiking today. This place is pretty cool but I have yet to see any yellow stones")

//let post3 = WandrPost(user: user3, content: <#T##UIImage#>, bookmarks: <#T##Int#>, location: <#T##String#>, comments: <#T##[String]#>, caption: <#T##String#>)
//
//let post4 = WandrPost(user: user4, content: <#T##UIImage#>, bookmarks: <#T##Int#>, location: <#T##String#>, comments: <#T##[String]#>, caption: <#T##String#>)
//
//let post5 = WandrPost(user: user5, content: <#T##UIImage#>, bookmarks: <#T##Int#>, location: <#T##String#>, comments: <#T##[String]#>, caption: <#T##String#>)
//
//let post6 = WandrPost(user: user1, content: <#T##UIImage#>, bookmarks: <#T##Int#>, location: <#T##String#>, comments: <#T##[String]#>, caption: <#T##String#>)
//
//let post7 = WandrPost(user: user2, content: <#T##UIImage#>, bookmarks: <#T##Int#>, location: <#T##String#>, comments: <#T##[String]#>, caption: <#T##String#>)
//
//let post8 = WandrPost(user: user3, content: <#T##UIImage#>, bookmarks: <#T##Int#>, location: <#T##String#>, comments: <#T##[String]#>, caption: <#T##String#>)
//
//let post9 = WandrPost(user: user4, content: <#T##UIImage#>, bookmarks: <#T##Int#>, location: <#T##String#>, comments: <#T##[String]#>, caption: <#T##String#>)
//
//let post10 = WandrPost(user: user5, content: <#T##UIImage#>, bookmarks: <#T##Int#>, location: <#T##String#>, comments: <#T##[String]#>, caption: <#T##String#>)


//===============================


let postArray = [post1,post2]




//GENERATE TEST DATA

func generateTestData() {
	user1.profilePicture = UIImage(named: "david")
	user2.profilePicture = UIImage(named: "matt")
}