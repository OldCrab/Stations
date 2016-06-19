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
    
    //sorted cities
    var cities = [City]() { willSet(newValue) {
            self.cities = newValue.sort({
                if $0.countryTitle == $1.countryTitle {
                    return $0.cityTitle < $1.cityTitle
                } else {
                    return $0.countryTitle < $1.countryTitle
                }
            })
        }
        
        didSet {
            for city in cities {
                stations += city.stations
            }
        }
    }
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
        if searchController.active && searchController.searchBar.text != "" {
            return 1
        }
        return cities.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("StationCell") as! StationTableViewCell
        cell.infoButton.tag = indexPath.row

        if searchController.active && searchController.searchBar.text != "" {
            cell.name.text = filteredStations[indexPath.row].stationTitle
        } else {
            cell.name.text = stations[indexPath.row].stationTitle
        }
        return cell

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredStations.count
        }
        return cities[section].stations.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if searchController.active && searchController.searchBar.text != "" {
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
    
    @IBAction func getInfo(sender: UIButton) {
        performSegueWithIdentifier("GetInfo", sender: stations[sender.tag])
    }
    
    @IBAction func search(sender: AnyObject) {
        self.presentViewController(searchController, animated: true, completion: nil)
    }

    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(searchText: String) {
        let searchLowerCase = searchText.lowercaseString
        filteredStations = stations.filter { station in
            var result = false
            if station.stationTitle!.lowercaseString.containsString(searchLowerCase) || station.countryTitle!.lowercaseString.containsString(searchLowerCase) || station.cityTitle!.lowercaseString.containsString(searchLowerCase)  {
                result = true
            }
                return result
        }
        tableView.reloadData()
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
