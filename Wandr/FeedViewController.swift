//
//  FeedViewController.swift
//  Wandr
//
//  Created by Matt Amerige on 7/19/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FeedPostViewDelegate {
	
	var tableView: UITableView = UITableView()
	
	override func viewWillAppear(animated: Bool) {
		generateTestData()
	}

	
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blueColor()
        title = "Feed"

		tableView = UITableView(frame: UIScreen.mainScreen().bounds)
		tableView.estimatedRowHeight = 640
		tableView.rowHeight = UITableViewAutomaticDimension
		
		tableView.delegate = self
		tableView.dataSource = self
		
		let nib = UINib(nibName: "FeedPostView", bundle: nil)
		tableView.registerNib(nib, forCellReuseIdentifier: FeedPostView.cellReuseIdentifier)
		self.view.addSubview(self.tableView)

    }
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 2
		
		//return postArray.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cell = self.tableView.dequeueReusableCellWithIdentifier(FeedPostView.cellReuseIdentifier, forIndexPath: indexPath) as! FeedPostView
		cell.delegate = self
		
		let currentPost = postArray[indexPath.row]
		cell.feedPostItem = currentPost
		
		return cell
	}
	
	//Feed Post Button Actions
	
	func showComments() {
		let destinationVC = CommentsViewController()
		navigationController?.pushViewController(destinationVC, animated: true)
	}
	
	func goToUserProfile() {
		let destinationVC = ProfileViewController()
		navigationController?.pushViewController(destinationVC, animated: true)
	}
	
}
