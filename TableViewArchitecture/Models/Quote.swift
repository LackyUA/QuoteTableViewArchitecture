//
//  Quote.swift
//  TableViewArchitecture
//
//  Created by Dima Dobrovolskyy on 5/16/19.
//  Copyright © 2019 Dima Dobrovolskyy. All rights reserved.
//

import Foundation

struct Quote: Decodable {
    
    // MARK: - Properties
    let author: String
    let quote: String
    let imageUrl: URL
    
}
