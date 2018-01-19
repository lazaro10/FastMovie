//
//  Genre.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

class Genre:NSObject, NSCoding {
    var id: Int = 0
    var name: String = ""
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    required init(coder decoder: NSCoder)  {
        self.name = decoder.decodeObject(forKey: "name") as! String
        self.id = decoder.decodeInteger(forKey: "id")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encodeCInt(Int32(self.id), forKey: "id")
    }
    
}
