//
//  CalendarCollectionViewCell.swift
//  HorizontalCalendar
//
//  Created by Raphael Seher on 29/12/15.
//  Copyright © 2015 Raphael Seher. All rights reserved.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var reddotImageView: UIImageView!
  @IBOutlet weak var dayLabel: UILabel!
  @IBOutlet weak var monthLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    layer.borderColor = UIColor.grayColor().CGColor
    layer.borderWidth = 1.0
  }
  
  override func configureCalendarCell(cell: UICollectionViewCell, date: NSDate, active: Bool) -> UICollectionViewCell {
    reddotImageView.hidden = true;
    
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "dd"
    dayLabel.text = dateFormatter.stringFromDate(date)
    dateFormatter.dateFormat = "MMM"
    monthLabel.text = dateFormatter.stringFromDate(date)
    
    if active {
      reddotImageView.hidden = false;
    }
    
    return cell;
  }
}