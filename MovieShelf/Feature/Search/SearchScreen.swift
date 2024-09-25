//
//  SearchScreen.swift
//  MovieShelf
//
//  Created by Nanda WK on 2024-09-23.
//

import SwiftUI

struct SearchScreen: View {
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 3)

    @State private var selectedSegment = 0
    @State private var searchText = ""

    let segments = ["Movie", "Series"]

    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .appSecondary
        UISegmentedControl.appearance()
            .setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        UISegmentedControl.appearance()
            .setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)

    }

    var body: some View {
        VStack {
            Picker("Select an option", selection: $selectedSegment) {
                ForEach(0 ..< segments.count, id: \.self) { index in
                    Text(segments[index])
                        .tag(index)
                }
            }
            .pickerStyle(.segmented)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.appSecondary, lineWidth: 1)
            )
            .padding()

            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(1 ... 100, id: \.self) { num in
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(hue: Double(num) / 10, saturation: 1, brightness: 1).gradient)
                            .frame(height: 200)
                    }
                }
                .padding()
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                TextField("Serach", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .onAppear {
                        UITextField.appearance().clearButtonMode = .whileEditing
                    }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(.appPrimary)
    }
}

#Preview {
    NavigationStack {
        SearchScreen()
    }
}
