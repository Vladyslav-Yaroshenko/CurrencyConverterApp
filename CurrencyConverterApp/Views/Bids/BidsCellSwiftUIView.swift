//
//  BidsCellSwiftUIView.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 31.07.2023.
//

import SwiftUI

struct BidsCellSwiftUIView: View {
    var body: some View {
       
        
        VStack(alignment: .leading, spacing: 15, content: {
            HStack {
                HStack(spacing: -7, content: {
                    Image("euro")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    
                    Image("ukraine 1")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                })
                Spacer()
                
                Button(action: {
                    print("Open button")
                }) {
                    Text("Open")
                        .font(
                            Font.custom("Inter", size: 13)
                                .weight(.semibold)
                        )
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                        .foregroundColor(Color(red: 0.49, green: 0.64, blue: 0.4))
                        .background(Color(red: 0.95, green: 0.98, blue: 0.93))
                        .cornerRadius(8)
                }
                
            }
            Text("USD / EUR")
            HStack {
                Text("1200.00 USD")
                Spacer()
                Image(systemName: "arrow.forward")
                Spacer()
                Text("4000 UAH")
            }
        })
        
    }
}

struct BidsCellSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        BidsCellSwiftUIView()
    }
}
