//
//  CloseToMeView.swift
//  CloseToMe
//
//  Created by Jason Sanchez on 6/12/24.
//

import SwiftUI
import MapKit

struct CloseToMeView: View {
    
    @State private var query: String = ""
    @State private var selectedDetent: PresentationDetent = .fraction(0.15)
    
    var body: some View {
        ZStack {
            Map()
                .sheet(isPresented: .constant(true), content: {
                    VStack {
                        TextField("Search", text: $query)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                            .onSubmit {
                                // code fired when you tap return in TextField
                            }
                        Spacer()
                    }
                        .presentationDetents([.fraction(0.15), .medium, .large], selection: $selectedDetent)
                        .presentationDragIndicator(.visible)
                        .interactiveDismissDisabled()
                        .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                })

        }
    }
}

#Preview {
    CloseToMeView()
}
