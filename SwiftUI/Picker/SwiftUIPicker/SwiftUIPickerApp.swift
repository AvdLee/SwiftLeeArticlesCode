//
//  SwiftUIPickerApp.swift
//  SwiftUIPicker
//
//  Created by A.J. van der Lee on 10/03/2025.
//

import SwiftUI

@main
struct SwiftUIPickerApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                CustomColorPickerView()
                    .tabItem {
                        Image(systemName: "paintpalette")
                        Text("Colors")
                    }

                ThemePickerView()
                    .tabItem {
                        Image(systemName: "paintbrush")
                        Text("Themes")
                    }
            }
        }
    }
}
