//
//  TabBar.swift
//  DesignCode
//
//  Created by xiaoka on 2022/10/29.
//

import SwiftUI

struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @State var selectedColor: Color = .indigo
    @State var tabItemWidth: CGFloat = 0
    var body: some View {
        HStack {
            buttons
        }
        .padding(.top, 14)
        .padding(.horizontal, 8)
        .frame(height: 88, alignment: .top)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
        .background(
            background
        )
        .overlay(
            overlay
        )
        .strokeStyle(cornerRadius: 34)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }

    var buttons: some View {
        ForEach(tabItems) { item in
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                    selectedTab = item.tab
                    selectedColor = item.color
                }

            } label: {
                VStack(spacing: 0) {
                    Image(systemName: item.icon)
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: 44, height: 29)
                    Text(item.text)
                        .font(.caption2)
                        .lineLimit(1)
                }.frame(maxWidth: .infinity)
                    .foregroundColor(selectedTab == item.tab ? .primary : .secondary)
                    .blendMode(selectedColor == item.color ? .overlay : .normal)
                    .overlay(
                        GeometryReader { proxy in
                            Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                        }
                    )
                    .onPreferenceChange(TabPreferenceKey.self) {
                        value in
                        tabItemWidth = value
                    }
            }
        }
    }

    var background: some View {
        HStack {
            if selectedTab == .my { Spacer() }
            if selectedTab == .search { Spacer() }
            if selectedTab == .notifications {
                Spacer()
                Spacer()
            }
            Circle().fill(selectedColor).frame(width: tabItemWidth)
            if selectedTab == .home { Spacer() }
            if selectedTab == .search {
                Spacer()
                Spacer()
            }
            if selectedTab == .notifications { Spacer() }

        }.padding(.horizontal, 8)
    }

    var overlay: some View {
        HStack {
            if selectedTab == .my { Spacer() }
            if selectedTab == .search { Spacer() }
            if selectedTab == .notifications {
                Spacer()
                Spacer()
            }
            Rectangle().fill(selectedColor).frame(width: 28, height: 5)
                .cornerRadius(5).frame(width: tabItemWidth)
                .frame(maxHeight: .infinity, alignment: .top)

            if selectedTab == .home { Spacer() }
            if selectedTab == .search {
                Spacer()
                Spacer()
            }
            if selectedTab == .notifications { Spacer() }

        }.padding(.horizontal, 8)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
