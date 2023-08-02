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
    @State var searchText: String = ""
    
    var searchResults: [BidsCellViewModel] {
        if searchText.isEmpty {
            return viewModel.bids
        } else {
            return viewModel.bids.filter { $0.currencyFrom.lowercased().contains(searchText.lowercased()) || $0.currencyTo.lowercased().contains(searchText.lowercased())}
        }
    }
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { bidViewModel in
                                    BidsCellSwiftUIView(viewModel: bidViewModel)
                                }
            }
            .listStyle(.plain)
            .searchable(text: $searchText)
            
            .navigationTitle(Text("Bids"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                
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
