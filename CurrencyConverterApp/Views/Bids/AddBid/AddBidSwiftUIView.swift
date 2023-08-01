//
//  AddBidSwiftUIView.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 31.07.2023.
//

import SwiftUI
import Combine

struct AddBidSwiftUIView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @State private var textFieldValue = ""
    @State private var textLabel = "Bid value"
    @State private var buttonBackgroundColor = Color(red: 0.80, green: 0.8, blue: 0.80)
    @State private var buttonDisabled = true
    
    @State private var countryFrom = "Select Counrty Currency"
    @State private var countryTo = "Select Counrty Currency"
    @State private var currencyFrom = "--"
    @State private var currencyTo = "--"
    
    
    var body: some View {
        
            VStack(alignment: .center, spacing: 40) {
                VStack(alignment: .leading, spacing: 20) {
                    Text(textLabel)
                        .fontWeight(.semibold)
                        .font(
                            Font.system(size: 20)
                        )
                    
                    TextField("Enter Bid Currency Value", text: $textFieldValue)
                        .textFieldStyle(.roundedBorder)
                    NavigationLink(destination: SelectionListSwiftUIView(
                        currencyCode: $countryFrom,
                        currencyName: $currencyFrom)) {
                            
                        SelectCountrySwiftUIView(title: "(FROM)",
                                                 countryFromText: countryFrom,
                                                 currencyCode: currencyFrom)
                            .foregroundColor(.black)
                    }
                    
                    NavigationLink(destination: SelectionListSwiftUIView(
                        currencyCode: $countryTo,
                        currencyName: $currencyTo)) {
                        SelectCountrySwiftUIView(title: "(TO)",
                                                 countryFromText: countryTo,
                                                 currencyCode: currencyTo)
                            .foregroundColor(.black)
                    }
                    
                }
                .padding()
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Add")
                        .font(
                            Font.custom("Inter", size: 20)
                                .weight(.semibold)
                        )
                        .padding(.horizontal, 110)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(buttonBackgroundColor)
                        .cornerRadius(8)
                    
                }
                .disabled(buttonDisabled)
                .onChange(of: textFieldValue) { newValue in
                    buttonDisabled = newValue.isEmpty
                    buttonBackgroundColor = buttonDisabled ? Color(red: 0.80, green: 0.8, blue: 0.80) : .blue
                }
                Spacer()
            
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

