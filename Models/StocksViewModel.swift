//
//  StocksViewModel.swift
//  CashAppStocks
//
//  Created by Edward Kyles on 7/12/23.
//

import SwiftUI
import Foundation
import Combine

enum AsynchStatus {
    case initial, loading, loaded, error
}

class StocksViewModel: ObservableObject {
    
    @Published var stocks = [Stock]()
    @Published var status: AsynchStatus = .initial

    let service: StocksServiceProtocol
    init(service: StocksServiceProtocol = StocksService()){
        self.service = service
    }
    
                
    func getStocks() {
        status = .loading
        Task {
            do {
                let stocks = try await service.fetchStocks()
                DispatchQueue.main.async {
                    self.stocks = stocks
                    self.status = .loaded
                }
            } catch {
                // Handle any errors that occurred during the fetching process
                print("Error fetching stocks: \(error)")
            }
        }
    }

}
