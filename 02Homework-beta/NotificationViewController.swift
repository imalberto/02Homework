//
//  NotificationViewController.swift
//  02Homework-beta
//
//  Created by albertoc on 6/15/14.
//  Copyright (c) 2014 AC. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {



  @IBOutlet var tableView: UITableView


  init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    // Custom initialization
    self.tabBarItem.title = "Notifications"
    self.tabBarItem.image = UIImage(named: "notifications_tab_img")
    
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  /*
  // #pragma mark - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
  }
  */

  func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
    return nil;
  }

}
