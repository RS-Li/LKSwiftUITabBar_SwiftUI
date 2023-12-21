//
//  LKTabBarItemsPreferenceKey.swift
//  SwiftUITabBar
//
//  Created by 李棒棒 on 2023/12/11.
//

import SwiftUI

struct LKTabBarItemsPreferenceKey: PreferenceKey {
    static var defaultValue: [LKTabBarItem] = []
    static func reduce(value: inout [LKTabBarItem], 
                       nextValue: () -> [LKTabBarItem]) {
        value += nextValue()
    }
}


struct LKTabBarItemViewModifier:ViewModifier {
    let tabItem: LKTabBarItem
    @Binding var selectedItem:LKTabBarItem
    
    func body(content:Content) -> some View {
        content
            .opacity(selectedItem == tabItem ? 1.0 : 0.0)
            .preference(key: LKTabBarItemsPreferenceKey.self, value: [tabItem])
    }
}
//扩展view增加设置tabBarItem方法
extension View {
    
    func tabBarItem(_ item: LKTabBarItem, selectedItem:Binding<LKTabBarItem>) -> some View {
        self.modifier(LKTabBarItemViewModifier(tabItem: item,
                                               selectedItem: selectedItem))
    }
}



