//
//  CoinRowView.swift
//  CryptoApp
//
//  Created by Harun Gökçegöz on 03/08/2023.
//

import SwiftUI

struct CoinRowView: View {

    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(){
            leftColumn
            if showHoldingsColumn {
                centerColumn
            }
            rightColumn
        }
        .font(.subheadline)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin, showHoldingsColumn: true)
            .previewLayout(.sizeThatFits)
        CoinRowView(coin: dev.coin, showHoldingsColumn: true)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}

extension CoinRowView {
    private var leftColumn: some View {
        HStack(spacing: 0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 10)
                .foregroundColor(Color.theme.accent)
            Spacer()
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing, spacing: 0){
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .foregroundColor(Color.theme.accent)
                .bold()
            Text(coin.currentHoldings?.asNumberString() ?? "0")
                .foregroundColor(Color.theme.accent)
        }
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing, spacing: 0){
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? 0.asPercentString())
                .foregroundColor((coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
