//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by 黒川龍之介 on 2022/11/12.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia","France","Germany","Ireland","Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var questionCount = 0
    @State private var showingFinal = false
    @State private var finalTitle = ""
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3), .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)], center: .top, startRadius: 200, endRadius: 400).ignoresSafeArea()
            VStack{
                Spacer()
                Text("Guesss the flag").font(.largeTitle.bold()).foregroundColor(.white)
                VStack(spacing:15.0) {
                    VStack{
                        Text("Tap the flag of").foregroundStyle(.secondary).font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.secondary).font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3){ number in
                        Button{
                            //flag was tapped
                            flagTapped(number)
                        }label: {
                            Image(countries[number]).renderingMode(.original).clipShape(Capsule()).shadow(radius: 5)
                        }
                        .alert(finalTitle, isPresented: $showingFinal) {
                            Button("Reset", action: reset)
                        } message: {
                            Text("Your final score is \(score)")
                        }
                        .alert(scoreTitle, isPresented: $showingScore) {
                            Button("Continue", action: askQuestion)
                        } message: {
                            Text("Your score is \(score)")
                        }
                    }
                }
                .frame(maxWidth:  .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Your sore is \(score)").foregroundColor(.white).font(.title.bold())
                Spacer()
            }
            .padding()
        }
            
    }
    
    func flagTapped(_ number: Int) {

        
        if number == correctAnswer{
            scoreTitle = "Correct"
            score += 1
        }else{
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
        }
        if questionCount == 7{
            showingFinal = true
            showingScore = false
        }else{
            showingScore = true
        }
        
        questionCount += 1
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        score = 0
        questionCount = 0
        showingFinal = false
        countries.shuffle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
