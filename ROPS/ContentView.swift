//
//  ContentView.swift
//  ROPS
//
//  Created by Görkem Güray on 11.02.2024.
//

import SwiftUI


struct ContentView: View {
    
    let color0 = Color(red: 127/255, green: 176/255, blue: 105/255)
    let color1 = Color(red: 236/255, green: 228/255, blue: 183/255)
    
    @State private var score = 0
    @State private var appMoveChoice = Int.random(in: 0...2)
    @State private var appMoveCondition = Bool.random()
    @State private var gameFinished = false
    
    private var possibleMoves = ["👊", "🖐️", "✌️"]
    @State private var gameIteration = 0
    
    //0 wins, 1 loss, 2 draws
    private var rockMatch = ["✌️","🖐️","👊"]
    private var paperMatch = ["👊","✌️","🖐️"]
    private var scissorMatch = ["🖐️","👊","✌️"]
    
    
    
    var body: some View {
        ZStack{
            //Z-0
            RadialGradient(stops:[
                .init(color: color0, location: 0.3),
                .init(color: color1, location: 0.3)], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            //Z-1
            VStack(spacing:15){
                Text("Rock, Paper, Scissor!")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                Spacer()
                
                VStack{

                    Text("Condition:")
                        .font(.subheadline)
                        .foregroundStyle(.black)
                    Text(appMoveCondition ? "Win" : "Lose")
                        .font(.title.bold())
                    
                    Spacer()
                    
                    Text(possibleMoves[appMoveChoice])
                        .frame(maxWidth: UIScreen.main.bounds.width-50)
                        .background(.separator)
                        .clipShape(.circle)
                        .font(.system(size:200))
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    HStack(spacing:15) {
                        ForEach(possibleMoves, id: \.self) {choice in
                            Button {
                                switch(choice) {
                                case "👊":
                                    if possibleMoves[appMoveChoice] == rockMatch[0] {
                                        score += 1
                                        nextMove()
                                    } else if possibleMoves[appMoveChoice] == rockMatch[1] {
                                        score -= 1
                                        nextMove()
                                    } else {
                                        nextMove()
                                    }
                                case "🖐️":
                                    if possibleMoves[appMoveChoice] == paperMatch[0] {
                                        score += 1
                                        nextMove()
                                    } else if possibleMoves[appMoveChoice] == paperMatch[1] {
                                        score -= 1
                                        nextMove()
                                    } else {
                                        nextMove()
                                    }
                                case "✌️":
                                    if possibleMoves[appMoveChoice] == scissorMatch[0] {
                                        score += 1
                                        nextMove()
                                    } else if possibleMoves[appMoveChoice] == scissorMatch[1] {
                                        score -= 1
                                        nextMove()
                                    } else {
                                        nextMove()
                                    }
                                default:
                                    print("ne oldu anlamadım.")
                                }
                            } label: {
                                Text(choice)
                            }
                            .frame(maxWidth:.infinity)
                            .padding(.horizontal, 5)
                            .background(.windowBackground)
                            .clipShape(.circle)
                            .font(.system(size: 50))
                        }
                    }
                    
                   Spacer()
                }
                .frame(maxWidth: UIScreen.main.bounds.width-40)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 13))
                
                Spacer()
                Text("Score: \(score)")
                    .font(.headline.bold())
                    .foregroundStyle(.blue)
                
            }.alert("Game Finished", isPresented: $gameFinished) {
                Button("Reset", action: resetTheGame)
            } message: {
                Text("Your score is : \(score)")
            }
        }
    }
    
    func nextMove() {
        if gameIteration == 9 {
            gameFinished = true
        } else {
            gameIteration += 1
            appMoveChoice = Int.random(in: 0...2)
            appMoveCondition = Bool.random()
        }
        
    }
    
    func resetTheGame() {
        score = 0
        gameIteration = 0
        gameFinished = false
        appMoveChoice = Int.random(in: 0...2)
        appMoveCondition = Bool.random()
    }
    
}

#Preview {
    ContentView()
}
