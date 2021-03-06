//
//  StationsViewController.swift
//  Stations
//
//  Created by OldMan on 18/06/16.
//  Copyright © 2016 OldMan. All rights reserved.
//

import UIKit

class StationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var searchController: UISearchController! = {
        let resultController = UITableViewController(style: .Plain)
        let controller = UISearchController(searchResultsController: nil)
        controller.hidesNavigationBarDuringPresentation = false
        controller.searchResultsUpdater = self
        controller.dimsBackgroundDuringPresentation = false

        return controller
    }()
    
    var isSearching: Bool {
        get {
            return searchController.active && searchController.searchBar.text != ""
        }
    }
    
    //sorted cities
    var cities = [City]() {
        willSet(newValue) {
            self.cities = sortCities(newValue)
        }
        
        didSet {
            fillStations(cities)
        }
    }
    
    var visibleSectionsCount = 25
    var atLeastForLoading = 50
    var thresholdSection = 5
    var addedAmount = 20
    var stations = [Station]()
    var filteredStations = [Station]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated);
        
        if let sc = self.searchController where sc.active {
            self.searchController?.dismissViewControllerAnimated(false, completion: nil);
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if isSearching {
            return 1
        }
        print(NSDate().timeIntervalSince1970)
        print(visibleSectionsCount)
        if cities.count > atLeastForLoading {
            return visibleSectionsCount
        }
        
        return cities.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("StationCell") as! StationTableViewCell
        cell.infoButton.cityNumber = indexPath.section
        cell.infoButton.stationNumber = indexPath.row
        
        if isSearching {
            cell.name.text = filteredStations[indexPath.row].stationTitle
        } else {
            cell.name.text = cities[indexPath.section].stations[indexPath.row].stationTitle
            
            if visibleSectionsCount - thresholdSection < indexPath.section {
                visibleSectionsCount += addedAmount
                self.reloadTVInMain(tableView)
            }
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredStations.count
        }
        return cities[section].stations.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if isSearching {
            return nil
        }
        
        var result = ""
        if let country = cities[section].countryTitle {
            result.appendContentsOf(country)
        }
        
        if let city = cities[section].cityTitle {
            if !result.isEmpty || !city.isEmpty {
                result += ", "
            }
            result.appendContentsOf(city)
        }
        
        return result
    }
    
    @IBAction func getInfo(sender: StationButton) {
        performSegueWithIdentifier("GetInfo", sender: isSearching ? filteredStations[sender.stationNumber] : cities[sender.cityNumber].stations[sender.stationNumber])
    }
    
    @IBAction func search(sender: AnyObject) {
        self.presentViewController(searchController, animated: true, completion: nil)
    }
    
    func sortCities(cities: [City]) -> [City]{
        return cities.sort {
            if $0.countryTitle == $1.countryTitle {
                return $0.cityTitle < $1.cityTitle
            } else {
                return $0.countryTitle < $1.countryTitle
            }
        }
    }
    
    func reloadTVInMain(tableView: UITableView) {
        NSOperationQueue.mainQueue().addOperationWithBlock{
            tableView.reloadData()
        }
    }
    
    func fillStations(cities: [City]) {
        for city in cities {
            stations += city.stations
        }
    }

    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterStationsForSearchText(searchController.searchBar.text!, stations: stations)
        tableView.reloadData()
    }
    
    func filterStationsForSearchText(searchText: String, stations: [Station]) {
        let searchLowerCase = searchText.lowercaseString
        filteredStations = stations.filter { station in
            var result = false
            if station.stationTitle!.lowercaseString.containsString(searchLowerCase) || station.countryTitle!.lowercaseString.containsString(searchLowerCase) || station.cityTitle!.lowercaseString.containsString(searchLowerCase)  {
                result = true
            }
                return result
        }
    }
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? InfoViewController {
            destination.station = sender as! Station
        }
    }
    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
