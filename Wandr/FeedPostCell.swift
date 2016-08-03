//
//  FeedPostCell.swift
//  Wandr
//
//  Created by David Park on 8/1/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation
import SnapKit

protocol FeedPostCellDelegate: class {
	func likeButtonPressed()
	
}

let videoArray = ["testVid", "testVid2", "testVid3"]

class FeedPostCell: UITableViewCell {
	
	var player: AVPlayer?
	weak var delegate: FeedPostCellDelegate?
	let videoView: UIView = UIView()
	var likeButton = UIButton(type: UIButtonType.Custom) as UIButton
	var videoName: String?
	var playerLayer = AVPlayerLayer()
	
	static let cellReuseIdentifier = "FeedPostCell"
	
	override func layoutSubviews() {
		print("laying out subview")
		
		contentView.addSubview(videoView)
		videoView.frame = contentView.frame
		videoView.backgroundColor = UIColor.randomCustomColor()
		
		likeButton.setImage(UIImage(named: "likeButton"), forState: .Normal)
		likeButton.addTarget(self, action: #selector(likeButtonPressed), forControlEvents: .TouchUpInside)
		contentView.addSubview(likeButton)
		
		likeButton.snp_makeConstraints { (make) in
			
			make.width.equalTo(self.snp_height).dividedBy(15)
			make.height.equalTo(self.snp_height).dividedBy(15)
			make.left.equalTo(self.snp_left).offset(10)
			make.bottom.equalTo(self.snp_bottom).offset(-10)
		}
	}
	
	func configureVideoFile(vidName: String, completion: () -> ()) {
		
		videoView.backgroundColor = UIColor.alizarinColor()
		
		let moviePath = NSBundle.mainBundle().pathForResource(vidName, ofType: "MOV")
		print(moviePath)
		if let path = moviePath {
			let url = NSURL.fileURLWithPath(path)
			let item = AVPlayerItem(URL: url)
			self.player = AVPlayer(playerItem: item)
			playerLayer = AVPlayerLayer(player: player)
			playerLayer.frame = self.videoView.bounds
			self.videoView.layer.addSublayer(playerLayer)
			self.addSubview(videoView)
			
			completion()
			
		}
	}
	
	func playVideo() {
		self.player!.play()
		
	}
	
	func likeButtonPressed() {
		
	}
	
	
	
	
}