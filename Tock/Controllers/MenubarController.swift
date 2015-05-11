//
//  MenubarController.swift
//  Tock
//
//  Created by Alan Stephensen on 11/05/2015.
//  Copyright (c) 2015 Alan Stephensen. All rights reserved.
//

import Cocoa

class MenubarController: NSObject, NSPopoverDelegate {
    var statusItem: NSStatusItem
    var statusItemButton: NSStatusBarButton
    var viewController: NSViewController?
    var popover: NSPopover?
    var menu: NSMenu?
    
    let statusItemViewWidth = 22.0
    
    override init() {
        // Create the status item and assign local variables.
        statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(CGFloat(statusItemViewWidth))
        statusItemButton = statusItem.button!
        
        super.init()
        
        // Setup status item button.
        statusItemButton.image = NSImage(named: "menubar_icon")
        statusItemButton.alternateImage = NSImage(named: "menubar_icon_selected")
        statusItemButton.target = self
        statusItemButton.action = "statusButtonClicked:"
    }
    
    func statusButtonClicked(sender: AnyObject) {
        if popover?.shown == true {
            popover?.performClose(sender)
        } else {
            showViewController()
        }
    }
    
    func showViewController() {
        
        // Create the popover and show it from the status item button.
        popover = NSPopover()
        popover?.delegate = self
        // popover?.behavior = .Transient
        popover?.contentViewController = viewController
        popover?.appearance = NSAppearance(named: NSAppearanceNameAqua)
        popover?.showRelativeToRect(statusItemButton.frame, ofView: statusItemButton.superview!, preferredEdge: NSMaxYEdge)
        popover?.contentSize = NSSize(width: 590.0, height: 430.0)
        
        // We need to make the application active so the popover is in control.
        NSApplication.sharedApplication().activateIgnoringOtherApps(true)
    }
    
    func rightMouseClicked() {
        statusItem.popUpStatusItemMenu(menu!)
    }
    
    // MARK: NSPopoverDelegate
    
    func popoverDidClose(notification: NSNotification) {
        popover = nil
    }
    
}
