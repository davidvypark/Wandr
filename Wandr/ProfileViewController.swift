//
//  ProfileViewController.swift
//  Wandr
//
//  Created by Matt Amerige on 7/19/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit
import SnapKit
import MobileCoreServices

class ProfileViewController: UIViewController {
   
    let user: WandrUser
    
    private let cellIdentifier = "Cell"
    private let headerIdentifier = "header"
    
    var collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
    
    // Designated Initializer
    init(withUser user: WandrUser) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor.orangeColor()
        tabBarItem.title = "Profile"
        navigationItem.title = user.username
        
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
            
            headerView.username = user.username
            if let profileImage = user.profilePicture {
                headerView.profilePicture = profileImage
            }
            
            return headerView
        default: assert(false, "Unexpected element type")
        }
        
    }
}

// MARK: - ProfileHeaderView Delegate Methods
extension ProfileViewController: ProfileHeaderViewDelegate {
    
    func profilePictureButtonPressed() {
        print("ProfilePictureButton Pressed")
        
        // Show menu of different options from an action sheet
        let actionController = UIAlertController(title: "Change Profile Photo", message: nil, preferredStyle: .ActionSheet)
        
        let takePhotoAction = UIAlertAction(title: "Take Photo", style: .Default, handler: { action in
            self.presentCamera()
        })
        
        let chooseFromLibraryAction = UIAlertAction(title: "Choose from Library", style: .Default, handler: { action in
            self.presentPhotoLibrary()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        actionController.addAction(takePhotoAction)
        actionController.addAction(chooseFromLibraryAction)
        actionController.addAction(cancelAction)
        
        
        presentViewController(actionController, animated: true, completion: nil)
        
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

// MARK: - Camera Stuff (Presenting the Camera and photo library)
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func presentCamera() {
        // present camera (for taking photos only)
        let cameraImagePickerController = UIImagePickerController()
        if !UIImagePickerController.isSourceTypeAvailable(.Camera) { return }
        cameraImagePickerController.sourceType = .Camera
        cameraImagePickerController.cameraDevice = .Front
        cameraImagePickerController.mediaTypes = [String(kUTTypeImage)]
        cameraImagePickerController.delegate = self
        
        presentViewController(cameraImagePickerController, animated: true, completion: nil)
    }
    
    func presentPhotoLibrary() {
        let cameraImagePickerController = UIImagePickerController()
        if !UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) { return }
        cameraImagePickerController.sourceType = .PhotoLibrary
        cameraImagePickerController.delegate = self
        presentViewController(cameraImagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        user.profilePicture = image
        collectionView.reloadData()
        dismissViewControllerAnimated(true, completion: nil)
    }
}































