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
    layer.borderColor = UIColor.gray.cgColor
    layer.borderWidth = 1.0
  }
  
  override func configureCalendarCell(_ cell: UICollectionViewCell, date: Date, active: Bool) -> UICollectionViewCell {
    reddotImageView.isHidden = true;
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd"
    dayLabel.text = dateFormatter.string(from: date)
    dateFormatter.dateFormat = "MMM"
    monthLabel.text = dateFormatter.string(from: date)
    
    if active {
      reddotImageView.isHidden = false;
    }
    
    return cell;
  }
}
