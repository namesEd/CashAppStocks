//
//  APIError.swift
//  CashAppStocks
//
//  Created by Edward Kyles on 7/14/23.
//

import Foundation

enum APIError: Error {
    case decodingError, invalidURL, invalidResponse
    
    var description: String {
        switch self {
        case .decodingError:
            return "decoding error"
        case .invalidURL:
            return "invalid url"
        case .invalidResponse:
            return "invalid response"
        }
    }
}
