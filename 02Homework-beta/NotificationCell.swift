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


  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    self.contentContainerView.backgroundColor = UIColor.clearColor()

    // TODO based on the content height, adjust the Y

    feedTextLabel.numberOfLines = 2
    feedTextLabel.font = UIFont.systemFontOfSize(18)
    feedTextLabel.lineBreakMode = NSLineBreakMode.ByTruncatingTail

    feedTimestampLabel.font = UIFont.boldSystemFontOfSize(12)
    feedTimestampLabel.textColor = UIColor.lightGrayColor()

  }

  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

  func configure(feed: Feed) {
    self.feedTextLabel.attributedText = self.attributedStringWithHTML(feed.text)
    // self.feedTimestampLabel.text = feed.getTimestamp()
    self.feedTimestampLabel.text = "6 hours ago"


    self.feedTypeImageView = nil
    self.photoImageView.image = nil // set image here

    let url = NSURL(string: feed.imageUrl)
    let req = NSURLRequest(URL: url)
    var placeholder = UIImage(named: "placeholder")

    let op: AFImageRequestOperation!
  }

  // private
  func attributedStringWithHTML(html: String) -> NSAttributedString {
//    let options = {
//      NSDocumentTypeDocumentAttribute: NSAttributedString.NSHTMLTextDocumentType
//    }
    let options = [
      NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType
    ]
    var s = NSAttributedString(data: html.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false), options: options, documentAttributes: nil, error: nil)

    return s
  }

}
