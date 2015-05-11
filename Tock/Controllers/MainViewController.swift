//
//  MainViewController.swift
//  Tock
//
//  Created by Alan Stephensen on 11/05/2015.
//  Copyright (c) 2015 Alan Stephensen. All rights reserved.
//

import Cocoa
import WebKit

let TICK_MAIN_URL = "https://chrome-extension.tickspot.com/extension"

class MainViewController: NSViewController {
    @IBOutlet var rightClickMenu: NSMenu?
    @IBOutlet var webView: WebView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the tick URL.
        let request = NSURLRequest(URL: NSURL(string: TICK_MAIN_URL)!)
        webView?.mainFrame.loadRequest(request)
    }
    
    @IBAction func refreshClicked(sender: AnyObject?) {
        webView?.reload(nil)
    }
    
    @IBAction func quitSelected(sender: AnyObject?) {
        if let app = NSApp as? NSApplication {
            app.terminate(nil)
        }
    }

}
