//
//  ActionButtonsView.swift
//  CloseToMe
//
//  Created by Jason Sanchez on 6/19/24.
//

import SwiftUI
import MapKit

struct ActionButtonsView: View {
    let mapItem: MKMapItem
    
    var body: some View {
        HStack {
            Button(action: {
                // action
            }, label: {
                HStack {
                    Image(systemName: "phone.fill")
                    Text("E.T. Phone Home")
                }
            }).buttonStyle(.bordered)
            
            Button(action: {
                MKMapItem.openMaps(with: [mapItem])
            }, label: {
                HStack {
                    Image(systemName: "car.circle.fill")
                    Text("Let's Go!")
                }
            }).buttonStyle(.bordered)
                .tint(.mint)
            
            Spacer()
        }
    }
}

#Preview {
    ActionButtonsView(mapItem: PreviewData.apple)
}
