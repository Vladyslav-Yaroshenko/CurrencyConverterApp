//
//  AddBidSwiftUIView.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 31.07.2023.
//

import SwiftUI

struct AddBidSwiftUIView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @State private var textFieldValue = ""
    @State private var textLabel = "Bid value"
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 40) {
                VStack(alignment: .leading, spacing: 20) {
                    Text(textLabel)
                        .fontWeight(.semibold)
                        .font(
                            Font.system(size: 20)
                        )
                    
                    TextField("Enter Bid Currency Value", text: $textFieldValue)
                        .textFieldStyle(.roundedBorder)
                    
                    SelectCountrySwiftUIView(country: "FROM")
                    SelectCountrySwiftUIView(country: "TO")
                    
                }
                .padding()
                
                Spacer()
                
                Button(action: {
                    print("Open button")
                }) {
                    Text("Add")
                        .font(
                            Font.custom("Inter", size: 20)
                                .weight(.semibold)
                        )
                        .padding(.horizontal, 110)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(Color(red: 0.80, green: 0.8, blue: 0.80))
                        .cornerRadius(8)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Add Bid")
    }
}

struct AddBidSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddBidSwiftUIView()
    }
}
