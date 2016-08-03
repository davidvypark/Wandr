//
//  FeedViewController.swift
//  Wandr
//
//  Created by David Park on 8/1/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FeedPostCellDelegate {
	
	let tableView: UITableView = UITableView()
	
	override func viewDidLoad() {
		tableView.delegate = self
		tableView.dataSource = self
		view.addSubview(tableView)
		tableView.frame = self.view.frame 
		
		tableView.registerClass(FeedPostCell.self, forCellReuseIdentifier: "FeedPostCell")
		tableView.reloadData()
		
	}
	
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return self.view.frame.width
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return videoArray.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCellWithIdentifier("FeedPostCell", forIndexPath: indexPath) as! FeedPostCell
		cell.configureVideoFile(videoArray[indexPath.row]) { 
			print("RETURN 2")
		}
		
		print("RETURN 1")
		print (cell.player)
		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		print(indexPath.row)
		
		let tappedCell = tableView.cellForRowAtIndexPath(indexPath) as! FeedPostCell
		tappedCell.playVideo()
	
	}
	
	func likeButtonPressed() {
		
		
	}
	
	
	
	

}
