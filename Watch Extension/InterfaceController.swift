//
//  InterfaceController.swift
//  Watch Extension
//
//  Created by Olivier on 19/06/16.
//  Copyright © 2016 Olivier. All rights reserved.
//

import WatchKit
import Foundation
import Alamofire
import SwiftyJSON


class InterfaceController: WKInterfaceController
{

    @IBOutlet var SongsTable: WKInterfaceTable!
    var jsonData: JSON?
    var songs: [Song] = [Song]()
    
    //
    //  De app is aan het openen
    //
    override func willActivate()
    {
        super.willActivate()
        
        getJsonData()
        print("opnieuw aan het laden!")
    }
    
    //
    //  De titels in json formaat ophalen
    //
    func getJsonData()
    {
        let url = "http://www.ovde.be/radiofg.php"
        
        Alamofire.request(.GET, url).responseJSON
            { response in
                
                if let jsonRaw = response.result.value
                {
                    self.jsonDataOntvangen(JSON(jsonRaw))
                }
        }
    }
    
    //
    //  De json data is ontvangen nu kunnen we alles tonen op het scherm
    //
    func jsonDataOntvangen(jsonData: JSON)
    {
        self.jsonData = jsonData
        makeArray()
        

        SongsTable.setNumberOfRows(self.songs.count, withRowType: "SongRow")
            
        for index in 0..<SongsTable.numberOfRows
        {
            if let controller = SongsTable.rowControllerAtIndex(index) as? SongRowController
            {
                    controller.song = self.songs[index]
            }
        }

    }
    
    //
    //  We zetten de json data om in een array met data
    //
    func makeArray()
    {
        if self.jsonData != nil
        {
            for (var i = 0; i < self.jsonData?.count; i+=1)
            {
                let tempSong = Song(titel: self.jsonData![i]["titel"].stringValue, artiest: self.jsonData![i]["artiest"].stringValue)
                
                if(i == 0)
                {
                    tempSong.setStatus("Next")
                }
                else if (i == 1)
                {
                    tempSong.setStatus("Now")
                }
                
                self.songs.append(tempSong)
            }
        }
    }
    
}
