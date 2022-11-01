//
//  HomeView.swift
//  DesignCode
//
//  Created by xiaoka on 2022/10/29.
//

import SwiftUI

struct HomeView: View {
    @State var hasSrolled = false
    var body: some View {
        ScrollView {
            GeometryReader { proxy in
                Color.clear.preference(key: ScollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).midY)
            }
            FeaturedItemView()
            Color.clear.frame(height: 1000)
        }
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(ScollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut){
                if value < 0 {
                    hasSrolled = true
                } else {
                    hasSrolled = false
                }
            }
            
        })
        .tracking(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
        .safeAreaInset(edge: .top) {
            Color.clear.frame(height: 70)
        }
        .overlay(
            NavigationBar(hasSrolled: $hasSrolled, title: "Featured")
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
