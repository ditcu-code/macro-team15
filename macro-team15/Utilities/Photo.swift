//
//  Photo.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 05/12/22.
//

import SwiftUI

struct Photo: Transferable {
    
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.image)
    }
    
    public var image: Image
    public var caption: String
    
}
