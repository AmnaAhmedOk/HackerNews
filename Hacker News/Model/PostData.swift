//
//  PostData.swift
//  Hacker News
//
//  Created by Amna on 11/20/20.
//  Copyright © 2020 Amna. All rights reserved.
//

import Foundation

struct  PostData : Codable {
    let hits :[Post]
}

struct  Post :Codable ,Identifiable{
    var id : String {
        return objectID
    }
    let title : String
    let url : String?
    let objectID : String
    let points : Int
}
