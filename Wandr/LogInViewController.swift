//
//  LogInViewController.swift
//  
//
//  Created by David Park on 7/25/16.
//
//

import UIKit

class LogInViewController: UIViewController {
	
	let usernameInput = UITextField(frame: CGRectMake(20, 100, 300, 40))
	let passwordInput = UITextField(frame: CGRectMake(20, 100, 300, 40))
	let logInButton = UIButton()
	let signUpButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		//need constraints for usernameInput
		
		usernameInput.placeholder = "username"
		usernameInput.font = UIFont.systemFontOfSize(15)
		usernameInput.borderStyle = UITextBorderStyle.RoundedRect
		usernameInput.autocorrectionType = UITextAutocorrectionType.No
		usernameInput.keyboardType = UIKeyboardType.Default
		usernameInput.returnKeyType = UIReturnKeyType.Done
		view.addSubview(usernameInput)
		
		
		//need constraints for usernameInput
		passwordInput.placeholder = "password"
		//makes the text stars
		passwordInput.secureTextEntry = true
		passwordInput.borderStyle = UITextBorderStyle.RoundedRect
		passwordInput.autocorrectionType = UITextAutocorrectionType.No
		passwordInput.keyboardType = UIKeyboardType.Default
		passwordInput.returnKeyType = UIReturnKeyType.Done
		view.addSubview(passwordInput)
		
		//need constraints for loginButton
		logInButton.setTitle("Log In", forState: .Normal)
		logInButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
		logInButton.frame = CGRectMake(15, -50, 300, 500)
		logInButton.addTarget(self, action: #selector(logInButtonPressed), forControlEvents: .TouchUpInside)
		view.addSubview(logInButton)
		
		signUpButton.setTitle("Sign Up", forState: .Normal)
		signUpButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
		signUpButton.frame = CGRectMake(15, -50, 300, 500)
		signUpButton.addTarget(self, action: #selector(signUpButtonPressed), forControlEvents: .TouchUpInside)
		view.addSubview(signUpButton)

    }
	
	func logInButtonPressed() {
		
		if logInIsCorrect() {
			//segue to feed
		} else {
			incorrectLogInCredentials()
		}
	}
	
	func signUpButtonPressed() {
		
		//segue to sign up page
		
	}
	
	func logInIsCorrect() -> Bool {
		
		let username = usernameInput.text
		let password = passwordInput.text
		
		return (username == password)
	}
	
	func incorrectLogInCredentials() {
		
		//animate and display text warning
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
