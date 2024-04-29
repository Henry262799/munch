//
//  Post.swift
//  munch_3
//
//  Created by Angelina Chen on 4/28/24.
//

import Foundation

// ADD ONTO THIS.

struct Post : Codable {
    let name: String
    
    init(name: String) {
        self.name = name
    }

}
