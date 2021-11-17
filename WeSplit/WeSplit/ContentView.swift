//
//  ContentView.swift
//  WeSplit
//
//  Created by Shamzi on 17/11/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Form{

                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")

                Section{
                    Group{
                        Text("Hello, world!")
                        Text("Hello, world!")
                        Text("Hello, world!")
                        Text("Hello, world!")
                        Text("Hello, world!")
                    }
                    Group{
                        Text("Hello, world!")
                        Text("Hello, world!")
                        Text("Hello, world!")
                        Text("Hello, world!")
                        Text("Hello, world!")
                    }

                    Group{
                        Text("Hello, world!")
                        Text("Hello, world!")
                        Text("Hello, world!")
                        Text("Hello, world!")
                        Text("Hello, world!")
                    }
                }
            }.navigationTitle("SwiftUI")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
