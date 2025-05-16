//
//  ContentView.swift
//  MyCustomWidget2
//
//  Created by MacMini6 on 14/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
            VStack (spacing:20){
                Text("This is the main app")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue.opacity(0.9))
                    .cornerRadius(25)
                Text("Add the widget from your home screen")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red.opacity(0.9))
                    .cornerRadius(25)
                
                Spacer()
                
                VStack{
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 300, height: 250)
                        .cornerRadius(25)
                        .overlay {
                            Text("This is the widget")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
