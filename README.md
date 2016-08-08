# HorizontalCalendarView

Small horizontal calendar written in Swift.

![](https://github.com/raphaelseher/HorizontalCalendarView/blob/master/calendar.gif)

## Install via cocoapods

````ruby
pod 'HorizontalCalendarView'
```

## Usage

1.) Import module
```Swift
import HorizontalCalendarView
```

2.) Insert view via code or InterfaceDesigner

3.) Adopt delegate
```Swift
class ViewController: UIViewController, HorizontalCalendarDelegate
```

4.) Implement delegate method
```Swift
func horizontalCalendarViewDidUpdate(calendar: HorizontalCalendarView, date: NSDate) {
    let formatter: NSDateFormatter = NSDateFormatter()
    formatter.dateFormat = "dd.MM.YYYY"
    print("Updated calendarView \(formatter.stringFromDate(date))")
  }
```

## Use your own cell

Init HorizontalCalendarView with your class or nib.
```Swift
let customCalendarView = HorizontalCalendarView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100.0),
cellWidth: 80, cellClass: MyCustomCalendarCell.self)
```

And override `configureCalendarCell`
```Swift
override func configureCalendarCell(cell: UICollectionViewCell, date: NSDate, active: Bool) -> UICollectionViewCell {
    //update your cell
    return cell;
  }
```

## Feedback & Issues

Give me feedback if you like too!
If you have problems, write an issue.
