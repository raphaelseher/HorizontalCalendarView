//
//  HorizontalCalendarView.swift
//  HorizontalCalendar
//
//  Created by Raphael Seher on 27/12/15.
//  Copyright © 2015 Raphael Seher. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


open class HorizontalCalendarView: UIView {
  let cellReuseIdentifier = "CalendarCellReuseIdentifier"
  let horizontalCalendar = HorizontalCalendar()
  
  open var delegate : HorizontalCalendarDelegate?
  open var collectionView : UICollectionView?
  open var mininumLineSpacing : CGFloat = 0.0
  open var minimumInterItemSpacing : CGFloat = 0.0
  
  var dates : [Date] = []
  var displayedYears : [Int] = []
  var startingYear : Int?
  var cellWidth : CGFloat = 80
  var activeIndexPath : IndexPath?
  
  var collectionViewTopConstraint : NSLayoutConstraint?
  var collectionViewBottomConstraint : NSLayoutConstraint?
  var collectionViewLeadingConstraint : NSLayoutConstraint?
  var collectionViewTrailingConstraint : NSLayoutConstraint?
  
  /**
   Create a instance of HorizontalCalendarView with rect.
   
   - Parameter frame: CGRect for frame.
   */
  public override init(frame: CGRect) {
    super.init(frame: frame)
    collectionView = UICollectionView(frame: CGRect(origin: CGPoint.zero, size: frame.size), collectionViewLayout: CalendarFlowLayout(cellWidth: CGFloat(cellWidth)))
    collectionView!.register(UINib(nibName: "CalendarCollectionViewCell", bundle: Bundle(for: HorizontalCalendarView.self)), forCellWithReuseIdentifier: cellReuseIdentifier)
    setupCollectionView()
    setupYears()
  }
  
  /**
   Create a instance of HorizontalCalendarView with rect, 
   the cellWidth and a custom nib.
   
   - Parameter frame: CGRect for frame.
   - Parameter cellWidth: Width of your custom cell.
   - Parameter cellNib: Nib of your custom cell.
   */
  public init(frame: CGRect, cellWidth: Float, cellNib: UINib) {
    super.init(frame: frame)
    self.cellWidth = CGFloat(cellWidth)
    collectionView = UICollectionView(frame: CGRect(origin: CGPoint.zero, size: frame.size), collectionViewLayout: CalendarFlowLayout(cellWidth: self.cellWidth))
    collectionView!.register(cellNib, forCellWithReuseIdentifier: cellReuseIdentifier)
    setupCollectionView()
    setupYears()
  }
  
  /**
   Create a instance of HorizontalCalendarView with rect,
   the cellWidth and a custom class.
   
   - Parameter frame: CGRect for frame.
   - Parameter cellWidth: Width of your custom cell.
   - Parameter cellClass: Class of your custom cell.
   */
  public init(frame: CGRect, cellWidth: Float, cellClass: AnyClass) {
    super.init(frame: frame)
    self.cellWidth = CGFloat(cellWidth)
    collectionView = UICollectionView(frame: CGRect(origin: CGPoint.zero, size: frame.size), collectionViewLayout: CalendarFlowLayout(cellWidth: self.cellWidth))
    collectionView!.register(cellClass, forCellWithReuseIdentifier: cellReuseIdentifier)
    setupCollectionView()
    setupYears()
  }
  
  /**
   Create a instance of HorizontalCalendarView with coder.
   
   - Parameter aDecoder: A coder.
   */
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    collectionView = UICollectionView(coder: aDecoder)!
    collectionView!.collectionViewLayout = CalendarFlowLayout(cellWidth: CGFloat(cellWidth))
    collectionView!.register(UINib(nibName: "CalendarCollectionViewCell", bundle: Bundle(for: HorizontalCalendarView.self)), forCellWithReuseIdentifier: cellReuseIdentifier)
    setupCollectionView()
    setupYears()
  }
  
  func setupCollectionView() {
    if let collectionView = collectionView {
      collectionView.backgroundColor = UIColor.clear
      collectionView.delegate = self
      collectionView.dataSource = self
      collectionView.translatesAutoresizingMaskIntoConstraints = false
      collectionView.showsHorizontalScrollIndicator = false
      
      addSubview(collectionView)
      
      collectionViewTopConstraint = NSLayoutConstraint(item: collectionView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0)
      collectionViewBottomConstraint = NSLayoutConstraint(item: collectionView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0)
      collectionViewLeadingConstraint = NSLayoutConstraint(item: collectionView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0)
      collectionViewTrailingConstraint = NSLayoutConstraint(item: collectionView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0)
      addConstraints([collectionViewTopConstraint!, collectionViewBottomConstraint!, collectionViewLeadingConstraint!, collectionViewTrailingConstraint!])
    }
  }
  
  func setupYears() {
    startingYear = horizontalCalendar.currentYear()
    if let year = startingYear {
      dates = horizontalCalendar.datesForYear(year)
      displayedYears.append(year)
    }
  }
  
  func addDatesFromYear(_ year: Int) {
    if displayedYears.contains(year) {
      return
    }
    
    if let indexPath = activeIndexPath {
      let currentDate = dates[(indexPath as NSIndexPath).row]
      
      if year > startingYear {
        let datesOfNextYear = horizontalCalendar.datesForYear(year)
        dates.append(contentsOf: datesOfNextYear)
      } else if (year < startingYear) {
        let newDates = horizontalCalendar.datesForYear(year)
        dates.insert(contentsOf: newDates, at: 0)
      }
      
      displayedYears.append(year)
      collectionView?.reloadData()
      moveToDate(currentDate, animated: false)
    }
  }
  
  func updateActiveIndexPath(_ indexPath : IndexPath) {
    if activeIndexPath != indexPath {
      activeIndexPath = indexPath
      collectionView?.reloadData()
      
      delegate?.horizontalCalendarViewDidUpdate(self, date: dates[(indexPath as NSIndexPath).row])
    }
  }
  
  open func moveToDate(_ date : Date, animated : Bool) {
    let indexOfDate = dates.index(of: horizontalCalendar.truncateDateToYearMonthDay(date))
    let indexPath = IndexPath.init(item: indexOfDate!, section: 0)
    collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: animated)
  }
  
  open func checkForEndOfDates(_ scrollView: UIScrollView) {
    if scrollView.contentOffset.x < 60 * cellWidth {
      let minYearDisplayed = displayedYears.min();
      if let lastYear = minYearDisplayed {
        addDatesFromYear(lastYear - 1)
        return;
      }
    }
    
    let maxLinespacing = (self.mininumLineSpacing * CGFloat(dates.count - 1))
    let maxDateSize = cellWidth * CGFloat(dates.count) + maxLinespacing
    let maxScrollviewOffset = maxDateSize - collectionView!.bounds.size.width
    let offsetToLoadMore = maxScrollviewOffset - 60 * cellWidth
    
    if scrollView.contentOffset.x > offsetToLoadMore {
      let minYearDisplayed = displayedYears.max();
      if let lastYear = minYearDisplayed {
        addDatesFromYear(lastYear + 1)
      }
    }
  }
}

extension HorizontalCalendarView : UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
      return mininumLineSpacing;
  }
  
  func collectionView(_ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
      return minimumInterItemSpacing;
  }
}

extension HorizontalCalendarView : UICollectionViewDataSource {
  public func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dates.count
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath)
    cell.configureCalendarCell(cell, date: dates[(indexPath as NSIndexPath).row], active: (indexPath == activeIndexPath))
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
    return CGSize(width: cellWidth, height: collectionView.bounds.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
}

extension HorizontalCalendarView : UIScrollViewDelegate {
  public func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if let indexPath = collectionView?.indexPathForItem(at: CGPoint(x: collectionView!.center.x + scrollView.contentOffset.x, y: collectionView!.center.y)) {
      updateActiveIndexPath(indexPath)
    }
  }
  
  public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    checkForEndOfDates(scrollView)
  }
  
  public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    checkForEndOfDates(scrollView)
  }
}

