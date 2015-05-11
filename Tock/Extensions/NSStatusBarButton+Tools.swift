//
//  NSStatusBarButton+Tools.swift
//  Tock
//
//  Created by Alan Stephensen on 11/05/2015.
//  Copyright (c) 2015 Alan Stephensen. All rights reserved.
//

import Cocoa

extension NSStatusBarButton {
    
    public override func rightMouseDown(theEvent: NSEvent) {
        if let menubarController = target as? MenubarController {
            menubarController.rightMouseClicked()
        }
    }
}