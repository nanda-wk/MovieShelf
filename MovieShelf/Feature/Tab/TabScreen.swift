//
//  TabScreen.swift
//  MovieShelf
//
//  Created by Nanda WK on 2024-09-23.
//

import SwiftUI

struct TabScreen: View {
    @State private var selected: TabItem = .home

    init() {
        UITabBar.appearance().backgroundColor = UIColor(resource: .appPrimary)
        UITabBar.appearance().barTintColor = UIColor(resource: .appPrimary)
    }

    var body: some View {
        TabView(selection: self.$selected) {
            NavigationStack {
                HomeScreen()
            }
            .tabItem {
                self.CustomTabItem(tab: .home)
            }
            .tag(TabItem.home)

            NavigationStack {
                SearchScreen()
            }
            .tabItem {
                self.CustomTabItem(tab: .search)
            }
            .tag(TabItem.search)

            NavigationStack {
                FavoritesScreen()
            }
            .tabItem {
                self.CustomTabItem(tab: .favorites)
            }
            .tag(TabItem.favorites)
        }
    }

    @ViewBuilder
    private func CustomTabItem(tab: TabItem) -> some View {
        VStack {
            tab.icon
                .resizable()
                .frame(width: 20, height: 20)

            Text(tab.title)
                .font(.caption)
        }
    }
}

private enum TabItem: String, CaseIterable, Hashable, Identifiable {
    case home
    case search
    case favorites

    var id: String { self.rawValue }

    var title: String {
        switch self {
            case .home:
                return "Home"
            case .search:
                return "Search"
            case .favorites:
                return "Favorites"
        }
    }

    var icon: Image {
        switch self {
            case .home:
                return .init(systemName: "house")
            case .search:
                return .init(systemName: "magnifyingglass")
            case .favorites:
                return .init(systemName: "heart")
        }
    }
}

#Preview {
    TabScreen()
        .background(.gray)
}
