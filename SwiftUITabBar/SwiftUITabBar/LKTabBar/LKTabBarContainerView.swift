//
//  LKTabBarContainerView.swift
//  SwiftUITabBar
//
//  Created by 李棒棒 on 2023/12/9.
//

import SwiftUI

///TabBar样式枚举
enum LKTabBarStyle {
    
    //normal:常规型、sliderLump:滑动色块、colorLump:常规色块、shaped:中心异形
    
    ///normal:常规型
    case normal
    ///滑动色块
    case sliderLump
    ///常规色块
    case colorLump
    ///中心异形(仿墨迹天气)
    case shaped
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
                
            }.ignoresSafeArea(edges: tabBarStyle == .shaped ? .bottom : .top)
            .onPreferenceChange(LKTabBarItemsPreferenceKey.self) { value in
                self.tabItems = value
            }
            
        }
    }
}


//#Preview {
//    LKTabBarContainerView()
//}
