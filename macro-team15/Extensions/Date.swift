//
//  Date.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 08/11/22.
//

import Foundation

extension Date {
    
    func dmYFormat() -> String {
        let dateFormatter = DateFormatter()
//        dateFormatter.setLocalizedDateFormatFromTemplate("yyyy-MM-dd")
        
        dateFormatter.setLocalizedDateFormatFromTemplate("dd MMMM yyyy")
        return dateFormatter.string(from: self)
    }
    
}
