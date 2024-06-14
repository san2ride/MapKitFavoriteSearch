//
//  SearchBarView.swift
//  CloseToMe
//
//  Created by Jason Sanchez on 6/14/24.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var search: String
    @Binding var isSearching: Bool
    
    var body: some View {
        VStack {
            TextField("Search", text: $search)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onSubmit {
                    isSearching = true
                }
            SearchOptionsView { searchOption in
                search = searchOption
                isSearching = true
            }
            .padding([.leading], 10)
            .padding([.bottom], 5)
        }
    }
}

#Preview {
    SearchBarView(search: .constant("Hotels"), isSearching: .constant(true))
}
