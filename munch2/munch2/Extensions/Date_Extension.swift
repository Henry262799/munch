//
//  Date_Extension.swift
//  munch2
//
//  Created by Angelina Chen on 4/27/24.
//

import Foundation

extension Date {

    /**
     Returns a string representation of the amount of time from this date to now

     For example, if today is July 1 7:00 PM and this date was July 1 6:50 PM, this function returns `"10 min. ago"`
    */
    func convertToAgo() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(for: self, relativeTo: Date())
    }

}
