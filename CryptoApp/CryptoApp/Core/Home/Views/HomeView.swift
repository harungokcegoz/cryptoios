//
//  HomeView.swift
//  CryptoApp
//
//  Created by Harun Gökçegöz on 02/08/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    
    @State private var showPorfolio: Bool = false
    
    var body: some View {
        //background
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
        }
        //contentlayer
        VStack {
            homeHeader
            columnTitles
            if !showPorfolio{
                allCoinsList
                    .transition(.move(edge: .leading))
            }
            if showPorfolio {
                portfolioCoinsList
                    .transition(.move(edge: .trailing))
            }
            Spacer(minLength: 0)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {

        HomeView()
            .navigationBarHidden(true)
            .environmentObject(dev.homeVM)
     
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            //left button
            CircleButtonView(iconName: showPorfolio ? "plus" : "info")
                .animation(.none)
                .background(
                CircleButtonAnimationView(animate: $showPorfolio)
                )
                
            Spacer()
            Text(showPorfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPorfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()){
                        showPorfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) {
                coin in CoinRowView(coin: coin, showHoldingsColumn: false)
                    .padding(.bottom, 10.0)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 0, trailing: 20))
            }
        }
        .listStyle(PlainListStyle())
    }
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) {
                coin in CoinRowView(coin: coin, showHoldingsColumn: true)
                    .padding(.bottom, 10.0)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 0, trailing: 20))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            if showPorfolio {
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
