//
//  LKTabBarItem.swift
//  SwiftUITabBar
//
//  Created by 李荣生 on 2023/12/9.
//

import SwiftUI

enum LKTabBarItem: Hashable {
    
    case home,
         news,
         media,
         message,
         mine,
         publish
    
    ///标题
    var title: String {
        switch self {
        case .home:
            return String.Btn.home
        case .news:
            return String.Btn.news
        case .media:
            return String.Btn.media
        case .message:
            return String.Btn.message
        case .mine:
            return String.Btn.main
        case .publish:
            return ""
        }
    }
    
    
    ///未选中时图标
    var normalIcon: String {
        switch self {
        case .home:
            return String.Img.tab_home
        case .news:
            return String.Img.tab_news
        case .media:
            return String.Img.tab_media
        case .message:
            return String.Img.tab_message
        case .mine:
            return String.Img.tab_mine
        case .publish:
            return ""
        }
    }
    
    
    ///选中时图标
    var seIcon: String {
        switch self {
        case .home:
            return String.Img.tab_home_selected
        case .news:
            return String.Img.tab_news_selected
        case .media:
            return String.Img.tab_media_selected
        case .message:
            return String.Img.tab_message_selected
        case .mine:
            return String.Img.tab_mine_selected
        case .publish:
            return ""
        }
    }
    
    //未选中时的字体
    var norFont:Font {
        return Font.system(size: 14,weight: .regular)
    }
    
    //已选中时的字体
    var seFont:Font {
        return Font.system(size: 16,weight: .bold)
    }
    
    var norTitleColor:Color {
        return Color.gray
    }
    
    var seTitleColor:Color {
        return Color.blue
    }
    
    ///item的配色
    var lumpColor: Color {
        switch self {
        case .home:
            return Color.blue
        case .news:
            return Color.red
        case .media:
            return Color.yellow
        case .message:
            return Color.green
        case .mine:
            return Color.cyan
        case .publish:
            return Color.clear
        }
    }
    
    
}
