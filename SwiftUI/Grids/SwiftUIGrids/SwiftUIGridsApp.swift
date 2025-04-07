//
//  SwiftUIGridsApp.swift
//  SwiftUIGrids
//
//  Created by A.J. van der Lee on 31/03/2025.
//

import SwiftUI

@main
struct SwiftUIGridsApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab("Static Grid", systemImage: "grid") {
                    StaticGridView()
                }
                Tab("LazyHGrid", systemImage: "tortoise") {
                    LazyHGridExample()
                }
                Tab("LazyVGrid", systemImage: "tortoise") {
                    LazyVGridExample()
                }
            }
        }
    }
}
