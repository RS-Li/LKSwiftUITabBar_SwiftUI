//
//  LKTitles.swift
//  SwiftUITabBar
//
//  Created by 李棒棒 on 2023/12/9.
//

import Foundation
import SwiftUI

extension String {
    
    public struct Page {
        
    }
    
    public struct Btn {
        
        public static let home:String = "首页"
        public static let message:String = "消息"
        public static let news:String = "资讯"
        public static let media:String = "自媒体"
        public static let main:String = "我的"
        
    }
    
    public struct Img {
        
        public static let tab_home:String = "tab_home"
        public static let tab_home_selected:String = "tab_home_selected"
        
        public static let tab_news:String = "tab_news"
        public static let tab_news_selected:String = "tab_news_selected"
        
        public static let tab_message:String = "tab_msg"
        public static let tab_message_selected:String = "tab_msg_selected"
        
        public static let tab_media:String = "tab_media"
        public static let tab_media_selected:String = "tab_media_selected"
        
        public static let tab_mine:String = "tab_mine"
        public static let tab_mine_selected:String = "tab_mine_selected"
    }
    
}


extension Color {
    
    public struct Auto {
        public static let white_background:Color = Color("WhiteBackground")
        public static let tabbar_background:Color = Color("TabBarBackground")
        public static let floatingButtonTopLeft:Color = Color("FloatingButtonTopLeft")
        public static let floatingButtonBottomRight:Color = Color("FloatingButtonBottomRight")
    }
}
