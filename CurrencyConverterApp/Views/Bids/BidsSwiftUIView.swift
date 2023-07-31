//
//  BidsSwiftUIView.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 31.07.2023.
//

import SwiftUI

struct BidsSwiftUIView: View {
    var body: some View {
        NavigationView {
            List {
                BidsCellSwiftUIView()
                BidsCellSwiftUIView()
                BidsCellSwiftUIView()
            }
            .listStyle(.plain)
            
            .navigationTitle(Text("Bids"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("search bids")
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(red: 0.85,
                                                   green: 0.85,
                                                   blue: 0.85))
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        AddBidSwiftUIView()
                    } label: {
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

struct BidsSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        BidsSwiftUIView()
    }
}
