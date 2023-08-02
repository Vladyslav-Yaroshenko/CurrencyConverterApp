//
//  SelectionListSwiftUIView.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 01.08.2023.
//

import SwiftUI



struct SelectionListSwiftUIView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    let items = StorageManager.shared.getCurrencies()
    
    @Binding var country: String
    @Binding var codeName: String
    
    var body: some View {
            List {
                ForEach(items, id: \.self) { item in
                    let selectedImage = (codeName == item.currencyCode) ? "isSelectedTrue" : "isSelectedFalse"
                    SelectionListCellSwitUIView(imageName: "euro",
                                                currencyCode: item.currencyCode,
                                                currencyName: item.currencyName,
                                                isSelectedImage: selectedImage)
                    .onTapGesture {
                        country = item.currencyCode
                        codeName = item.currencyName
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationTitle("Selection List")
            .navigationBarTitleDisplayMode(.inline)
        }
}

//struct SelectionListSwiftUIView_Previews: PreviewProvider {
//
//
//
//    static var previews: some View {
//        SelectionListSwiftUIView(currencyCode: $Text("Hell"),
//                                 currencyName: $m)
//    }
//}
