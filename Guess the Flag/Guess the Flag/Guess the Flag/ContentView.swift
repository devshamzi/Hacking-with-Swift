//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Shamzi on 18/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State var showScore = false
    @State var scoreTitle = ""
    @State var yourScore = 0

    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()

    @State var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .pink], startPoint: .center, endPoint: .bottomLeading)


            VStack(spacing: 30){
                VStack(spacing: 10){
                    Text("Guess the Country Flag of")
                        .foregroundColor(.white)
                        .font(.system(.headline))
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.system(.largeTitle))

                }

                ForEach(0..<3) { number in
                    Button() {
                        checkIsCorrect(number: number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                }
            }

        }
        .ignoresSafeArea()
        .alert(scoreTitle, isPresented: $showScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(yourScore)")
        }
    }

    func checkIsCorrect(number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            yourScore += 10
        } else {
            scoreTitle = "Wrong"
        }
        showScore = true
    }

    func askQuestion() {
        countries.shuffle()
        self.correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
