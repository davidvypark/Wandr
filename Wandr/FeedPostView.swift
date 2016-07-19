//
//  FeedPostView.swift
//  Wandr
//
//  Created by David Park on 7/19/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import Foundation
import UIKit

class FeedPostView: UIView {
	
	//properties
	@IBOutlet var contentView: UIView!
	
	var feedPostItem: WandrPost! {
		didSet {
		
		
		
		}
		
		
		
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	private func commonInit() {
		NSBundle.mainBundle().loadNibNamed("ItemView", owner: self, options: nil)
		self.addSubview(self.contentView)
		contentView.translatesAutoresizingMaskIntoConstraints = false
		contentView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
		contentView.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
		contentView.leftAnchor.constraintEqualToAnchor(self.leftAnchor).active = true
		contentView.rightAnchor.constraintEqualToAnchor(self.rightAnchor).active = true
	}

	
	
	
	
	
	
}