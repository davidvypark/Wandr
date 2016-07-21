//
//  FeedPostView.swift
//  Wandr
//
//  Created by David Park on 7/19/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import Foundation
import UIKit

protocol FeedPostViewDelegate: class {
	func showComments()
	func goToUserProfile()
}

var commentsToLoad = [String]()

class FeedPostView: UITableViewCell {
	
	weak var delegate: FeedPostViewDelegate?

	@IBOutlet weak var temporaryImageView: UIImageView!
	
	@IBOutlet weak var profilePictureButton: UIButton!
	@IBOutlet weak var usernameButton: UIButton!
	@IBOutlet weak var moreButton: UIButton!
	@IBOutlet weak var mediaContentWindow: UIView!
	@IBOutlet weak var likeButton: UIButton!
	@IBOutlet weak var commentIconButton: UIButton!
	@IBOutlet weak var shareIconButton: UIButton!
	@IBOutlet weak var likesLabel: UILabel!
	@IBOutlet weak var captionLabel: UILabel!
	@IBOutlet weak var viewAllCommentsButton: UIButton!
	@IBOutlet weak var commentsPreviewButton: UIButton!
	
	static let cellReuseIdentifier = "FeedCell"

	var feedPostItem: WandrPost! {
		
		didSet {
			profilePictureButton.setImage(feedPostItem.user.profilePicture!.circle, forState: .Normal)
			usernameButton.setTitle(feedPostItem.user.username, forState: .Normal)
			temporaryImageView.image = feedPostItem.content	
			likesLabel.text = "♥︎ Likes: " + String(feedPostItem.bookmarks)
			captionLabel.text = feedPostItem.caption
			commentsPreviewButton.setTitle(feedPostItem.comments[0], forState: .Normal)
			viewAllCommentsButton.setTitle("View all Comments", forState: .Normal)
		}
		
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
	}
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	private func commonInit() {
		self.addSubview(self.contentView)
		contentView.translatesAutoresizingMaskIntoConstraints = false
		contentView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
		contentView.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
		contentView.leftAnchor.constraintEqualToAnchor(self.leftAnchor).active = true
		contentView.rightAnchor.constraintEqualToAnchor(self.rightAnchor).active = true
	}
	
	//PostButtonActions

	@IBAction func profilePictureButtonPressed(sender: AnyObject) {
		goToUserProfile()
	}
	
	@IBAction func headerUsernameButtonPressed(sender: AnyObject) {
		goToUserProfile()
	}
	
	@IBAction func moreOptionsButtonPressed(sender: AnyObject) {
		//go to more options
	}
	
	@IBAction func likeButtonPressed(sender: AnyObject) {
		//like the post
	}
	
	@IBAction func shareButtonPressed(sender: AnyObject) {
		//present social media share options
	}
	
	@IBAction func commentsIconButtonPressed(sender: AnyObject) {
		goToCommentsVC()
		//present keyboard
	}
	
	@IBAction func moreCommentsButtonPressed(sender: AnyObject) {
		goToCommentsVC()
	}
	
	@IBAction func commentsPreviewButtonPressed(sender: AnyObject) {
		goToCommentsVC()
	}
	
	// HELPER FUNCTIONS
	
	func goToCommentsVC() {
		self.delegate?.showComments()
	}
	
	func goToUserProfile() {
		self.delegate?.goToUserProfile()
	}
	
	
	
	
	
	
	
	
}