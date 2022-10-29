//
//  Tab.swift
//  DesignCode
//
//  Created by xiaoka on 2022/10/29.
//

import SwiftUI

struct TableItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
    var color: Color
}

var tabItems = [
    TableItem(text: "Home", icon: "house", tab: .home, color: .indigo),
    TableItem(text: "Search", icon: "magnifyingglass", tab: .search, color: .cyan),
    TableItem(text: "Notifications", icon: "bell", tab: .notifications, color: .purple),
    TableItem(text: "My", icon: "person", tab: .my, color: .teal),
]

enum Tab: String {
    case home
    case search
    case notifications
    case my
}

struct TabPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
