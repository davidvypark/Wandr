//
//  CameraViewController.swift
//  Wandr
//
//  Created by Matt Amerige on 7/19/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit
import MobileCoreServices

class CameraViewController: UIViewController {
    
    let cameraIndex = 1 // The index in the tabBar where the camera will live
    let cameraImagePickerController = UIImagePickerController()
    
    func presentCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) == false { return }
        cameraImagePickerController.sourceType = .Camera
        // Only showing the option to take videos
        cameraImagePickerController.mediaTypes = [String(kUTTypeMovie)]
        cameraImagePickerController.delegate = self
        self.presentViewController(cameraImagePickerController, animated: true, completion: nil)
    }

}

//MARK: UIImagePickerController Delegate
extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("Finished picking media")
    }
}

//MARK: UITabBarControllerDelegate
extension CameraViewController: UITabBarControllerDelegate {
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        // Prevent the tab bar controller from actually selecting the camera tab, instead we just present the image picker
        if tabBarController.viewControllers?.indexOf(viewController) == cameraIndex {
            presentCamera()
            return false
        }
        return true
    }
}



