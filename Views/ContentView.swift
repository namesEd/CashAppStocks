//
//  ContentView.swift
//  CashAppStocks
//
//  Created by Edward Kyles on 7/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = StocksViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.green, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                List(viewModel.stocks) { stock in
                    VStack {
                        HStack {
                            VStack {
                                Text(stock.ticker)
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundColor(.gray)
                                //.frame(maxWidth: 250, alignment: .topLeading)
                                Text(stock.name)
                                
                            }
                            Spacer()
                            HStack {
                                Text("$\((stock.current_price_cents)/100000)")
                                    .padding(8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.red.opacity(0.7))
                                    )
                                //Text(stock.currency)
                            }
                            
                        }
                        .padding()
                        Text("\((stock.current_price_timestamp)/10000)")
                        
                    }
                    
                    .background(.white)
                    .cornerRadius(30)
                    .frame(maxWidth: 330)
                    .scrollContentBackground(.hidden)
                }
                .navigationTitle("Stocks")
            }
            .onAppear() {
                viewModel.getStocks()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
