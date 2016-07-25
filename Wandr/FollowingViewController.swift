//
//  FollowingViewController.swift
//  Wandr
//
//  Created by Matt Amerige on 7/25/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit

class FollowingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.whiteColor()
        setupTempLayout()
    }

    func setupTempLayout() {
        
        
        let cancelButton = UIButton(type: .System)
        cancelButton.setTitle("Cancel", forState: .Normal)
        cancelButton.addTarget(self, action: #selector(dismissVC), forControlEvents: .TouchUpInside)
        view.addSubview(cancelButton)
        
        
        
        let centerLabel = UILabel()
        centerLabel.text = "THESE ARE YOUR FOLLOWERS"
        
        view.addSubview(centerLabel)
        
        centerLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(view.snp_centerX)
            make.centerY.equalTo(view.snp_centerY)
        }
        
        cancelButton.snp_makeConstraints { (make) in
            make.top.equalTo(centerLabel.snp_bottom).offset(8)
            make.centerX.equalTo(centerLabel.snp_centerX)
        }
        
    }
    
    func dismissVC(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
