//
//  InfoViewController.swift
//  Stations
//
//  Created by OldMan on 19/06/16.
//  Copyright © 2016 OldMan. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    var station: Station!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateInfo(infoLabel, station: station)
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateInfo(label: UILabel, station: Station)  {
        var resultString = station.stationTitle != nil ? "Название станции: \(station.stationTitle!)\n\n" : ""
        resultString += station.getReadableLocation()
        print(station.regionTitle)
        label.text = resultString
    }
    // MARK: - Navigation

     @IBAction func cancel() {
        self.dismissViewControllerAnimated(true, completion: nil)
     }
    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
