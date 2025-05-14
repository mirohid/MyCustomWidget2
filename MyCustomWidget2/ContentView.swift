//
//  ContentView.swift
//  MyCustomWidget2
//
//  Created by MacMini6 on 14/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("This is the main app")
                .font(.title)
            Text("Add the widget from your home screen")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
