//
//  ContentView.swift
//  SwiftUITabBar
//
//  Created by 李荣生 on 2023/12/9.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .background(Color.pink)
        
    }
}

#Preview {
    ContentView()
}
