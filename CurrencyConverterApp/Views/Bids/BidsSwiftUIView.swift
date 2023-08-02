//
//  BidsSwiftUIView.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 31.07.2023.
//

import SwiftUI
import Combine

struct BidsSwiftUIView: View {
    
    @StateObject var viewModel = BidsViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.bids, id: \.self) { bidViewModel in
                                    BidsCellSwiftUIView(viewModel: bidViewModel)
                                }
            }
            .listStyle(.plain)
            
            .navigationTitle(Text("Bids"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print(viewModel.bids.count)
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(red: 0.85,
                                                   green: 0.85,
                                                   blue: 0.85))
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        AddBidSwiftUIView(bidsViewModel: viewModel)
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
