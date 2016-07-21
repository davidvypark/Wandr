//
//  CommentsViewController.swift
//  Wandr
//
//  Created by David Park on 7/21/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit

class CommentsViewController: UITableViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.reloadData()
	}
	
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let commentCell = tableView.dequeueReusableCellWithIdentifier("commentCell", forIndexPath: indexPath)
		
		commentCell.textLabel!.text = "This is a comment"
		
		return commentCell
	}

}
