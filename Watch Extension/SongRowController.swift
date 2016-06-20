//
//  SongRowController.swift
//  RadioFgPlaylist
//
//  Created by Olivier on 19/06/16.
//  Copyright © 2016 Olivier. All rights reserved.
//

import WatchKit

class SongRowController: NSObject
{
    @IBOutlet var separator: WKInterfaceSeparator!
    @IBOutlet var statusLabel: WKInterfaceLabel!
    @IBOutlet var titelLabel: WKInterfaceLabel!
    @IBOutlet var artiestLabel: WKInterfaceLabel!
    
    var song : Song? {
        didSet
        {
            if let song = song
            {
                statusLabel.setText(song.status)
                statusLabel.setTextColor(song.getStatusColor())
                separator.setColor(song.getStatusColor())
                titelLabel.setText(song.titel)
                artiestLabel.setText(song.artiest)
            }
        }
    }
    
}
