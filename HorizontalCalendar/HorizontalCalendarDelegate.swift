//
//  HorizontalCalendarDelegate.swift
//  HorizontalCalendarView
//
//  Created by Raphael Seher on 25/01/16.
//  Copyright © 2016 Raphael Seher. All rights reserved.
//

import UIKit

public protocol HorizontalCalendarDelegate {
  func horizontalCalendarViewDidUpdate(_ calendar: HorizontalCalendarView, date: Date)
}

public protocol CalendarViewRepresentation {
  func configureCalendarCell(_ cell: UICollectionViewCell, date: Date, active: Bool) -> UICollectionViewCell
}

extension UICollectionViewCell : CalendarViewRepresentation {
  open func configureCalendarCell(_ cell: UICollectionViewCell, date: Date, active: Bool) -> UICollectionViewCell {
    return cell
  }
}
