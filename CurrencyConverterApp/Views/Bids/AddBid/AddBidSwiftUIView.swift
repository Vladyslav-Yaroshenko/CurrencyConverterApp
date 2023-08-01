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
    
    @State private var countryFrom = "Select Country Currency"
    @State private var countryTo = "Select Country Currency"
    @State private var currencyFrom = "--"
    @State private var currencyTo = "--"
    
    var viewModel = AddBidViewModel()
    
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
                        .keyboardType(.decimalPad)
                    NavigationLink(destination: SelectionListSwiftUIView(
                        country: $countryFrom, code: $currencyFrom)) {
                            
                        SelectCountrySwiftUIView(title: "(FROM)",
                                                 countryFromText: countryFrom,
                                                 currencyCode: currencyFrom)
                            .foregroundColor(.black)
                    }
                    
                    NavigationLink(destination: SelectionListSwiftUIView(
                        country: $countryTo, code: $currencyTo)) {
                            
                        SelectCountrySwiftUIView(title: "(FROM)",
                                                 countryFromText: countryTo,
                                                 currencyCode: countryTo)
                            .foregroundColor(.black)
                    }
                    
                }
                .padding()
                
                Button(action: {
                    //presentationMode.wrappedValue.dismiss()
                    print(textFieldValue)
                    print(countryFrom)
                    print(countryTo)
                }) {
                    Text("Add")
                        .font(
                            Font.custom("Inter", size: 20)
                                .weight(.semibold)
                        )
                        .padding(.horizontal, 110)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(buttonDisabled ? buttonBackgroundColor : Color.blue)
                        .cornerRadius(8)
                    
                }
                .disabled(buttonDisabled)
                .onChange(of: textFieldValue) { newValue in
                    buttonDisabled = viewModel.isButtonActive(from: countryFrom,
                                                              to: countryTo,
                                                              isEmpty: newValue)
                    
                }
                .onChange(of: countryFrom) { newValue in
                    buttonDisabled = viewModel.isButtonActive(from: newValue,
                                                              to: countryTo,
                                                              isEmpty: textFieldValue)
                }
                .onChange(of: countryTo) { newValue in
                    buttonDisabled = viewModel.isButtonActive(from: countryFrom,
                                                              to: newValue,
                                                              isEmpty: textFieldValue)
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
