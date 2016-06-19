//
//  StationsFromViewController.swift
//  Stations
//
//  Created by OldMan on 18/06/16.
//  Copyright © 2016 OldMan. All rights reserved.
//

import UIKit

class StationsFromViewController: StationsViewController {

    var delegate: StationsFromDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if searchController.active && searchController.searchBar.text != "" {
            delegate.chooseStationFrom(filteredStations[indexPath.row])
        } else {
            delegate.chooseStationFrom(stations[indexPath.row])
        }
        super.tableView(tableView, didSelectRowAtIndexPath: indexPath)
    }
}

protocol StationsFromDelegate {
    func chooseStationFrom(station: Station)
}
