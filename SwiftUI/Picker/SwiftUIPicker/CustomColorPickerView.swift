//
//  CustomColorPickerView.swift
//  SwiftUIPicker
//
//  Created by A.J. van der Lee on 10/03/2025.
//

import SwiftUI

struct CustomColorPickerView: View {
    @State private var selectedColor: Color = .red

    var body: some View {
        Form {
            Section {
                ColorPicker("Choose a color", selection: $selectedColor)
                
                HStack {
                    Text("Selected color:")
                    Spacer()
                    Rectangle()
                        .fill(selectedColor)
                        .frame(width: 40, height: 20)
                        .cornerRadius(8)
                }
            }
        }
    }
}
