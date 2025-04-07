//
//  ContentView.swift
//  SwiftUITabView
//
//  Created by A.J. van der Lee on 24/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Int = 0
    @AppStorage("tab-view-customization")
    private var customization: TabViewCustomization
    
    var body: some View {
        TabView(selection: $selection) {
            Tab("Home", systemImage: "house", value: 0) {
                Button("Go to settings") {
                    selection = 3
                }
            }

            TabSection("Messages Related") {
                Tab("Messages", systemImage: "message", value: 1) {
                    MessagesView()
                }
                    .customizationID("com.swiftlee.tab.messages")
                    // You can use integers:
                    .badge(2)
                Tab("Archive", systemImage: "archivebox", value: 2) {
                    MessagesArchiveView()
                }
                    .customizationID("com.swiftlee.tab.messages.archive")
                    // You can use integers:
                    .badge(2)
            }
            Tab("Settings", systemImage: "gear", value: 3) {
                SettingsView()
            }
                .customizationID("com.swiftlee.tab.settings")
                // Or you can use a `String`:
                .badge("!")
        }
        .tabViewStyle(.sidebarAdaptable)
        .tabViewCustomization($customization)
    }
}

struct HomeView: View {
    var body: some View {
        Text("Home View")
    }
}

struct MessagesView: View {
    var body: some View {
        Text("Messages View")
    }
}

struct MessagesArchiveView: View {
    var body: some View {
        Text("Messages Archive View")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings View")
    }
}

#Preview {
    ContentView()
}

struct CustomizationTabView: View {
    
    @AppStorage("tab-view-customization")
    private var customization: TabViewCustomization
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
               HomeView()
            }

            Tab("Messages", systemImage: "message") {
                MessagesView()
            }
                .customizationID("com.swiftlee.tab.messages")
            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
                .customizationID("com.swiftlee.tab.settings")
        }
        .tabViewStyle(.sidebarAdaptable)
        .tabViewCustomization($customization)
    }
}

struct SectionsTabView: View {
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }

            TabSection("Messages Related") {
                Tab("Messages", systemImage: "message") {
                    MessagesView()
                }
                Tab("Archive", systemImage: "archivebox") {
                    MessagesArchiveView()
                }
            }.defaultVisibility(.hidden, for: .tabBar)
                .sectionActions {
                    Button("Write new message") {
                        // ...
                    }
                }

            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}
