//
//  AccountView.swift
//  DesignCode
//
//  Created by xiaoka on 2022/10/23.
//

import SwiftUI

struct AccountView: View {
    @State var isPannd = false

    var body: some View {
        NavigationView {
            List {
                profile
                menu
                links
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }

    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.largeTitle)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView()
                        .offset(x: -50, y: -100)
                )
                .background(
                    BlobView()
                        .offset(x: 200, y: 0)
                        .scaleEffect(0.6)
                )
                .frame(maxWidth: .infinity)
            Text("xiaoka")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.small)
                Text("ShangHai")
                    .foregroundColor(.secondary)
            }
        }
        .padding()
    }

    var menu: some View {
        Section {
            NavigationLink(destination: HomeView()) {
                Label("Setting", systemImage: "gear")
            }
            NavigationLink { HomeView() } label: {
                Label("Bill", systemImage: "creditcard")
            }
            NavigationLink { HomeView() } label: {
                Label("Help", systemImage: "questionmark.circle")
            }
        }
        .foregroundColor(.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
    }

    var links: some View {
        Section {
            Link(destination: URL(string: "https://github.com/xiaoka-li")!) {
                HStack {
                    Label("website", systemImage: "house")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
            .swipeActions(edge: .trailing) {
                Button(role: .destructive) {} label: {
                    Label("Delete", systemImage: "trash")
                }
                pinButton
            }
            Link(destination: URL(string: "https://youtube.com")!) {
                HStack {
                    Label("website", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
            .swipeActions(edge: .trailing) {
                Button(role: .destructive) {} label: {
                    Label("Delete", systemImage: "trash")
                }
                pinButton
            }
        }.foregroundColor(.primary)
    }

    var pinButton: some View {
        Button { isPannd.toggle() } label: {
            if isPannd {
                Label("UnPin", systemImage: "pin.slash")
            } else {
                Label("Pin", systemImage: "pin")
            }
        }.tint(isPannd ? .gray : .yellow)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
