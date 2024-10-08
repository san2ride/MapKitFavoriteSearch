//
//  SearchOptionsView.swift
//  CloseToMe
//
//  Created by Jason Sanchez on 6/14/24.
//

import SwiftUI

struct SearchOptionsView: View {
    
    let searchOptions = [
        "Stadiums and Arenas":
        "trophy.fill", "Pub":
        "figure.dress.line.vertical.figure",
        "Cocktail Bar": "wineglass",
        "Restaurants": "fork.knife",
        "Hotels": "bed.double.fill",
        "Coffee": "cup.and.saucer.fill",
        "Gas": "fuelpump.fill",
        "Nightclub": "bolt.circle.fill"
    ]
    
    let onSelected: (String) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(searchOptions.sorted(by: >), id: \.0) { key, value in
                    Button(action: {
                        onSelected(key)
                    }, label: {
                        HStack {
                            Image(systemName: value)
                            Text(key)
                        }
                    })
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 236/255, green: 240/255, blue: 241/255, opacity: 1.0))
                    .foregroundStyle(.black)
                    .padding(4)
                }
            }
        }
    }
}

#Preview {
    SearchOptionsView(onSelected: { _ in })
}
