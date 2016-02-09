//
//  HorizontalCalendarDelegate.swift
//  HorizontalCalendarView
//
//  Created by Raphael Seher on 25/01/16.
//  Copyright © 2016 Raphael Seher. All rights reserved.
//

import UIKit

public protocol HorizontalCalendarDelegate {
  func horizontalCalendarViewDidUpdate(calendar: HorizontalCalendarView, date: NSDate)
}

public protocol CalendarViewRepresentation {
  func configureCalendarCell(cell: UICollectionViewCell, date: NSDate, active: Bool) -> UICollectionViewCell
}

extension UICollectionViewCell : CalendarViewRepresentation {
  public func configureCalendarCell(cell: UICollectionViewCell, date: NSDate, active: Bool) -> UICollectionViewCell {
    return cell
  }
}