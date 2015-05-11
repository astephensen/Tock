//
//  AppDelegate.swift
//  Tock
//
//  Created by Alan Stephensen on 11/05/2015.
//  Copyright (c) 2015 Alan Stephensen. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var menubarController: MenubarController?
    var mainViewController: MainViewController?
    @IBOutlet var menu: NSMenu?

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        menubarController = MenubarController()
        
        // Create the main view controller.
        mainViewController = NSStoryboard(name: "Main", bundle: nil)?.instantiateControllerWithIdentifier("MainViewController")! as? MainViewController
        menubarController?.viewController = mainViewController
        
        // Assign the menu.
        menubarController?.menu = mainViewController?.rightClickMenu
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

