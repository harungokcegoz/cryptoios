//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Harun Gökçegöz on 02/08/2023.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView().navigationBarHidden(true)
            }
            .environmentObject(viewModel)
        }
    }
}
