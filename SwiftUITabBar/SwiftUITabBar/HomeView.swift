//
//  HomeView.swift
//  SwiftUITabBar
//
//  Created by 李荣生 on 2023/12/12.
//

import SwiftUI

struct HomeView: View {
    
    @State var isPush = false
    
    var body: some View {
        VStack {
            
            NavigationLink(isActive: $isPush) {
                DetailsView()
            } label: {
                
            }
            
            
            Button {
                isPush = true
                
            } label: {
                
                Text("二级页面")
                    .font(Font.system(size: 18,weight: .bold))
                    .foregroundColor(.red)
                
            }.frame(width: 100, height: 44.0)
                .background(Color.yellow)
        }
    }
}

#Preview {
    HomeView()
}
