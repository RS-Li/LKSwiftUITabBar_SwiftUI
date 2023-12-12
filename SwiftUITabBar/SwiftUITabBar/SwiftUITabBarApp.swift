//
//  SwiftUITabBarApp.swift
//  SwiftUITabBar
//
//  Created by 李荣生 on 2023/12/9.
//

import SwiftUI

@main
struct SwiftUITabBarApp: App {
    
    @State private var tabSelected: LKTabBarItem = .home
    
    var body: some Scene {
        
        WindowGroup {
            
            LKTabBarContainerView(selectedItem: $tabSelected,
                                  tabBarStyle: .shaped) {
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
                Color.red.tabBarItem(.publish, selectedItem: $tabSelected)
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
