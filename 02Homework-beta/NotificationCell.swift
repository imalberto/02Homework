//
//  NotificationCell.swift
//  02Homework-beta
//
//  Created by albertoc on 7/12/14.
//  Copyright (c) 2014 AC. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

  @IBOutlet var photoImageView: UIImageView
  @IBOutlet var contentContainerView: UIView
  @IBOutlet var feedTextLabel: UILabel
  @IBOutlet var feedTypeImageView: UIImageView
  @IBOutlet var feedTimestampLabel: UILabel

  var placeholderImage = UIImage(named: "cell_placeholder")

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    self.contentContainerView.backgroundColor = UIColor.clearColor()

    // TODO based on the content height, adjust the Y

    feedTextLabel.numberOfLines = 3
    feedTextLabel.font = UIFont.systemFontOfSize(18)
    feedTextLabel.lineBreakMode = NSLineBreakMode.ByTruncatingTail

    feedTimestampLabel.font = UIFont.boldSystemFontOfSize(12)
    feedTimestampLabel.textColor = UIColor.lightGrayColor()

    photoImageView.image = placeholderImage

  }

  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

  func configure(feed: Feed) {
    self.feedTextLabel.attributedText = self.attributedStringWithHTML(feed.text)
    // self.feedTimestampLabel.text = feed.getTimestamp()
    // self.feedTimestampLabel.text = "6 hours ago"
    self.feedTimestampLabel.text = feed.when


    self.feedTypeImageView.image = UIImage(named: feed.type)
    self.photoImageView.image = nil // set image here

    let url = NSURL(string: feed.imageUrl)
    // timeout after 60secs
    let req = NSURLRequest(URL: url, cachePolicy: NSURLRequestCachePolicy.ReturnCacheDataElseLoad, timeoutInterval: 60)



    photoImageView.image = UIImage(named: feed.image)

//    photoImageView.setImageWithURL(url)
//    photoImageView.image = UIImage(named: "cell_stock")

//    let reqOp = AFHTTPRequestOperation(request: req)
//    reqOp.responseSerializer = AFImageResponseSerializer()
//    reqOp.setCompletionBlockWithSuccess({ (_, responseObject) in
//
//        dispatch_sync(dispatch_get_main_queue(), {
//            self.photoImageView.image = responseObject as UIImage
//        })
//
//    }, failure: { (_, error) in
//    })
//
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
//        reqOp.start()
//    })
//    NSOperationQueue.mainQueue().addOperation(reqOp)
//    reqOp.start()
  }

  // private
  func attributedStringWithHTML(html: String) -> NSAttributedString {
    let options = [
      NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType
    ]
    var s = NSAttributedString(data: html.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false), options: options, documentAttributes: nil, error: nil)

    return s
  }

}
