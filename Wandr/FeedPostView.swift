//
//  FeedPostView.swift
//  Wandr
//
//  Created by David Park on 7/19/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import Foundation
import UIKit

class FeedPostView: UITableViewCell {
	
	//properties

//	@IBOutlet weak var profilePictureButton: UIButton!
//	@IBOutlet weak var usernameHeaderButton: UIButton!
//	//@IBOutlet weak var additionalOptionsButton: UIButton!
//	@IBOutlet weak var mediaContentWindow: UIView!
//	@IBOutlet weak var bookmarksLabel: UILabel!
//	@IBOutlet weak var captionLabel: UILabel!
//	@IBOutlet weak var commentsButton: UIButton!
//	@IBOutlet weak var moreCommentsButton: UIButton!
	
	static let cellReuseIdentifier = "FeedCell"
	
	var feedPostItem: WandrPost! {
		
		didSet {
//			profilePictureButton.setImage(feedPostItem.profilePicture, forState: .Normal)
//			usernameHeaderButton.setTitle(feedPostItem.username, forState: .Normal)
//			bookmarksLabel.text = "Bookmarks " + String(feedPostItem.bookmarks)
//			captionLabel.text = feedPostItem.caption
//			commentsButton.setTitle(feedPostItem.comments[0], forState: .Normal)
//			moreCommentsButton.setTitle("more...", forState: .Normal)
		}
		
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		print("hitting actual nib")
	}
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	private func commonInit() {
		print("calling nib for feedpost")
		self.addSubview(self.contentView)
		contentView.translatesAutoresizingMaskIntoConstraints = false
		contentView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
		contentView.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
		contentView.leftAnchor.constraintEqualToAnchor(self.leftAnchor).active = true
		contentView.rightAnchor.constraintEqualToAnchor(self.rightAnchor).active = true
	}

	
	
	
	
	
	
}