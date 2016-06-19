//
//  JourneyTableViewController.swift
//  Stations
//
//  Created by OldMan on 17/06/16.
//  Copyright © 2016 OldMan. All rights reserved.
//

import UIKit
import CVCalendar

class JourneyTableViewController: UITableViewController, CalendarViewDelegate, StationsFromDelegate, StationsToDelegate {
    
    let numberOfCells: CGFloat = 3
    let viewCornerRadius: CGFloat = 5
    
    @IBOutlet weak var departureCell: UITableViewCell!
    @IBOutlet weak var destinationCell: UITableViewCell!
    @IBOutlet weak var dateCell: UITableViewCell!
    
    var startDate: CVDate? = nil
    var departure: Station?
    var destination: Station?
    var allStations = [String : [City]]()
    
    
    override func viewDidLoad() {
        parseTestData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.layer.cornerRadius = viewCornerRadius
        fixTableViewInsets()
    }
    
    override func viewWillAppear(animated: Bool) {
        dateCell.textLabel?.text = startDate != nil ? startDate!.commonDescription : "Дата путешествия"
        departureCell.textLabel?.text = departure != nil ? departure?.getDescription() : "Откуда"
        destinationCell.textLabel?.text = destination != nil ? destination!.getDescription() : "Куда"
    }
    
    private func fixTableViewInsets() {
        // Function for right rendering of content
        let contentInsets = UIEdgeInsetsZero
        tableView.contentInset = contentInsets
        tableView.scrollIndicatorInsets = contentInsets
    }
    
    private func parseTestData() {
        let parser = JSONParser()

        if let path = NSBundle.mainBundle().pathForResource("allStations", ofType: "json") {
            if let jsonData = try? NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe) {
                allStations = parser.parseAllCities(jsonData)
            }
//            if let jsonData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil) {
//                parser.parseAllCities(jsonData)
//            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        print(indexPath.row)
    }
    // MARK: - Table view delegate
  
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.tableView.frame.height / numberOfCells
    }
    
    // MARK: - Calendar view delegate
    
    func chooseDate(date: CVDate) {
        startDate = date
    }
    
    // MARK: - StationsTo VC delegate
    func chooseStationTo(station: Station) {
        self.destination = station
    }
    
    // MARK: - StationsFrom VC delegate
    func chooseStationFrom(station: Station) {
        self.departure = station
    }

    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "FromJourneyToCalendar" {
            let destination = segue.destinationViewController as! CalendarViewController
            destination.delegate = self
        } else if segue.identifier == "FromCities" {
            let destination = segue.destinationViewController as! StationsFromViewController
            if allStations["citiesFrom"] != nil {
                destination.cities = allStations["citiesFrom"]!
                destination.delegate = self
            }
        } else if segue.identifier == "ToCities" {
            let destination = segue.destinationViewController as! StationsToViewController
            if allStations["citiesTo"] != nil {
                destination.cities = allStations["citiesTo"]!
                destination.delegate = self
            }
        }
    }
    
    @IBAction func unwindToJourneyVC(unwindSegue: UIStoryboardSegue) {
        
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
