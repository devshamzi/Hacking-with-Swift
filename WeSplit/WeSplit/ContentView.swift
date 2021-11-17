//
//  ContentView.swift
//  WeSplit
//
//  Created by Shamzi on 17/11/2021.
//

import SwiftUI

struct ContentView: View {

    @State var checkAmount = 0.00
    @State var numbOfPeople = 2
    @State var tipPercentage = 20

    let tipPercentages = [10, 15, 20, 25, 0]

    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Enter the amount:", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "AED"))

                    Picker("Number of people:", selection: $numbOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) People")
                        }
                    }
                }

                Section {
                    Picker("Tip Percenatge:", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section {
                    Text(checkAmount, format: .currency(code: Locale.current.currencyCode ?? "AED"))
                }
            }.navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
