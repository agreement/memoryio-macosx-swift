//
//  PhotoPreferencesViewController.swift
//  memoryio
//
//  Created by Jacob Rosenthal on 12/1/17.
//  Copyright © 2017 Augmentous. All rights reserved.
//

import Foundation

class PhotoPreferencesViewController: NSViewController {
    var toolbarItemLabel: String? = "Photo"
    var toolbarItemImage: NSImage? = NSImage(named: NSImage.Name.preferencesGeneral)!

    var viewIdentifier: String = "PhotoPreferences"

    var warmupDelayText: NSTextField!

    func makeView() -> NSView {
        let view = NSView(frame: NSMakeRect(0, 0, 388, 231))

        let dec = NumberFormatter()
        dec.numberStyle = .decimal
        dec.maximumFractionDigits = 1
        dec.minimumFractionDigits = 1

        let warmupDelayTextLabel = NSTextField(frame: NSMakeRect(130, 108, 150, 17))
        warmupDelayTextLabel.stringValue = "Warmup delay in (s)"
        warmupDelayTextLabel.isBezeled = false
        warmupDelayTextLabel.drawsBackground = false
        warmupDelayTextLabel.isEditable = false
        warmupDelayTextLabel.isSelectable = false
        view.addSubview(warmupDelayTextLabel)

        warmupDelayText = NSTextField(frame: NSMakeRect(310, 108, 54, 22))
        warmupDelayText.action = #selector(warmupDidChange)
        warmupDelayText.target = self
        warmupDelayText.becomeFirstResponder()
        warmupDelayText.formatter = dec
        warmupDelayText.stringValue = UserDefaults.standard.string(forKey: "memoryio-warmup-delay")!
        view.addSubview(warmupDelayText)

        return view
    }
    
    override func loadView() {
        self.view = self.makeView()
    }
    
    @IBAction func warmupDidChange(sender: NSTextField) {
        UserDefaults.standard.set(sender.floatValue, forKey: "memoryio-warmup-delay")
    }
}
