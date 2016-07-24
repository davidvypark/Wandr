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
        
        // Using this to create some user instances..
        // the profileViewController has a non-optional user property, which must be provided as an argument when initializing
        // Assuming that user1 is the current user for the app, I'm going to pass that data here just for now.
        // Later on we should add something here to get the current user info before initializing this view controller
        generateTestData()
        
        let profileViewController = ProfileViewController(withUser: user1)
        let profileNavController = UINavigationController(rootViewController: profileViewController)
        profileNavController.navigationBar.translucent = false
        profileNavController.navigationBar.opaque = true
        
        rootTabViewController.viewControllers = [feedNavController, cameraViewController, profileNavController]
        
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

