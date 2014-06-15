//
//  LoginFormViewController.swift
//  02Homework-beta
//
//  Created by albertoc on 6/14/14.
//  Copyright (c) 2014 AC. All rights reserved.
//

import UIKit

class LoginFormViewController: UIViewController {

  var animateViewsUp = false
  var viewsConfiguration: Dictionary<String, CGRect> = [:]

  @IBOutlet var signUpButton : UIButton = nil
  @IBOutlet var helpCenterButton : UIButton = nil
  @IBOutlet var loginButton : UIButton = nil
  @IBOutlet var logoImageView : UIImageView = nil

  @IBOutlet var formContainerView : UIView = nil
  @IBOutlet var formImageView : UIImageView = nil
  @IBOutlet var usernameTextField : UITextField = nil
  @IBOutlet var passwordTextField : UITextField = nil



  @IBAction func onHelpCenterButton(sender : AnyObject) {
    NSLog("onHelpCenter")
  }

  @IBAction func onSignUpButton(sender : AnyObject) {
    NSLog("onSignUp")
  }

  @IBAction func onLoginButton(sender : AnyObject) {
    NSLog("onLogin")
  }

  @IBAction func onEditingChangedUsername(sender : AnyObject) {
    NSLog("onEditingChanged Username")

    self.loginButton.enabled = (self.usernameTextField.text as NSString).length > 0;
    
    // reconfigure the view

  }
  @IBAction func onEditingChangedPassword(sender : AnyObject) {
    NSLog("onEditingChanged Password")
    
    // reconfigure the view

  }



  @IBAction func onTap(sender : UITapGestureRecognizer) {
    NSLog("onTap")
    self.view.endEditing(true)
  }

  // https://developer.apple.com/library/prerelease/ios/samplecode/UICatalog-Swift/Listings/UICatalog_TextViewController_swift.html
  func willShowKeyboard(notification: NSNotification) {
    NSLog("willShowKeyboard")
    self.animateViewsUp = true

    let userInfo:NSDictionary = notification.userInfo;
    
    let beginFrame = (userInfo[UIKeyboardFrameBeginUserInfoKey] as NSValue).CGRectValue()
    let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue()

    let durationValue = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSValue) as NSNumber

    let animationDuration:NSTimeInterval = durationValue.doubleValue
    
    var animationOptions: UIViewAnimationOptions = UIViewAnimationOptions.CurveEaseOut
    let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSValue
    curveValue.getValue(&animationOptions)
    
    UIView.animateWithDuration(animationDuration, delay: 0.0, options: animationOptions, animations: {
      self.reconfigureView(beginFrame, endKbFrame: endFrame);
    }, completion: nil)
  }
  
  func willHideKeyboard(notification: NSNotification) {
    NSLog("willHideKeyboard")
    self.animateViewsUp = false

    let userInfo = notification.userInfo;

    // origin=(x=0, y=352) size=(width=320, height=216)
    // origin=(x=0, y=568) size=(width=320, height=216)
    let beginFrame = (userInfo[UIKeyboardFrameBeginUserInfoKey] as NSValue).CGRectValue();
    let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue();
    //
    let durationValue = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSValue) as NSNumber
    
    let animationDuration:NSTimeInterval = durationValue.doubleValue
    var animationOptions: UIViewAnimationOptions = UIViewAnimationOptions.CurveEaseOut
    let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSValue
    curveValue.getValue(&animationOptions)
    
    UIView.animateWithDuration(animationDuration, delay: 0.0, options: animationOptions, animations: {
      self.reconfigureView(beginFrame, endKbFrame:endFrame);
      }, completion: nil)
    
    
  }


  init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    // Custom initialization
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "willShowKeyboard:", name: UIKeyboardWillShowNotification, object: nil)
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "willHideKeyboard:", name: UIKeyboardWillHideNotification, object: nil)

  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    self.configureView();
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func reconfigureView(beginKbFrame: CGRect, endKbFrame: CGRect) {
    var restore = !self.animateViewsUp;

    if restore {
      NSLog("Restore views")
      self.logoImageView.frame = self.viewsConfiguration["logoImageView"]!
      self.formContainerView.frame = self.viewsConfiguration["formContainerView"]!
      self.formImageView.frame = self.viewsConfiguration["formImageView"]!
      self.usernameTextField.frame = self.viewsConfiguration["usernameTextField"]!
      self.passwordTextField.frame = self.viewsConfiguration["passwordTextField"]!
      self.loginButton.frame = self.viewsConfiguration["loginButton"]!
      self.helpCenterButton.frame = self.viewsConfiguration["helpCenterButton"]!
    } else {
      NSLog("Animate views up")
      let y = endKbFrame.origin.y
      
      var frame: CGRect?
      frame = self.logoImageView.frame;
      self.logoImageView.frame = CGRectMake(frame!.origin.x, 50.0, frame!.size.width, frame!.size.height)
      frame = self.formContainerView.frame;
      self.formContainerView.frame = CGRectMake(frame!.origin.x,
        50.0 + self.logoImageView.frame.size.height + 50.0,
        frame!.size.width, frame!.size.height)

      frame = self.loginButton.frame;
      self.loginButton.frame = CGRectMake(frame!.origin.x,
        50.0 + self.logoImageView.frame.size.height + 50.0 + self.formContainerView.frame.height + 8.0,
        frame!.size.width, frame!.size.height)

      frame = self.helpCenterButton.frame
      self.helpCenterButton.frame = CGRectMake(frame!.origin.x,
        50.0 + self.logoImageView.frame.size.height + 50.0 + self.formContainerView.frame.height + 8.0 + self.loginButton.frame.height + 20.0,
        frame!.size.width, frame!.size.height)
      
    }

    // save the current position
    
    // figure out the size of the keyboard
    
    // shift everything up according
    
  }

  func configureView() {
    self.view.backgroundColor = UIColor(red: 59.0/255.0, green: 89.0/255.0, blue: 152.0/255.0, alpha: 1.0)
    self.loginButton.enabled = false

    self.viewsConfiguration = [
      "logoImageView": self.logoImageView.frame,
      "formContainerView": self.formContainerView.frame,
      "usernameTextField": self.usernameTextField.frame,
      "passwordTextField": self.passwordTextField.frame,
      "formImageView": self.formImageView.frame,
      "loginButton": self.loginButton.frame,
      "helpCenterButton": self.helpCenterButton.frame
    ]
  }

  /*
  // #pragma mark - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
      // Get the new view controller using [segue destinationViewController].
      // Pass the selected object to the new view controller.
  }
  */

}
