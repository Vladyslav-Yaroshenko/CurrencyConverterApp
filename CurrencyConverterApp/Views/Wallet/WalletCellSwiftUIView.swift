//
//  CodeSwiftUIView.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 31.07.2023.
//

import SwiftUI

struct WalletCellSwiftUIView: View {
    
    var body: some View {
        HStack {
            Image("ukraine 1")
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 5, content: {
                Text("GBP")
                    .font(
                        Font.custom("Inter", size: 20)
                            .weight(.medium)
                    )
                    .foregroundColor(.black)
                
                Text("1970.64 UAH")
                    .font(
                        Font.custom("Inter", size: 16)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.79, green: 0.74, blue: 0.74))
                    .frame(alignment: .leading)
            })
            Spacer()
            Text("1.500.00 USD")
                .font(
                    Font.custom("Inter", size: 20)
                        .weight(.medium)
                )
                .multilineTextAlignment(.trailing)
                .foregroundColor(.black)
        }
        .frame(height: 100)
    }
}

struct CodeSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        WalletCellSwiftUIView()
    }
}
