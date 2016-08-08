Pod::Spec.new do |s|

  s.name         = "HorizontalCalendarView"
  s.version      = "0.0.2"
  s.summary      = "A horizontal scrolling calendar."
  s.description  = <<-DESC
  Custom UIView with an UICollectionView as calendar.

  Use your custom UICollectionView cell if you like.
  To do that call the right initializer and override configureCalendarCell()
  method.
                   DESC

  s.homepage     = "https://github.com/raphaelseher/HorizontalCalendarView"
  s.screenshots  = "https://raw.githubusercontent.com/raphaelseher/HorizontalCalendarView/master/calendar.gif"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Raphael Seher" => "raphael.seher@gmail.com" }
  s.social_media_url   = "http://twitter.com/raphaelseher"

  s.platform     = :ios
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/raphaelseher/HorizontalCalendarView.git", :tag => "v0.0.2" }
  s.source_files  = "HorizontalCalendar", "HorizontalCalendar/**/*.{h,m,swift}"
  s.resources = "HorizontalCalendar/*.xib", "HorizontalCalendar/*.xcassets"

  s.requires_arc = true

end
