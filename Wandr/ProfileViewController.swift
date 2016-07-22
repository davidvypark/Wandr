//
//  ProfileViewController.swift
//  Wandr
//
//  Created by Matt Amerige on 7/19/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
   
    private let cellIdentifier = "Cell"
    private let headerIdentifier = "header"
    
    var collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
    
    init() {
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orangeColor()
        tabBarItem.title = "Profile"
        navigationItem.title = "Matt Amerige"
        
        setupCollectionView()
    }
    
    func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        let blockDimension = (view.frame.width - 2) / 3
        layout.itemSize = CGSize(width: blockDimension, height: blockDimension)
        layout.headerReferenceSize = CGSizeMake(0, CGRectGetHeight(view.frame) / 4)
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.registerClass(ProfileHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
        view.addSubview(collectionView)
        
        // Position it the same size/width of the screen, flush against all edges
        collectionView.snp_makeConstraints { (make) in
            make.top.equalTo(view.snp_top)
            make.left.equalTo(view.snp_left)
            make.width.equalTo(view.snp_width)
            make.height.equalTo(view.snp_height)
        }
    }
    
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    // MARK: - UICollectionViewDataSource Methods
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath)
        cell.backgroundColor = UIColor.redColor()
        return cell
    }
    
    func collectionView(collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                                                          atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: headerIdentifier,
                                                                                   forIndexPath: indexPath) as! ProfileHeaderView
            headerView.delegate = self
            
            headerView.username = "Matt Amerige"
            if let profileImage = UIImage(named: "matt") {
                headerView.profilePicture = profileImage
            }
            
            return headerView
        default: assert(false, "Unexpected element type")
        }
        
    }
}

extension ProfileViewController: ProfileHeaderViewDelegate {
    
    func profilePictureButtonPressed() {
        print("ProfilePictureButton Pressed")
    }
    
    func postsButtonPressed() {
        print("posts button")
    }
    
    func followingButtonPressed() {
        print("following button")
    }
    
    func followersButtonPressed() {
        print("followers button")
    }
    
    func editProfileButtonPressed() {
        print("Edit button")
    }
    
}































