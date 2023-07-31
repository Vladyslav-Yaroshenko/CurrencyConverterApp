//
//  WalletView.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 30.07.2023.
//

import SwiftUI

struct WalletView: View {
    @State var items: [WalletCellSwiftUIView] = []
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 0, content: {
                    Text("Total Balance")
                        .font(
                            Font.custom("Inter", size: 20)
                                .weight(.semibold)
                        )
                        .foregroundColor(Color(red: 0.79, green: 0.74, blue: 0.74))
                    
                    Text("2.445.21 UAH")
                        .font(
                            Font.custom("Inter", size: 30)
                                .weight(.semibold)
                        )
                        .foregroundColor(.black)
                    
                })
                Spacer()
                
                List {
                    WalletCellSwiftUIView()
                    WalletCellSwiftUIView()
                    WalletCellSwiftUIView()
                }
                .listStyle(.plain)
                
            }
            .navigationTitle(Text("Wallet"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Add")
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(red: 0.85,
                                                   green: 0.85,
                                                   blue: 0.85))
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Add")
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(Color(red: 0.85,
                                                   green: 0.85,
                                                   blue: 0.85))
                    }
                }
            }
        }
    }
}


struct CustomListView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
