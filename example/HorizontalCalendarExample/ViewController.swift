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
  
  @IBOutlet weak var interfaceDesignerCalendarView: HorizontalCalendarView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    addCalendarViewWithConstraints()
    addCustomCalendarViewWithConstraint()
    
    interfaceDesignerCalendarView.delegate = self
    interfaceDesignerCalendarView.moveToDate(Date(), animated: true)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func horizontalCalendarViewDidUpdate(_ calendar: HorizontalCalendarView, date: Date) {
    let formatter: DateFormatter = DateFormatter()
    formatter.dateFormat = "dd.MM.YYYY"
    print("Updated calendarView \(formatter.string(from: date))")
  }
  
  func addCalendarViewWithConstraints() {
    let calendarView = HorizontalCalendarView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 80.0))
    calendarView.translatesAutoresizingMaskIntoConstraints = false
    calendarView.delegate = self
    view.addSubview(calendarView)
    
    let topConstraint = NSLayoutConstraint(item: calendarView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 20)
    view.addConstraint(topConstraint)
    
    let heightConstraing = NSLayoutConstraint(item: calendarView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80)
    view.addConstraint(heightConstraing)
    
    let leadingConstraint = NSLayoutConstraint(item: calendarView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0)
    view.addConstraint(leadingConstraint)
    
    let trailingConstraint = NSLayoutConstraint(item: calendarView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0)
    view.addConstraint(trailingConstraint)
    
    calendarView.moveToDate(Date(), animated: true)
  }
  
  func addCustomCalendarViewWithConstraint() {
    let customCalendarView = HorizontalCalendarView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100.0), cellWidth: 80, cellClass: MyCustomCalendarCell.self)
    customCalendarView.translatesAutoresizingMaskIntoConstraints = false
    customCalendarView.delegate = self
    customCalendarView.mininumLineSpacing = 1.0
    view.addSubview(customCalendarView)
    
    let customTopConstraint = NSLayoutConstraint(item: customCalendarView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 150)
    view.addConstraint(customTopConstraint)
    
    let customHeightConstraing = NSLayoutConstraint(item: customCalendarView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
    view.addConstraint(customHeightConstraing)
    
    let customLeadingConstraint = NSLayoutConstraint(item: customCalendarView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0)
    view.addConstraint(customLeadingConstraint)
    
    let customTrailingConstraint = NSLayoutConstraint(item: customCalendarView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0)
    view.addConstraint(customTrailingConstraint)
    
    customCalendarView.moveToDate(Date(), animated: true)
  }
}

