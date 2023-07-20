//
//  StocksResponse.swift
//  CashAppStocks
//
//  Created by Edward Kyles on 7/12/23.
//

import Foundation

struct Stocks: Decodable {
    let stocks: [Stock]
}

struct Stock: Identifiable, Hashable, Codable {
    let id = UUID()
    let ticker: String
    let name: String
    let currency: String
    let current_price_cents: Double
    let quantity: Int?
    let current_price_timestamp: Int
    
    enum CodingKeys: String, CodingKey {
        case ticker, name, currency, current_price_cents, quantity, current_price_timestamp
    }
    
}

