//
//  StaticGridView.swift
//  SwiftUIGrids
//
//  Created by A.J. van der Lee on 31/03/2025.
//

import SwiftUI

struct StaticGridView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 15) {
                Text("Without ForEach")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top)
                Grid(horizontalSpacing: 30, verticalSpacing: 30) {
                    GridRow {
                        Text("(0, 0)")
                        Text("(1, 0)")
                        Text("(2, 0)")
                    }
                    
                    GridRow {
                        Text("(0, 1)")
                        Text("(1, 1)")
                        Text("(2, 1)")
                    }
                    
                    GridRow {
                        Text("(0, 2)")
                        Text("(1, 2)")
                        Text("(2, 2)")
                    }
                }
                
                Text("With ForEach")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top)
                Grid(horizontalSpacing: 30, verticalSpacing: 30) {
                    ForEach(0..<3) { row in
                        GridRow {
                            ForEach(0..<3) { column in
                                Text("(\(column), \(row))")
                            }
                        }
                    }
                }
            }.padding().navigationTitle("Static Grid")
        }
    }
}

#Preview {
    StaticGridView()
}

#Preview("Grid Cell Columns Modifier", traits: .fixedLayout(width: 1000, height: 500)) {
    HStack(spacing: 30) {
        VStack {
            Text("Without gridCellColumns modifier:").bold()
            Grid(horizontalSpacing: 30, verticalSpacing: 30) {
                ForEach(0..<3) { row in
                    GridRow {
                        ForEach(0..<3) { column in
                            Text("(\(column), \(row))")
                        }
                    }
                }
                GridRow {
                    Text("Full Width, for example for footers!")
                }
            }.padding().background(Color(.systemOrange))
        }
        VStack {
            Text("With gridCellColumns modifier:").bold()
            Grid(horizontalSpacing: 30, verticalSpacing: 30) {
                ForEach(0..<3) { row in
                    GridRow {
                        ForEach(0..<3) { column in
                            Text("(\(column), \(row))")
                        }
                    }
                }
                GridRow {
                    Text("Full Width, for example for footers!")
                        .gridCellColumns(3)
                }
            }.padding().background(Color.black).foregroundStyle(.white)
        }
    }
}

#Preview("Grid gridCellUnsizedAxes modifier", traits: .fixedLayout(width: 1000, height: 500)) {
    HStack(spacing: 30) {
        VStack {
            Text("Without gridCellUnsizedAxes modifier:").bold()
            Grid(horizontalSpacing: 30, verticalSpacing: 30) {
                GridRow {
                    Text("(0, 0)")
                    Text("(1, 0)")
                    Text("(2, 0)")
                }
                Divider()
                GridRow {
                    Text("(0, 1)")
                    Text("(1, 1)")
                    Text("(2, 1)")
                }
            }.padding().background(Color(.systemOrange))
        }
        VStack {
            Text("With gridCellUnsizedAxes modifier:").bold()
            Grid(horizontalSpacing: 30, verticalSpacing: 30) {
                GridRow {
                    Text("(0, 0)")
                    Text("(1, 0)")
                    Text("(2, 0)")
                }
                Divider()
                    .gridCellUnsizedAxes(.horizontal)
                GridRow {
                    Text("(0, 1)")
                    Text("(1, 1)")
                    Text("(2, 1)")
                }
            }.padding().background(Color.black).foregroundStyle(.white)
        }
    }
}

#Preview("Columns count, alignment, and spacing", traits: .fixedLayout(width: 1000, height: 500)) {
    Grid(alignment: .bottom, horizontalSpacing: 5, verticalSpacing: 5) {
        GridRow {
            Text("Row 1")
                .frame(width: 100)
            ForEach(0..<2) { _ in Color.red }
        }
        GridRow {
            Text("Row 2")
                .gridCellAnchor(.top)
            ForEach(0..<5) { _ in Color.white }
        }
        GridRow {
            Text("Row 3")
                .gridColumnAlignment(.trailing)
            ForEach(0..<4) { _ in Color.blue }
        }
    }.padding(40).background(Color.black).foregroundStyle(.white)
}
