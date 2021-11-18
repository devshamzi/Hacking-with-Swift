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
            RadialGradient(stops: [
                .init(color: .indigo, location: 0.30),
                .init(color: .purple, location: 0.30)
            ], center: .top, startRadius: 200, endRadius: 700)
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                Spacer()
                VStack(spacing: 20){
                    VStack(spacing: 10){
                        Text("Tap the Flag of")
                            .foregroundStyle(.secondary)
                            .font(.system(.headline))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.secondary)
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
                .frame(maxWidth: .infinity)
                .padding(.vertical, 50)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))

                Spacer()
                Spacer()
                Text("Your score: \(yourScore)")
                    .font(.largeTitle.italic())
                    .foregroundColor(.white)
                Spacer()
            }

            .padding()
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
