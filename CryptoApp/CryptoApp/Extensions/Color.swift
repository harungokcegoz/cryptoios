//
//  Color.swift
//  CryptoApp
//
//  Created by Harun Gökçegöz on 02/08/2023.
//

import Foundation
import SwiftUI

extension Color {
        
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")

}
