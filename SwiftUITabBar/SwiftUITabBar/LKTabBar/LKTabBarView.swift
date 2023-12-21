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

//#Preview {
//    LKTabBarView()
//}

///normal:常规型
extension LKTabBarView {
    
    private var normalTabBar: some View {
        
        VStack {
            Spacer()
                .padding(EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                .frame(height: 1.0)
                .background(Color.gray.opacity(0.8))
            
            HStack {//水平放置item
                ForEach(tabItems,id:\.self) { tab in
                    normalTabItemView(tabItem: tab)
                        .onTapGesture {
                            selectedItem = tab
                        }
                }
            }
        }
        .frame(minWidth: UIScreen.main.bounds.width)
        .padding(EdgeInsets(top: 6.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
        .background(Color.Auto.tabbar_background.ignoresSafeArea(edges: .bottom))
    }
    
    private func normalTabItemView(tabItem:LKTabBarItem) -> some View {
        
        VStack {//item的排列方式（图文垂直）
            
            Image(selectedItem == tabItem ? tabItem.seIcon : tabItem.normalIcon)
                .font(.subheadline)
            
            Spacer(minLength: 4.0)
            
            Text(tabItem.title)
                .font(selectedItem == tabItem ? tabItem.seFont : tabItem.norFont)
                .fontWeight(selectedItem == tabItem ? .bold : .regular)
            
        }.foregroundColor(selectedItem == tabItem ? selectedItem.seTitleColor : selectedItem.norTitleColor)
            .padding(.vertical, 6.0)
            .frame(maxWidth: .infinity,maxHeight: 49.0)
            .background(Color.Auto.tabbar_background)
            
    }
    
}


///sliderLump:滑动色块
extension LKTabBarView {
    
    private var sliderLumpTabBar: some View {
        
        HStack {
            ForEach(tabItems, id: \.self) { tab in
                sliderLumpTabItemView(tabItem: tab)
                    .onTapGesture {
                        selectedItem = tab
                    }
            }
        }
        .padding(6.0)
        .background(Color.Auto.tabbar_background.ignoresSafeArea(edges: .bottom))
        .cornerRadius(10.0)
        //立体阴影
        .shadow(color: Color.black.opacity(0.3), radius: 10.0, x: 0.0,y: 5.0)
        .padding(.horizontal)
        
    }
    
    private func sliderLumpTabItemView(tabItem:LKTabBarItem) -> some View {
        
        VStack {
            
            Image(selectedItem == tabItem ? tabItem.seIcon : tabItem.normalIcon)
                .font(.subheadline)
            
            Spacer(minLength: 2.0)
            Text(tabItem.title)
                .font(selectedItem == tabItem ? tabItem.seFont : tabItem.norFont)
                .fontWeight(selectedItem == tabItem ? .bold : .regular)
            
        }.foregroundColor(selectedItem == tabItem ? tabItem.seTitleColor : tabItem.norTitleColor)
            .padding(.vertical, 6.0)
            .frame(maxWidth: .infinity, maxHeight: 49.0)
            .background(
                
                //selectedItem == tabItem ? tabItem.lumpColor.opacity(0.2) : Color.clear
                
                ZStack {
                    if animationSelectedItem == tabItem {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(tabItem.lumpColor.opacity(0.2))
                            .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                    }
                }.padding(-2.0)
            )
    }
    
}


///colorLump:常规色块
extension LKTabBarView {
    
    private var colorLumpTabBar: some View {
        
        HStack {//水平放置item
            ForEach(tabItems,id:\.self) { tab in
                colorLumpTabItemView(tabItem: tab)
                    .onTapGesture {
                        selectedItem = tab
                    }
            }
        }
        .frame(minWidth: UIScreen.main.bounds.width)
        .padding(8.0)
        .background(Color.Auto.tabbar_background.ignoresSafeArea(edges: .bottom))
        .padding(.horizontal)

    }
    
    private func colorLumpTabItemView(tabItem:LKTabBarItem) -> some View {
        
        VStack {//item的排列方式（图文垂直）
            
            Image(selectedItem == tabItem ? tabItem.seIcon : tabItem.normalIcon)
                .font(.subheadline)
            
            Spacer(minLength: 2.0)
            
            Text(tabItem.title)
                .font(selectedItem == tabItem ? tabItem.seFont : tabItem.norFont)
                .fontWeight(selectedItem == tabItem ? .bold : .regular)
            
        }.foregroundColor(selectedItem == tabItem ? selectedItem.lumpColor : Color.gray)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity,maxHeight: 49.0)
            .background(selectedItem == tabItem ? tabItem.lumpColor.opacity(0.2) : Color.clear)
            .cornerRadius(10)
    }
    
}

///shaped:中心异形 (仿墨迹天气)
extension LKTabBarView {
    private var shapedTabBar: some View {
        
        // ZStack(alignment: .bottom) {
        
        LKShapedTabBarView(radius: 38.0)
            .fill(Color.Auto.tabbar_background)
            .frame(height: 88.0, alignment: .top)
            .shadow(color: Color.black.opacity(0.1),
                    radius: 4.0, x: 0.0, y: -1.0)
            .overlay(alignment: .center) {
                
                HStack {//水平放置item
                    
                    ForEach(tabItems,id:\.self) { tab in
                        if tab != .publish {
                            //添加正常的 item
                            shapedTabItemView(tabItem: tab)
                                .onTapGesture {
                                    selectedItem = tab
                                }
                            
                        } else {
                            
                            Button {
                                self.showingAlert.toggle()
                            } label: {
                                Image(systemName: "plus")
                                    .symbolVariant(.fill)
                                    .font(.body.bold())
                                    .frame(width: 56.0, height: 56.0)
                                    .foregroundColor(Color.white)
                                    .background(
                                        Circle()
                                            .fill(LinearGradient(gradient: Gradient(colors: [Color.Auto.floatingButtonTopLeft, Color.Auto.floatingButtonBottomRight]), 
                                                                 startPoint: .topLeading,
                                                                 endPoint: .bottomTrailing))
                                            .shadow(color: Color.accentColor.opacity(0.3), radius: 10, x: 8, y: 16)
                                    )
                                    .offset(y: -35.0)//下沉
                            }.alert("点我发布",isPresented: $showingAlert) {
                                Button("知道了", role: .cancel) {
                                    
                                }
                            }
                        }
                    }
                }
                .frame(height: 88.0, alignment: .top)
                .padding(.horizontal, 8.0)
                .padding(.top, 14.0)
                
            }//.padding(.bottom, -34)
            //.background(Color.clear.ignoresSafeArea(edges: .bottom))
    }
    
    private func shapedTabItemView(tabItem:LKTabBarItem) -> some View {
        
        VStack {//item的排列方式（图文垂直）
            
            Image(selectedItem == tabItem ? tabItem.seIcon : tabItem.normalIcon)
                .font(.subheadline)
            
            Spacer(minLength: 4.0)
            
            Text(tabItem.title)
                .font(selectedItem == tabItem ? tabItem.seFont : tabItem.norFont)
                .fontWeight(selectedItem == tabItem ? .bold : .regular)
            
        }.foregroundColor(selectedItem == tabItem ? selectedItem.seTitleColor : selectedItem.norTitleColor)
            //.padding(.vertical, 6.0)
            .frame(maxWidth: .infinity,
                   maxHeight: 49.0)
            //.background(Color.clear)
    }
}
