//
//  StocksModelresponse.swift
//  Stocks
//
//  Created by Gracie on 11/07/2024.
//

import Foundation
//struct stocksresponse: Decodable {
//    let close: Double
//    let open: Double
//    let high: Double
//    let low: Double
//    let item: String


struct stocksResponse: Decodable {
    let results: [stocksResponseResults]
}

struct stocksResponseResults: Decodable {
    let c: Double
    let o: Double
    let h: Double
    let l: Double
    let T: String
    
//    private enum CodingKeys: String, CodingKey{
//        case close = "c"
//        case open = "o"
//        case high = "h"
//        case low = "l"
//        case item = "T"
//    }
}
