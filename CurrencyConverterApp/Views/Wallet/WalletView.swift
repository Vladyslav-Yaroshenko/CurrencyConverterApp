//
//  WalletView.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 30.07.2023.
//

import SwiftUI

struct WalletView: View {
    
    var body: some View {
        NavigationView {
            List {
                WalletCellSwiftUIView()
                WalletCellSwiftUIView()
                WalletCellSwiftUIView()
            }
            .navigationTitle(Text("Wallet"))
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
}
    

struct CustomListView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
