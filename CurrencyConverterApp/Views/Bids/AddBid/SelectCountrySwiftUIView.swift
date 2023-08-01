//
//  SelectCountrySwiftUIView.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 31.07.2023.
//

import SwiftUI

struct SelectCountrySwiftUIView: View {
    
    var title: String
    var countryFromText: String
    var currencyCode: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15, content: {
            NavigationLink(destination: WalletView()) {
    
            }
            Text("Select Country Currency \(title)")
                .bold()
            
            HStack(spacing: 10) {
                Image("")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .background(Color(.gray))
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(countryFromText)
                    Text(currencyCode)
                }
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding()
            .border(Color(red: 0.85, green: 0.85, blue: 0.85), width: 2)
        })
    }
}

struct SelectCountrySwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SelectCountrySwiftUIView(title: "From",
                                 countryFromText: "Country",
                                 currencyCode: "--")
    }
}
