# LKTabBar-SwiftUI

#### 介绍
使用SwiftUI自定义的TabBar通过枚举类型可快捷创建常规样式、滑块样式、仿墨迹天气样式的TabBar支持二级页面嵌套使用

#### 软件架构

纯SwiftUI开发


#### 实现效果

![效果展示](%E6%BC%94%E7%A4%BA%E6%95%88%E6%9E%9C/%E6%95%88%E6%9E%9C.png)

![综合效果展示](https://foruda.gitee.com/images/1703143064443461608/15432064_9741077.gif "tutieshi_320x693_6s.gif") 



#### 设计思路

>1. 定义枚举类型LKTabBarStyle实现不同样式的选择；
>2.  根据SwiftUI中```ZStack```的特性定义TabBar容器LKTabBarContainerView；
>3. 根据LKTabBarStyle枚举实现对应的TabBar利用ZStack将用户的自定义页面与LKTabBarView按层级进行添加；
>4. 为方便调用使用```PreferenceKey```将自定义在菜单页面中的BarItem传递到TabBar容器LKTabBarContainerView对LKTabBarView进行布局实现LKTabBarStyle的样式效果；
>5. 利用动画实现TabBarItem的丝滑切换效果。


#### 具体实现

**1.自定义TabBar样式枚举支持 normal:常规型、sliderLump:滑动色块、colorLump:常规色块、shaped:中心异形（仿墨迹天气的样式）**

```
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
```
**2.定义需要的TabBar菜单item，采用枚举的方式将选中未选中时的状态资源一并进行定义，方便布局时调用(资源的定义使用扩展嵌套struct的结构，用于空间命名调用)**

```
//
//  LKTabBarItem.swift
//  SwiftUITabBar
//
//  Created by 李棒棒 on 2023/12/9.
//

import SwiftUI

enum LKTabBarItem: Hashable {
    
    case home,//首页
         news,//资讯
         media,//自媒体
         message,//消息
         mine,//个人中心
         publish//发布
    
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
    //未选中时的字体颜色
    var norTitleColor:Color {
        return Color.gray
    }
    //已选中时的字体颜色
    var seTitleColor:Color {
        return Color.blue
    }
    
    ///item的滑动色块配色
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
```
**3.根据枚举样式对LKTabBarView进行布局**
```
//
//  LKTabBarView.swift
//  SwiftUITabBar
//
//  Created by 李棒棒 on 2023/12/9.
//

import SwiftUI

struct LKTabBarView: View {
    
    let tabItems:[LKTabBarItem]
    let style:LKTabBarStyle
    @Binding var selectedItem:LKTabBarItem
    @Namespace private var namespace
    //动画过渡
    @State var animationSelectedItem:LKTabBarItem
    
    @State private var showingAlert = false
    
    var body: some View {
        
        switch style {
            
        case .normal:
            
            normalTabBar
                .onChange(of: selectedItem) { oldValue, newValue in
                    withAnimation(.easeInOut) {
                        animationSelectedItem = newValue
                    }
                }
            
        case .sliderLump:
            
            sliderLumpTabBar
                .onChange(of: selectedItem) { oldValue, newValue in
                    withAnimation(.easeInOut) {
                        animationSelectedItem = newValue
                    }
                }
            
        case .colorLump:
            
            colorLumpTabBar
                .onChange(of: selectedItem) { oldValue, newValue in
                    withAnimation(.easeInOut) {
                        animationSelectedItem = newValue
                    }
                }
            
        case .shaped:
            
            shapedTabBar
                .ignoresSafeArea()
                .onChange(of: selectedItem) { oldValue, newValue in
                    withAnimation(.easeInOut) {
                        animationSelectedItem = newValue
                    }
                }
        }
    }
}
```

#### 使用说明


```
//
//  SwiftUITabBarApp.swift
//  SwiftUITabBar
//
//  Created by 李棒棒 on 2023/12/9.
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

```

#### 详解

[详解 >> ](https://www.jianshu.com/p/8b646777ae50)

