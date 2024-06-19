//
//  MapUtilities.swift
//  CloseToMe
//
//  Created by Jason Sanchez on 6/13/24.
//

import Foundation
import MapKit

func makeCall(phone: String) {
    if let url = URL(string: "tel://\(phone)") {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            print("E.T. Not Home")
        }
    }
}

func calculateDirections(from: MKMapItem, to: MKMapItem) async ->  MKRoute? {
    let directionsRequest = MKDirections.Request()
    directionsRequest.transportType = .automobile
    directionsRequest.source = from
    directionsRequest.destination = to
    
    let directions = MKDirections(request: directionsRequest)
    let response = try? await directions.calculate()
    return response?.routes.first
}

func calculateDistance(from: CLLocation, to: CLLocation) -> Measurement<UnitLength> {
    let distanceInFeet = from.distance(from: to)
    return Measurement(value: distanceInFeet, unit: .feet)
}

func performSearch(searchTerm: String, visibleRegion: MKCoordinateRegion?) async throws -> [MKMapItem] {
    let request = MKLocalSearch.Request()
    request.naturalLanguageQuery = searchTerm
    request.resultTypes = .pointOfInterest
    
    guard let region = visibleRegion else { return [] }
    request.region = region
    
    let search = MKLocalSearch(request: request)
    let response = try await search.start()
    
    return response.mapItems
}
