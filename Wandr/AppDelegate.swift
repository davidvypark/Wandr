//
//  AppDelegate.swift
//  Wandr
//
//  Created by David Park on 7/19/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // Root is a TabBarController
        let rootTabViewController = UITabBarController()
        
        // To Add more ViewControllers, instantiate them here (with navigation controller if necessary)
        // Then add them to the viewControllers array on the rootTabViewController
        let feedViewController = FeedViewController()
        let feedNavController = UINavigationController(rootViewController: feedViewController)
        
        let cameraViewController = CameraViewController()
        rootTabViewController.delegate = cameraViewController
        
        let profileViewController = ProfileViewController()
        
        rootTabViewController.viewControllers = [feedNavController, cameraViewController, profileViewController]
        
        // Set the titles for the tabs here
        rootTabViewController.tabBar.items?[0].title = "Feed"
        rootTabViewController.tabBar.items?[1].title = "Camera"
        rootTabViewController.tabBar.items?[2].title = "Profile"
    
        if let window = window {
            window.rootViewController = rootTabViewController
            window.makeKeyAndVisible()
        }
		return true
	}
}

