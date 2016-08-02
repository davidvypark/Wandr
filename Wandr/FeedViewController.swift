//
//  FeedViewController.swift
//  Wandr
//
//  Created by David Park on 8/1/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	let tableView: UITableView = UITableView()
	var cell: FeedPostCell = FeedPostCell()
	
	override func viewDidLoad() {
		tableView.delegate = self
		tableView.dataSource = self
		view.addSubview(tableView)
		tableView.frame = self.view.frame 
		
		tableView.registerClass(FeedPostCell.self, forCellReuseIdentifier: "FeedPostCell")
		
	}
	
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return self.view.frame.width
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		cell = tableView.dequeueReusableCellWithIdentifier("FeedPostCell", forIndexPath: indexPath) as! FeedPostCell
		cell.configureVideoFile(videoArray[indexPath.row])
		cell.reloadInputViews()

		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		print(indexPath.row)
		cell.playVideo()
		//is not playing the video that I want. The cell should know which video it's holding
	}
	

}
