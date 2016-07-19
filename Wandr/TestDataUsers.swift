//
//  TestDataUsers.swift
//  Wandr
//
//  Created by David Park on 7/19/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import Foundation
import UIKit

let post1 = WandrPost(username: "DavidYolo420", profilePicture: UIImage(named:"david")!, content: "Insert video file here", bookmarks: 50, location: "Los Angeles, CA", comments: ["awesome", "wish i was there", "#GOALS"], caption: "Met Justin Beiber today!!!")

let post2 = WandrPost(username: "MattyTrump", profilePicture: UIImage(named:"matt")!, content: "Insert video file here", bookmarks: 80, location: "Las Vegas, NV", comments: ["I think i need to go to jelly school after this", "wow youre so lucky", "marry me!"], caption: "Jackpot 1million dollah holla")

let postArray = [post1,post2]