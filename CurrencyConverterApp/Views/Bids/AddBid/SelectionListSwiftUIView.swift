//
//  SelectionListSwiftUIView.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 01.08.2023.
//

import SwiftUI

struct SelectionListSwiftUIView: View {
    
    let items = StorageManager.shared.getCurrencies()
    
    var body: some View {
            List {
                ForEach(items, id: \.self) { item in
                    SelectionListCellSwitUIView(imageName: "euro",
                                                currencyCode: item.currencyCode,
                                                currencyName: item.currencyName,
                                                isSelectedImage: "isSelectedFalse")
                }
            }
            .navigationTitle("Selection List")
            .navigationBarTitleDisplayMode(.inline)
        }
}

struct SelectionListSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionListSwiftUIView()
    }
}
