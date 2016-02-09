//
//  ViewController.swift
//  HorizontalCalendarExample
//
//  Created by Raphael Seher on 03/01/16.
//  Copyright © 2016 Raphael Seher. All rights reserved.
//

import UIKit
import HorizontalCalendarView

class ViewController: UIViewController, HorizontalCalendarDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let calendarView = HorizontalCalendarView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 80.0))
    calendarView.translatesAutoresizingMaskIntoConstraints = false
    calendarView.delegate = self
    view.addSubview(calendarView)
    
    let topConstraint = NSLayoutConstraint(item: calendarView, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 20)
    view.addConstraint(topConstraint)
    
    let heightConstraing = NSLayoutConstraint(item: calendarView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 80)
    view.addConstraint(heightConstraing)
    
    let leadingConstraint = NSLayoutConstraint(item: calendarView, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0)
    view.addConstraint(leadingConstraint)
    
    let trailingConstraint = NSLayoutConstraint(item: calendarView, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0)
    view.addConstraint(trailingConstraint)
    
    
    //calendar with custom cell
    let customCalendarView = HorizontalCalendarView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100.0), cellWidth: 80, cellClass: MyCustomCalendarCell.self)
    customCalendarView.translatesAutoresizingMaskIntoConstraints = false
    customCalendarView.delegate = self
    customCalendarView.mininumLineSpacing = 1.0
    view.addSubview(customCalendarView)
    
    let customTopConstraint = NSLayoutConstraint(item: customCalendarView, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 150)
    view.addConstraint(customTopConstraint)
    
    let customHeightConstraing = NSLayoutConstraint(item: customCalendarView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100)
    view.addConstraint(customHeightConstraing)
    
    let customLeadingConstraint = NSLayoutConstraint(item: customCalendarView, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0)
    view.addConstraint(customLeadingConstraint)
    
    let customTrailingConstraint = NSLayoutConstraint(item: customCalendarView, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0)
    view.addConstraint(customTrailingConstraint)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func horizontalCalendarViewDidUpdate(calendar: HorizontalCalendarView, date: NSDate) {
    let formatter: NSDateFormatter = NSDateFormatter()
    formatter.dateFormat = "dd.MM.YYYY"
    print("Updated calendarView \(formatter.stringFromDate(date))")
  }
  
}

