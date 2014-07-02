//
//  ViewController.swift
//  MVFetchedResultsController
//
//  Created by Michael on 1/7/14.
//  Copyright (c) 2014 Michael Vu. All rights reserved.
//

import UIKit

class ViewController: MVFetchedResultsController {
    var canInsert = true
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        self.entityName = "Entity"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
        let entity = self.fetchedResultsController.objectAtIndexPath(indexPath) as Entity
        super.tableView(tableView, cellForRowAtIndexPath: indexPath)
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: nil)
        let text = entity.name
        cell.textLabel.text = text
        return cell
    }
}

