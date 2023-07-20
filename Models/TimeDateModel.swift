//
//  TimeDateModel.swift
//  CashAppStocks
//
//  Created by Edward Kyles on 7/14/23.
//

import Foundation

class TimeDateModel {
    func formattedTimestamp(_ timestamp: Double) -> String {
        let date = Date(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter.string(from: date)
    }
}
