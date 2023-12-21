//
//  DetailsView.swift
//  SwiftUITabBar
//
//  Created by 李棒棒 on 2023/12/12.
//

import SwiftUI

struct DetailsView: View {
    
    @State private var tabSelected: LKTabBarItem = .home
    
    var body: some View {
        Group {
            
            LKTabBarContainerView(selectedItem: $tabSelected,
                                  tabBarStyle: .sliderLump) {
                //首页
                HomeView().tabBarItem(.home, selectedItem: $tabSelected)
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                    .background(Color.gray.opacity(0.6))
                    .ignoresSafeArea()
                
                //资讯
                ContentView().tabBarItem(.news, selectedItem: $tabSelected)
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
                
                //自媒体
                ContentView().tabBarItem(.media, selectedItem: $tabSelected)
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
                
                //消息
                ContentView().tabBarItem(.message, selectedItem: $tabSelected)
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
                //我的
                ContentView().tabBarItem(.mine, selectedItem: $tabSelected)
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
                
            }
        }
    }
}

#Preview {
    DetailsView()
}
