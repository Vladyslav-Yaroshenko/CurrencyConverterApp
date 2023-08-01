//
//  SelectionListCellSwitUIView.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 01.08.2023.
//

import SwiftUI

struct SelectionListCellSwitUIView: View {
    
    var imageName = "euro"
    var currencyCode: String
    var currencyName: String
    var isSelectedImage: String
    
    private func selectedImageColor() -> Color {
        if isSelectedImage == "isSelectedFalse" {
            return Color(red: 0.85, green: 0.85, blue: 0.85)
        } else {
            return Color(red: 0, green: 0.69, blue: 0.9)
        }
    }
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
            Text(currencyCode)
            Text(currencyName)
                .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
            Spacer()
            Image(isSelectedImage)
                .resizable()
                .renderingMode(.template)
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                .foregroundColor(selectedImageColor())
                
        }
    }
}

struct SelectionListCellSwitUIView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionListCellSwitUIView(currencyCode: "Euro", currencyName: "EUR", isSelectedImage: "isSelectedTrue")
    }
}
