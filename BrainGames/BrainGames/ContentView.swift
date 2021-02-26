//
//  ContentView.swift
//  BrainGames
//
//  Created by admin on 2/23/21.
//

import SwiftUI

struct ContentView: View {
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
                Text("Blue")
                    .frame(width: 160)
                    .font(.system(size: 28, design:.rounded))
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    .background(Color.white)
                    .padding(5)
                Text("Red")
                    .frame(width: 160)
                    .font(.system(size: 28, design:.rounded))
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    .background(Color.white)
                    .foregroundColor(.purple)
                    .padding(5)
                }
                
                HStack{
                    
                    Button(action: {}, label: {
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
                    
                    Button(action: {}, label: {
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
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
