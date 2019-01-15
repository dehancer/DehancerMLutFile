//
//  AppDelegate.swift
//  MLutFile-Pod
//
//  Created by denn on 12/01/2019.
//  Copyright © 2019 Dehancer. All rights reserved.
//

import Cocoa
import DehancerMLutFile
import IMProcessingXMP

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    let luTypeList = MLutFilmType.availableList
    let cap = MLutColorType.color.caption

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let meta = ImageMeta(path:  "/tmp/mlutfile-pod-test", extension: "xmp", history: 1)
        
        do {
            
            var printed = try MLutPrinted(meta: meta)
            
            printed &= !printed 
            
            Swift.print("printed: \(printed.nsvalue.boolValue, !printed)")

            try meta.setField(printed)

            var num     = try MLutExpandImpactModel(meta: meta)
            num += 1.1
            Swift.print("num: \(num.nsvalue)")
            
            try meta.setField(num)
            
            var revision     = try MLutRevisionModel(meta: meta)
            
            revision += 1
            Swift.print("revision: \(revision.nsvalue)")
            
            revision &= 1
            Swift.print("revision: \(revision.nsvalue)")
            
            try meta.setField(revision)
            
        }
        catch let error {
            Swift.print("Error: \(error)")
        }
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }
}

