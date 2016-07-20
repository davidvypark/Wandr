//
//  FeedViewController.swift
//  Wandr
//
//  Created by Matt Amerige on 7/19/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	var tableView: UITableView = UITableView()

	
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blueColor()
        title = "Feed"

		//tableView = UITableView(frame: UIScreen.mainScreen().bounds, style: UITableViewStyle.Plain)
		tableView = UITableView(frame: UIScreen.mainScreen().bounds)
		//need to set hight and width of xib to the screen size
		tableView.estimatedRowHeight = 640
		tableView.rowHeight = UITableViewAutomaticDimension
		
		tableView.delegate = self
		tableView.dataSource = self
		
		let nib = UINib(nibName: "FeedPostView", bundle: nil)
		tableView.registerNib(nib, forCellReuseIdentifier: FeedPostView.cellReuseIdentifier)
		//tableView.registerClass(FeedPostView.self, forCellReuseIdentifier: FeedPostView.cellReuseIdentifier)
		self.view.addSubview(self.tableView)

    }
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return postArray.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		//let cell:FeedPostView = tableView.dequeueReusableCellWithIdentifier(FeedPostView.cellReuseIdentifier, forIndexPath: indexPath) as! FeedPostView
		
		let cell = self.tableView.dequeueReusableCellWithIdentifier(FeedPostView.cellReuseIdentifier, forIndexPath: indexPath) as! FeedPostView
		
		return cell
	}
	
	
	
}
