//
//  CalendarViewController.swift
//  Stations
//
//  Created by OldMan on 18/06/16.
//  Copyright © 2016 OldMan. All rights reserved.
//

import UIKit
import CVCalendar

class CalendarViewController: UIViewController, AppearanceDelegate, CVCalendarMenuViewDelegate, CVCalendarViewDelegate {

    @IBOutlet weak var menuView: CVCalendarMenuView!
    @IBOutlet weak var calendarView: CVCalendarView!
    @IBOutlet weak var monthLabel: UILabel!
    
    var delegate: CalendarViewDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monthLabel.text = CVDate(date: NSDate()).globalDescription

        self.calendarView.calendarAppearanceDelegate = self
        self.menuView.menuViewDelegate = self
        self.calendarView.calendarDelegate = self
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        menuView.commitMenuViewUpdate()
        calendarView.commitCalendarViewUpdate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Calendar View Delegate

    func presentationMode() -> CalendarMode {
        return .MonthView
    }
    
    func firstWeekday() -> Weekday {
        return .Monday
    }
    
    func shouldAutoSelectDayOnMonthChange() -> Bool {
        return false
    }
    
    func presentedDateUpdated(date: Date) {
        //A method that calls when changing month
        monthLabel.text = date.globalDescription
    }
    
    func didSelectDayView(dayView: DayView, animationDidFinish: Bool) {
        if let date = dayView.date {
            delegate.chooseDate(date)
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    
    
    // MARK: - Navigation

    @IBAction func cancel() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol CalendarViewDelegate {
    func chooseDate(date: CVDate)
}
