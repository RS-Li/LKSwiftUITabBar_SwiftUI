//
//  LKTabBarContainerView.swift
//  SwiftUITabBar
//
//  Created by 李荣生 on 2023/12/9.
//

import SwiftUI

enum LKTabBarStyle {
    ///normal:常规型、sliderLump:滑动色块、colorLump:常规色块、shaped:中心异形
    case normal,
         sliderLump,
         colorLump,
         shaped
}


struct LKTabBarContainerView<Content:View>: View {
    
    @Binding var selectedItem:LKTabBarItem
    let tabBarStyle : LKTabBarStyle
    let content:Content
    @State private var tabItems:[LKTabBarItem] = []
    
    init(selectedItem: Binding<LKTabBarItem>, 
         tabBarStyle: LKTabBarStyle,
         @ViewBuilder content: () -> Content) {
        
        self._selectedItem = selectedItem
        self.tabBarStyle = tabBarStyle
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            
            ZStack(alignment: .bottom) {
                
                content
                    .ignoresSafeArea()
                
                LKTabBarView(tabItems: tabItems,
                             style: tabBarStyle,
                             selectedItem: $selectedItem,
                             animationSelectedItem: selectedItem)
            } .ignoresSafeArea(edges: tabBarStyle == .shaped ? .bottom : .top)
            
            .onPreferenceChange(LKTabBarItemsPreferenceKey.self) { value in
                self.tabItems = value
            }
            
        }
    }
}


//#Preview {
//    LKTabBarContainerView()
//}
