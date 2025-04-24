//
//  ContentView.swift
//  SwiftUIForEach
//
//  Created by A.J. van der Lee on 24/04/2025.
//

import SwiftUI

//struct ContentView: View {
//    let names = ["Antoine", "Maaike", "Sep", "Jip"]
//
//    var body: some View {
//        ForEach(names, id: \.self) { name in
//            Text(name)
//        }
//    }
//}

struct Person: Identifiable {
    let id: UUID
    let name: String
}

struct ContentView: View {
    let people = [
        Person(id: UUID(), name: "Antoine"),
        Person(id: UUID(), name: "Maaike")
    ]

    var body: some View {
        List {
            
            
            ForEach(Array(people.enumerated()), id: \.offset) { index, person in
                Text("Index \(index): \(person.name)")
            }
            
            ForEach(people) { person in
                HStack {
                    Image(systemName: "person")
                    Text(person.name)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
