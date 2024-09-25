//
//  HomeScreen.swift
//  MovieShelf
//
//  Created by Nanda WK on 2024-09-23.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                CustomCarousel(header: "Latest Movies")

                CustomCarousel(header: "Latest Series")

                TrendingCarousel()
            }
        }
        .background(.appPrimary)
    }

    @ViewBuilder
    private func CustomCarousel(header: String) -> some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 25) {
                    ForEach(1 ... 10, id: \.self) { num in
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(hue: Double(num) / 10, saturation: 1, brightness: 1).gradient)
                            .frame(width: UIScreen.main.bounds.width - 100, height: 200)
                            .scrollTransition { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0.5)
                                    .scaleEffect(y: phase.isIdentity ? 1 : 0.7)
                            }
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .contentMargins(.horizontal, 50, for: .scrollContent)
        } header: {
            Text(header)
                .font(.title)
                .bold()
                .foregroundStyle(.white)
                .padding()
        }
    }

    @ViewBuilder
    private func TrendingCarousel() -> some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 15) {
                    ForEach(1 ... 10, id: \.self) { num in
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(hue: Double(num) / 10, saturation: 1, brightness: 1).gradient)
                            .frame(height: 200)
                            .containerRelativeFrame(.horizontal, count: 3, spacing: 20)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .contentMargins(.horizontal, 20, for: .scrollContent)
        } header: {
            Text("Trending Today")
                .font(.title)
                .bold()
                .foregroundStyle(.white)
                .padding()
        }
    }
}

#Preview {
    HomeScreen()
}
