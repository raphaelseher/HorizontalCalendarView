//
//  MyCustomCalendarCell.swift
//  HorizontalCalendarExample
//
//  Created by Raphael Seher on 25/01/16.
//  Copyright © 2016 Raphael Seher. All rights reserved.
//

import UIKit
import HorizontalCalendarView

class MyCustomCalendarCell: UICollectionViewCell {
  var label : UILabel?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    label = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 20))
    label!.backgroundColor = UIColor.blackColor()
    addSubview(label!)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func configureCalendarCell(cell: UICollectionViewCell, date: NSDate, active: Bool) -> UICollectionViewCell {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "d.MM"
    cell.backgroundColor = UIColor.blueColor()
    label!.text = dateFormatter.stringFromDate(date)
    label!.textColor = UIColor.whiteColor()
    return cell;
  }
}