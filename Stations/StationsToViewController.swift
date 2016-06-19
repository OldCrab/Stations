//
//  StationsToViewController.swift
//  Stations
//
//  Created by OldMan on 18/06/16.
//  Copyright © 2016 OldMan. All rights reserved.
//

import UIKit

class StationsToViewController: StationsViewController {

    var delegate: StationsToDelegate!
    
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
            delegate.chooseStationTo(filteredStations[indexPath.row])
        } else {
            delegate.chooseStationTo(stations[indexPath.row])
        }
        
        super.tableView(tableView, didSelectRowAtIndexPath: indexPath)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol StationsToDelegate {
    func chooseStationTo(station: Station)
}
