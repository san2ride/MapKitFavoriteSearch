//
//  MeasurementFormatter+Ext.swift
//  CloseToMe
//
//  Created by Jason Sanchez on 6/14/24.
//

import Foundation

extension MeasurementFormatter {
    static var distance: MeasurementFormatter {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .medium
        formatter.unitOptions = .naturalScale
        formatter.locale = Locale.current
        return formatter
    }
}
