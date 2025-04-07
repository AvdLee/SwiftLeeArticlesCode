//
//  LazyVGrid.swift
//  SwiftUIGrids
//
//  Created by A.J. van der Lee on 31/03/2025.
//

import SwiftUI

struct LazyVGridExample: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(
                    columns: [
                        GridItem(.fixed(100)),
                        GridItem(.flexible(minimum: 50, maximum: .infinity)),
                        GridItem(.flexible(minimum: 50, maximum: .infinity))
                    ],
                    alignment: .leading,
                    spacing: 10
                ) {
                    ForEach(0..<1000, id: \.self) { column in
                        Text("\(column)")
                            .frame(height: 100)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
                            .border(Color.gray)
                    }
                }.padding()
            }
            .navigationTitle("LazyVGrid")
        }
    }
}

struct LazyHGridExample: View {
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                LazyHGrid(rows: [
                    GridItem(.fixed(100)),
                    GridItem(.flexible(minimum: 50, maximum: .infinity)),
                    GridItem(.flexible(minimum: 50, maximum: .infinity))
                ], alignment: .top, spacing: 10) {
                    ForEach(0..<1000, id: \.self) { column in
                        Text("\(column)")
                            .frame(width: 100)
                            .frame(maxHeight: .infinity)
                            .background(Color.gray.opacity(0.2))
                            .border(Color.gray)
                    }
                }.padding()
            }
            .navigationTitle("LazyHGrid")
        }
    }
}

#Preview("LazyVGrid Example") {
    LazyVGridExample()
}

#Preview("LazyHGrid Example") {
    LazyHGridExample()
}
