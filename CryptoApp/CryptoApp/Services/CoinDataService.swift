//
//  CoinDataService.swift
//  CryptoApp
//
//  Created by Harun Gökçegöz on 06/08/2023.
//

import Foundation

class CoinDataService {
    
    @Published var allCoins: [CoinModel] = []
    
    init(){
        getCoins()
    }
   
    private func getCoins(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=false&price_change_percentage=24h&locale=en&precision=3") else {return}
            
         
        
    }
    
}
