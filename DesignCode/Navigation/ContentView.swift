//
//  ContentView.swift
//  DesignCode
//
//  Created by xiaoka on 2022/10/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    var body: some View {
        ZStack(alignment: .bottom) {
            switch selectedTab {
            case .home:
                HomeView()
            case .search:
                AccountView()
            case .notifications:
                AccountView()
            case .my:
                AccountView()
            }
            TabBar()
        }.safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 44)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
