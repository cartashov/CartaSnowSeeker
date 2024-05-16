//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Михаил Карташов on 16.05.2024.
//

import SwiftUI


struct ContentView: View {
    @State private var searchText = ""
    
    let allNames = ["Misha", "Sasha", "Dasha", "Pasha"]
    
    var filteredNames: [String] {
        if searchText.isEmpty {
            allNames
        } else {
            allNames.filter { name in
                name.localizedStandardContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredNames, id: \.self) { name in
                Text(name)
                }
            .searchable(text: $searchText, prompt: "Look for something")
            .navigationTitle("Searching")
        }
    }
}

#Preview {
    ContentView()
}
