//
//  ContentView.swift
//  SwiftUIPicker
//
//  Created by A.J. van der Lee on 10/03/2025.
//

import SwiftUI

import SwiftUI

enum AppTheme: String, CaseIterable, Identifiable {
    case light = "Light"
    case dark = "Dark"
    case system = "System Default"
    
    var id: String { self.rawValue }
}

struct ThemePickerView: View {
    @State private var selectedTheme: AppTheme = .system
    @State private var selectedColor: Color = .red

    var body: some View {
        NavigationStack {
            Form {
                
                Section("Segmented Style") {
                    Picker("Select Theme", selection: $selectedTheme) {
                        ForEach(AppTheme.allCases) { theme in
                            Text(theme.rawValue).tag(theme)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Menu Style") {
                    Picker("Select Theme", selection: $selectedTheme) {
                        ForEach(AppTheme.allCases) { theme in
                            Text(theme.rawValue).tag(theme)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section("Inline Style") {
                    Picker("Select Theme", selection: $selectedTheme) {
                        ForEach(AppTheme.allCases) { theme in
                            Text(theme.rawValue).tag(theme)
                        }
                    }
                    .pickerStyle(.inline)
                    .labelsHidden()
                }
                
                Section("Automatic Style") {
                    Picker("Select Theme", selection: $selectedTheme) {
                        ForEach(AppTheme.allCases) { theme in
                            Text(theme.rawValue).tag(theme)
                        }
                    }
                    .pickerStyle(.automatic)
                }
                
                Section("Navigation Link Style") {
                    Picker("Select Theme", selection: $selectedTheme) {
                        ForEach(AppTheme.allCases) { theme in
                            Text(theme.rawValue).tag(theme)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Palette Style") {
                    Picker("Select Theme", selection: $selectedTheme) {
                        ForEach(AppTheme.allCases) { theme in
                            Text(theme.rawValue).tag(theme)
                        }
                    }
                    .pickerStyle(.palette)
                }
                
                Section("Wheel Style") {
                    Picker("Select Theme", selection: $selectedTheme) {
                        ForEach(AppTheme.allCases) { theme in
                            Text(theme.rawValue).tag(theme)
                        }
                    }
                    .pickerStyle(.wheel)
                }
                
                Section("Color Picker") {
                    ColorPicker("Choose a color", selection: $selectedColor)
                        .padding()
                    Rectangle()
                        .fill(selectedColor)
                        .frame(height: 32)
                        .cornerRadius(8)
                }
            }.navigationTitle("SwiftUI Picker Styles")
        }
    }
}

#Preview {
    ThemePickerView()
}
