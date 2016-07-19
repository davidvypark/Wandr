//
//  FeedViewController.swift
//  Wandr
//
//  Created by Matt Amerige on 7/19/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
	
	var tableView: UITableView = UITableView()

	
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blueColor()
        title = "Feed"

		tableView = UITableView(frame: UIScreen.mainScreen().bounds, style: UITableViewStyle.Plain)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
		self.view.addSubview(self.tableView)
    }
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return postArray.count
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
		cell.textLabel?.adjustsFontSizeToFitWidth = true
		
		for post in postArray {
			//if (indexPath.section == postArray.indexOf(post)) {
			if (indexPath.row) == 0 {
				if let cellTextLabel = cell.textLabel {
					cellTextLabel.text = post.username
					cellTextLabel.font = UIFont.boldSystemFontOfSize(16)
				}
			} else if (indexPath.row == 1) {
				if let cellTextLabel = cell.textLabel {
					cellTextLabel.text = post.content
				}
			} else if (indexPath.row == 2) {
				if let cellTextLabel = cell.textLabel {
					cellTextLabel.text = "💟 " + String(post.bookmarks) + " Bookmarks"
				}
			} else if (indexPath.row == 3) {
				if let cellTextLabel = cell.textLabel {
					let attributedString = NSAttributedString(string: post.caption)
					let attrs = [NSFontAttributeName : UIFont.boldSystemFontOfSize(12)]
					let boldString = NSMutableAttributedString(string: post.username, attributes:attrs)
					boldString.appendAttributedString(attributedString)
					cellTextLabel.attributedText = boldString
				}
			} else if (indexPath.row == 4) {
				if let cellTextLabel = cell.textLabel {
					cellTextLabel.text = post.comments[0] + " ~View More"
				}
			}
			//}
			
			
//			if let cellTextLabel = cell.textLabel {
//				cellTextLabel.text = "this is a cell"
//			}
		}
		
		return cell
	}
	
	
	
}
