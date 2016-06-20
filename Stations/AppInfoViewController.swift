//
//  AppInfoViewController.swift
//  Stations
//
//  Created by OldMan on 20/06/16.
//  Copyright © 2016 OldMan. All rights reserved.
//

import UIKit

class AppInfoViewController: UIViewController {

    @IBOutlet weak var versionInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateVersionInfo(versionInfo)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateVersionInfo(label: UILabel) {
        guard let version = NSBundle.mainBundle().infoDictionary?["CFBundleShortVersionString"] else {
            return
        }
        label.text = "Stations version \(version)"
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