//
//  JourneyTableViewController.swift
//  Stations
//
//  Created by OldMan on 17/06/16.
//  Copyright © 2016 OldMan. All rights reserved.
//

import UIKit

class JourneyTableViewController: UITableViewController {
    
    let numberOfCells: CGFloat = 3
    let viewCornerRadius: CGFloat = 5
    
    @IBOutlet weak var departureCell: UITableViewCell!
    @IBOutlet weak var destinationCell: UITableViewCell!
    @IBOutlet weak var dateCell: UITableViewCell!
    
    override func viewDidLoad() {
        departureCell.textLabel?.text = "Sex"
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.layer.cornerRadius = viewCornerRadius
        fixTableViewInsets()
    }
    
    private func fixTableViewInsets() {
        // Function for right rendering of content
        let contentInsets = UIEdgeInsetsZero
        tableView.contentInset = contentInsets
        tableView.scrollIndicatorInsets = contentInsets
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

    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        dispatch_async(dispatch_get_main_queue(), {
                print(indexPath)
            });
//        NSOperationQueue.mainQueue().addOperationWithBlock {
//            dispatch_async(dispatch_get_main_queue(), {
//            })
//        }
        return indexPath

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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
