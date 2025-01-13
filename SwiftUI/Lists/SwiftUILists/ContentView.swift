//
//  ContentView.swift
//  SwiftUILists
//
//  Created by A.J. van der Lee on 13/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink("Static list", destination: StaticListView().navigationTitle("Static List"))
                    NavigationLink("Dynamic list", destination: DynamicListView().navigationTitle("Dynamic List"))
                    NavigationLink("Expandable Sections list", destination: ExpandableSectionsListView().navigationTitle("Expandable List"))
                    NavigationLink("Selection list", destination: SelectionEditModeListView().navigationTitle("Selection List"))
                    NavigationLink("SF Symbol Selection list", destination: SelectionSFSymbolListView().navigationTitle("SF Symbol Selection List"))
                    NavigationLink("Custom list background", destination: CustomBackgroundListView().navigationTitle("Custom list background"))
                } header: {
                    Text("Static vs. Dynamic")
                }
                
                Section {
                    NavigationLink("Plain", destination: GroupedListView(listStyle: .plain).navigationTitle("Plain List Style"))
                    NavigationLink("Inset", destination: GroupedListView(listStyle: .inset).navigationTitle("Inset List Style"))
                    NavigationLink("Grouped", destination: GroupedListView(listStyle: .grouped).navigationTitle("Grouped List Style"))
                    NavigationLink("Inset Grouped", destination: GroupedListView(listStyle: .insetGrouped).navigationTitle("Inset Grouped List Style"))
                    NavigationLink("Sidebar", destination: GroupedListView(listStyle: .sidebar).navigationTitle("Sidebar List Style"))
                } header: {
                    Text("Different List Styles")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct StaticListView: View {
    var body: some View {
        List {
            Text("Antoine")
            Text("Maaike")
            Text("Sep")
            Text("Jip")
        }
    }
}

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
}

struct DynamicListView: View {
    
    var people: [Person] = [
        Person(name: "Antoine van der Lee", age: 34),
        Person(name: "Maaike", age: 6),
        Person(name: "Sep", age: 3),
        Person(name: "Jip", age: 1)
    ]
    
    var body: some View {
        List(people) { person in
            Text(person.name)
        }
    }
}

struct ExpandableSectionsListView: View {
    
    @State private var isExpanded = true
    
    var body: some View {
        List {
            Section(isExpanded: $isExpanded) {
                Text("Antoine")
                Text("Maaike")
                Text("Sep")
                Text("Jip")
            } header: {
                Text("Expandable section")
            }
        }.listStyle(.sidebar)
    }
}

struct SelectionEditModeListView: View {
    
    var people: [Person] = [
        Person(name: "Antoine van der Lee", age: 34),
        Person(name: "Maaike", age: 6),
        Person(name: "Sep", age: 3),
        Person(name: "Jip", age: 1)
    ]

    @State var selectedPeopleIdentifiers: Set<UUID> = []
    
    var body: some View {
        List(people, selection: $selectedPeopleIdentifiers) { person in
            Text(person.name)
        }
        .toolbar { EditButton() }
        Text("Selected \(selectedPeopleIdentifiers.count) item(s)")
    }
}

struct SelectionSFSymbolListView: View {
    
    var people: [Person] = [
        Person(name: "Antoine van der Lee", age: 34),
        Person(name: "Maaike", age: 6),
        Person(name: "Sep", age: 3),
        Person(name: "Jip", age: 1)
    ]

    @State var selectedPeopleIdentifiers: Set<UUID> = []
    
    var body: some View {
        List(people, selection: $selectedPeopleIdentifiers) { person in
            Label(person.name, systemImage: selectedPeopleIdentifiers.contains(person.id) ? "checkmark.circle" : "circle")
        }
        Text("Selected \(selectedPeopleIdentifiers.count) item(s)")
    }
}

struct CustomBackgroundListView: View {
    var body: some View {
        List {
            Text("Antoine")
            Text("Maaike")
            Text("Sep")
            Text("Jip")
        }
            /// Using just this background modifier is not enough.
            .background(Color.orange)
        
            /// The key is to disable the scroll content background as well:
            .scrollContentBackground(.hidden)
    }
}




struct GroupedListView<ContentListStyle: ListStyle>: View {
    
    let listStyle: ContentListStyle
    
    var body: some View {
        List {
            Section {
                Text("Antoine")
                Text("Maaike")
            } header: {
                Text("Parents")
            } footer: {
                Text("End of parents section")
            }
            
            Section {
                Text("Sep")
                Text("Jip")
            } header: {
                Text("Kids")
            } footer: {
                Text("End of kids section")
            }
        }.listStyle(listStyle)
    }
}
