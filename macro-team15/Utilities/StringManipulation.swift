//
//  StringManipulation.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 02/12/22.
//

import Foundation

class StringManipulation {
    static func categoryStimulus(cat: [MilestoneCategory]) -> String {
        var string: String = ""
        
        cat.forEach { item in
            if item == cat.last && cat.count != 1 {
                string.append("dan \(item.rawValue.lowercased())")
            } else {
                string.append("\(item.rawValue.lowercased()) ")
            }
        }
        return string
    }
}
