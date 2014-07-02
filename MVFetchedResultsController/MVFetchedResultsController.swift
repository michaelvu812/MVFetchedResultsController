//
//  MVFetchedResultsController.swift
//  MVFetchedResultsController
//
//  Created by Michael on 1/7/14.
//  Copyright (c) 2014 Michael Vu. All rights reserved.
//

import UIKit
import CoreData

class MVFetchedResultsController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    var context: NSManagedObjectContext = AppDelegate().managedObjectContext
    var fetchSize: Int = 5
    var sortDescriptor: NSSortDescriptor = NSSortDescriptor()
    var entityName: String = String() {
        didSet {
            initFetchedResultsController()
        }
    }
    var tableView: UITableView = UITableView()
    var tableFrame: CGRect = CGRectZero {
        didSet {
            tableView.frame = tableFrame
        }
    }
    var tableBackgroundColor: UIColor = UIColor.clearColor() {
        didSet {
            tableView.backgroundColor = tableBackgroundColor
        }
    }
    var separatorColor: UIColor = UIColor.colorWithHexString("#bbbbbb") {
        didSet {
            tableView.separatorColor = separatorColor
        }
    }
    var fetchedResultsController: NSFetchedResultsController = NSFetchedResultsController() {
        didSet {
            if (fetchedResultsController != oldValue) {
                fetchedResultsController.delegate = self;
                
                if (fetchedResultsController.isKindOfClass(NSFetchedResultsController)) {
                    self.performFetchResults()
                } else {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.backgroundColor = tableBackgroundColor
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.showsHorizontalScrollIndicator = false
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.separatorColor = self.separatorColor
        self.tableView.separatorStyle = .SingleLine
        self.tableView.separatorInset = UIEdgeInsetsZero
        self.view.addSubview(self.tableView)
        self.tableView.reloadData()
    }
    
    override func loadView() {
        super.loadView()
        if CGRectEqualToRect(self.tableView.frame, CGRectZero) {
            if CGRectEqualToRect(self.tableFrame, CGRectZero) {
                self.tableView.frame = self.view.frame
            } else {
                self.tableView.frame = self.tableFrame
            }
        }
    }
    
    func initFetchedResultsController() {
        var fetchRequest: NSFetchRequest = NSFetchRequest(entityName: entityName)
        fetchRequest.fetchBatchSize = fetchSize
        if sortDescriptor != nil {
            fetchRequest.sortDescriptors = [sortDescriptor]
        }
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    func performFetchResults() {
        if (self.fetchedResultsController.isKindOfClass(NSFetchedResultsController)) {
            var error: NSError?
            self.fetchedResultsController.performFetch(&error)
        }
        self.tableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        if fetchedResultsController.sections != nil {
            return fetchedResultsController.sections.count
        }
        return 1
    }
    
    func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        var rows = 0
        if (fetchedResultsController.sections != nil && fetchedResultsController.sections.count > 0) {
            rows = fetchedResultsController.sections[section].numberOfObjects
        }
        return rows
    }
    
    func tableView(tableView:UITableView!, cellForRowAtIndexPath indexPath:NSIndexPath!) -> UITableViewCell! {
        return nil
    }
    
    func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        return true
    }
    
    func controllerWillChangeContent(controller: NSFetchedResultsController!) {
        self.tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController!, didChangeSection sectionInfo: NSFetchedResultsSectionInfo!, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        switch type {
            case NSFetchedResultsChangeInsert:
                self.tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: UITableViewRowAnimation.Fade)
                break
            case NSFetchedResultsChangeDelete:
                self.tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: UITableViewRowAnimation.Fade)
                break
            default:
                break
        }
    }
    
    func controller(controller: NSFetchedResultsController!, didChangeObject anObject: AnyObject!, atIndexPath indexPath: NSIndexPath!, forChangeType type: NSFetchedResultsChangeType, newIndexPath : NSIndexPath!) {
        switch type {
            case NSFetchedResultsChangeInsert:
                self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
                break
            case NSFetchedResultsChangeDelete:
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
                break
            case NSFetchedResultsChangeUpdate:
                self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
                break
            case NSFetchedResultsChangeMove:
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
                self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
                break
            default:
                break
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController!) {
        self.tableView.endUpdates()
    }
}
