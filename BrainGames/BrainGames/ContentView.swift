//
//  ContentView.swift
//  BrainGames
//
//  Created by admin on 2/23/21.
//

import SwiftUI

enum ColorOptions: CaseIterable {
    case Red
    case Yellow
    case Blue
    case Green
    case Orange
    case Purple
    case Pink
    
    var colorAsText: String {
        switch self {
        case .Blue:
            return "Blue"
        case .Green:
            return "Green"
        case .Orange:
            return "Orange"
        case .Pink:
            return "Pink"
        case .Purple:
            return "Purple"
        case .Red:
            return "Red"
        case .Yellow:
            return "Yellow"
        }
    }
    
    var textColor: Color {
        switch self {
        case .Blue:
            return .blue
        case .Green:
            return .green
        case .Orange:
            return .orange
        case .Pink:
            return .pink
        case .Purple:
            return .purple
        case .Red:
            return .red
        case .Yellow:
            return .yellow
        }
    }
    
    init(){
        self = ColorOptions.allCases[Int.random(in: 0..<ColorOptions.allCases.count)]
    }
}

struct ContentView: View {
    
    @State var topColor = ColorOptions()
    @State var bottomColor = ColorOptions()
    @State var bottomTextColor = ColorOptions()
    @State var playTime = 30
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var score: Int = 0
    
    var body: some View {
        ZStack {
            Image("space2")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 20){
                Text("Brain Games")
                    .font(.system(size: 35, weight: .semibold, design:.rounded))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                    .padding(.leading, 35)
                    .padding(.trailing, 35)
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                Image("Brain")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180,height:180)
                Text("Does the meaning match the text color?")
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 25, weight: .light, design:.rounded))
                    .foregroundColor(.white)
                
                VStack{
                    Text("\(topColor.colorAsText)")
                        .frame(width: 160)
                        .font(.system(size: 28, design:.rounded))
                        .padding(.top, 15)
                        .padding(.bottom, 15)
                        .padding(.leading, 30)
                        .padding(.trailing, 30)
                        .background(Color.white)
                        .padding(5)
                    Text("\(bottomColor.colorAsText)")
                        .frame(width: 160)
                        .font(.system(size: 28, design:.rounded))
                        .padding(.top, 15)
                        .padding(.bottom, 15)
                        .padding(.leading, 30)
                        .padding(.trailing, 30)
                        .background(Color.white)
                        .foregroundColor(bottomTextColor.textColor)
                        .padding(5)
                }
                
                HStack{
                    
                    Button(action: {
                        checkAnswer(answer: true)
                    }, label: {
                        Image("yes")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20,height:20)
                        Text("Yes")
                    })
                    .font(.system(size: 25, weight: .semibold, design:.rounded))
                    .frame(width: 80)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .padding(.leading, 25)
                    .padding(.trailing, 25)
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                    .padding(5)
                    
                    Button(action: {
                        checkAnswer(answer: false)
                    }, label: {
                        Image("no")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20,height:20)
                        Text("No")
                    })
                    .font(.system(size: 25, weight: .semibold, design:.rounded))
                    .frame(width: 80)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .padding(.leading, 25)
                    .padding(.trailing, 25)
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                    .padding(5)
                }
                
                HStack(alignment: .center, spacing: 20){
                    Text("Score: \(score) | Time Left: \(playTime) secs")
                        .onReceive(timer) { _ in
                            if playTime > 0 {
                                playTime -= 1
                            }
                            else if playTime == 0 {
                                print("Game over.")
                                self.timer.upstream.connect().cancel()
                            }
                        }
                        .font(.system(size: 20, weight: .semibold, design:.rounded))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        .padding(.leading, 35)
                        .padding(.trailing, 35)
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(10)}
                        .padding(.bottom, 20)
            }
        }
    }
    
    func checkAnswer(answer: Bool){
        if topColor == bottomTextColor && answer{
            print("You got a point!")
            score += 5
        }
        else if topColor != bottomTextColor && !answer{
            print("You got a point!")
            score += 5
        }
        else{
            print("You lost a point.")
            score -= 1
        }
        
        topColor = ColorOptions()
        bottomColor = ColorOptions()
        bottomTextColor = ColorOptions()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
