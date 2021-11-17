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

    @FocusState var amountIsFocused: Bool

    let tipPercentages = [10, 15, 20, 25, 0]

    var totalPerPerson: Double {
        let totalPersonCount: Double = Double(numbOfPeople + 2)
        let tipSelection: Double = Double(tipPercentage)

        let tipValue: Double = checkAmount / 100 * tipSelection
        let grandTotal = tipValue + checkAmount
        let amountPerPerson = grandTotal / totalPersonCount
        return amountPerPerson
    }
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Enter the amount:", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "AED"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)

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
                } header: {
                    Text("How much tip do you want to leave?")
                }

                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "AED"))
                }
            }.navigationTitle("WeSplit")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
