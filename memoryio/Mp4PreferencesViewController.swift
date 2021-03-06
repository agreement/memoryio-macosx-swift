//
//  Mp4PreferencesViewController.swift
//  memoryio
//
//  Created by Jacob Rosenthal on 12/1/17.
//  Copyright © 2017 Augmentous. All rights reserved.
//

import Foundation

class Mp4PreferencesViewController: NSViewController {
    var toolbarItemLabel: String? = "mp4"
    var toolbarItemImage: NSImage? = NSImage(named: NSImage.Name.preferencesGeneral)!

    var viewIdentifier: String = "Mp4Preferences"

    var lengthText: NSTextField!
    
    func makeView() -> NSView {
        let view = NSView(frame: NSMakeRect(0, 0, 388, 231))

        let dec = NumberFormatter()
        dec.numberStyle = .decimal
        dec.maximumFractionDigits = 1
        dec.minimumFractionDigits = 1

        let lengthTextLabel = NSTextField(frame: NSMakeRect(130, 108, 150, 17))
        lengthTextLabel.stringValue = "mp4 length in (s)"
        lengthTextLabel.isBezeled = false
        lengthTextLabel.drawsBackground = false
        lengthTextLabel.isEditable = false
        lengthTextLabel.isSelectable = false
        view.addSubview(lengthTextLabel)

        lengthText = NSTextField(frame: NSMakeRect(310, 108, 54, 22))
        lengthText.action = #selector(lengthDidChange)
        lengthText.target = self
        lengthText.formatter = dec
        lengthText.stringValue = UserDefaults.standard.string(forKey: "memoryio-mp4-length")!
        view.addSubview(lengthText)

        return view
    }

    override func loadView() {
        self.view = self.makeView()
    }

    @IBAction func lengthDidChange(sender: NSTextField) {
        UserDefaults.standard.set(sender.intValue, forKey: "memoryio-mp4-length")
    }
}
