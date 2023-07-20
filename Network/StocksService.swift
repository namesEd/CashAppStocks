//
//  StockService.swift
//  CashAppStocks
//
//  Created by Edward Kyles on 7/12/23.
//

import Foundation
import Combine

//class StocksService {
//    func fetchStocks() async throws -> [Stock] {
//        guard let url = URL(string: "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json") else { throw APIError.invalidURL }
//        let (data, response) = try await URLSession.shared.data(from: url)
//        guard let resp = response as? HTTPURLResponse, resp.statusCode == 200 else {
//            throw APIError.invalidResponse
//        }
//        return try JSONDecoder().decode([Stock].self, from: data)
//    }
//}

protocol StocksServiceProtocol {
    func fetchStocks() async throws -> [Stock]
}

class StocksService: StocksServiceProtocol {
    func fetchStocks() async throws -> [Stock] {
        guard let url = URL(string: "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json") else {
            throw APIError.invalidURL
        }
            do {
                //let data = try await URLSession.shared.data(from: url)
                let (data, _) = try await URLSession.shared.data(from: url)
                let result = try JSONDecoder().decode(Stocks.self, from: data)
                return result.stocks
            } catch {
                print(error.localizedDescription)
                print(error)
                throw APIError.decodingError
            }
        }
}
