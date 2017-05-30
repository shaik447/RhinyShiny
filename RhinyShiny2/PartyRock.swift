//
//  PartyRock.swift
//  PartyRock
//
//  Created by shaik mulla syed on 8/28/1438 AH.
//  Copyright © 1438 shaik mulla syed. All rights reserved.
//

import Foundation

class PartyRock{
    private var _videotitle:String!
    private var _videoUrl:String!
    private var _thumbnail:String!
    
    var VideoTitle:String{
        return _videotitle
    }
    
    var VideoUrl:String{
        return _videoUrl
    }
    
    var Thumbnail:String{
        return _thumbnail
    }
    
    
    init(videoTitle:String,videourl:String,thumbnail:String) {
        self._videotitle=videoTitle
        self._videoUrl=videourl
        self._thumbnail=thumbnail
    }
}
